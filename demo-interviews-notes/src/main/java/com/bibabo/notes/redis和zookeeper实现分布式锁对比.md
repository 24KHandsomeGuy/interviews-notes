首先感谢正国哥今天例会上的提问，当被问到curator和redisson的优劣势时我语塞了，因为没有过深度思考，假若面试问到，没有经过深度思考是很难回答好的，所以整理了一下

# Redisson和Curator对比

### Redisson实现

**加锁setnx(key)、 放锁删掉key、 等待锁轮询**

#### lock()加锁以及争抢锁失败

我以前也会认为redis实现分布式锁是while(true)一直轮询，这样很耗费CPU资源。

下面代码为客服系统之前的同学写的分布式锁

```java
while (true){
    // 每睡眠一小段时间再次重试
    Thread.sleep(time);
    log.info("key:"+key+",经过:"+time+"休息开始重试添加分布式锁");
    Long pttlNum= jedis.pttl(key); //获取key的剩余时间 返回 -2   表示这个key已过期，已不存在 返回 -1   表示这个key没有设置有效期  返回0以上的值   表示是这个key的剩余有效时间
    log.info("key:"+key+",剩余过期时间:"+pttlNum);
    if(0L>pttlNum){
        String value111=  jedis.get(key);
        log.info("key:"+key+",获取在redis中的结果:"+value111);
        if(null == value111){
            log.info("key:"+key+",value:"+putValue1+"重试添加分布式锁，分布式锁过期时间:"+time);
            setNxResult= jedis.set(key,putValue1,"NX","PX",time);   //如果成功返回OK,失败返回null
            log.info("key:"+key+",重试添加分布式锁结果:"+setNxResult);
            if(setNxResult !=null &&  "OK".equals(setNxResult)){
                return "1";
            }
        }
    }
}
```

**但是Redisson这里做了优化**

1.异步通过pubsub监听channel，释放锁的时候会向这个channel发布一个0L的消息

2.不同进程的监听节点还是会出现惊群现象这个无法避免，但是同进程多线程监听同一节点使用Semaphore做到了只有一个线程争抢到锁

```java
@Override
    public void lockInterruptibly(long leaseTime, TimeUnit unit) throws InterruptedException {
        long threadId = Thread.currentThread().getId();
        // 直接获取一次锁
        Long ttl = tryAcquire(leaseTime, unit, threadId);
        // lock acquired
        if (ttl == null) {
            return;
        }
		// 异步通过pubsub监听channel，放锁的时候会向这个channel发布一个消息
        RFuture<RedissonLockEntry> future = subscribe(threadId);
        commandExecutor.syncSubscription(future);

        try {
            while (true) {
                // 尝试获取锁
                ttl = tryAcquire(leaseTime, unit, threadId);
                // lock acquired
                // 获取锁成功
                if (ttl == null) {
                    break;
                }

                // waiting for message
                if (ttl >= 0) {
                    // 同进程内多线程争抢同把分布式锁采用信号量，此处阻塞，上述pubsub监听回调会释放资源，重试获取锁
                    getEntry(threadId).getLatch().tryAcquire(ttl, TimeUnit.MILLISECONDS);
                } else {
                    getEntry(threadId).getLatch().acquire();
                }
            }
        } finally {
            unsubscribe(future, threadId);
        }
//        get(lockAsync(leaseTime, unit));
    }
```

#tryLockInnerAsync 以下是该方法尝试获取的lua脚本

```lua
"if (redis.call('exists', KEYS[1]) == 0) then " +
    "redis.call('hset', KEYS[1], ARGV[2], 1); " +
    "redis.call('pexpire', KEYS[1], ARGV[1]); " +
    "return nil; " +
"end; " +
"if (redis.call('hexists', KEYS[1], ARGV[2]) == 1) then " +
    "redis.call('hincrby', KEYS[1], ARGV[2], 1); " +
    "redis.call('pexpire', KEYS[1], ARGV[1]); " +
    "return nil; " +
"end; " +
"return redis.call('pttl', KEYS[1]);"
```

#### unlock() 放锁

释放锁脚本

```lua
"if (redis.call('exists', KEYS[1]) == 0) then " +
    "redis.call('publish', KEYS[2], ARGV[1]); " +
    "return 1; " +
"end;" +
"if (redis.call('hexists', KEYS[1], ARGV[3]) == 0) then " +
    "return nil;" +
"end; " +
"local counter = redis.call('hincrby', KEYS[1], ARGV[3], -1); " +
"if (counter > 0) then " +
    "redis.call('pexpire', KEYS[1], ARGV[2]); " +
    "return 0; " +
"else " +
    "redis.call('del', KEYS[1]); " +
// 此处publish了一个channel=channelname 值为0L
    "redis.call('publish', KEYS[2], ARGV[1]); " +
    "return 1; "+
"end; " +
"return nil;"
```



### **Curator实现**

**加锁写入临时有序节点、放锁删除节点、等待锁则使用watcher机制监听前一节点删除事件回调**

类LockInternals

#### internalLockLoop()获取锁和争抢锁失败

```java
private boolean internalLockLoop(long startMillis, Long millisToWait, String ourPath) throws Exception
{
    boolean     haveTheLock = false;
    boolean     doDelete = false;
    try
    {
        if ( revocable.get() != null )
        {
            client.getData().usingWatcher(revocableWatcher).forPath(ourPath);
        }

        while ( (client.getState() == CuratorFrameworkState.STARTED) && !haveTheLock )
        {
        // 排序返回我们的锁节点下的所有临时有序子节点
            List<String>        children = getSortedChildren();
            String              sequenceNodeName = ourPath.substring(basePath.length() + 1); // +1 to include the slash

            PredicateResults    predicateResults = driver.getsTheLock(client, children, sequenceNodeName, maxLeases);
            if ( predicateResults.getsTheLock() )
            {
                haveTheLock = true;
            }
            else
            {
            // 监听前一个节点的路径path，此wathcher会noityAll下面的wait就不截代码了
                String  previousSequencePath = basePath + "/" + predicateResults.getPathToWatch();

                synchronized(this)
                {
                    try
                    {
                        // use getData() instead of exists() to avoid leaving unneeded watchers which is a type of resource leak
                        client.getData().usingWatcher(watcher).forPath(previousSequencePath);
                        if ( millisToWait != null )
                        {
                            millisToWait -= (System.currentTimeMillis() - startMillis);
                            startMillis = System.currentTimeMillis();
                            if ( millisToWait <= 0 )
                            {
                                doDelete = true;    // timed out - delete our node
                                break;
                            }
                            // wathcher会noityAll
						// 超时时间的阻塞
                            wait(millisToWait);
                        }
                        else
                        {
                        // 不带超时时间的阻塞
                            wait();
                        }
                    }
                    catch ( KeeperException.NoNodeException e )
                    {
                        // it has been deleted (i.e. lock released). Try to acquire again
                    }
                }
            }
        }
    }
    catch ( Exception e )
    {
        ThreadUtils.checkInterrupted(e);
        doDelete = true;
        throw e;
    }
    finally
    {
        if ( doDelete )
        {
            deleteOurPath(ourPath);
        }
    }
    return haveTheLock;
}
```

#### releaseLock()释放锁会删除节点

```
private void deleteOurPath(String ourPath) throws Exception
{
    try
    {
        client.delete().guaranteed().forPath(ourPath);
    }
    catch ( KeeperException.NoNodeException e )
    {
        // ignore - already deleted (possibly expired session, etc.)
    }
}
```



# redis和zookeeper对比

### redis

我们的redis使用sentinel做高可用，正常运行状态，master向slave异步增量同步

如若master宕机，锁也会随之失效，锁不够健壮

### zookeeper

zookeeper集群强一致性特点，leader和follower根据ZAB协议保证数据节点一致。

虽然写操作的效率较低，但是锁足够健壮



# 结论

对比点1结论：

​						curator的watcher监听做到了所有节点免惊群效应，避免了任何CPU资源的浪费

​						而redisson虽然通过Semaphore可以做到进程内的免惊群效应，但是pubsub频道监听无法避免多进程的惊群。还是会造成CPU资源的浪费

对比点2结论：

​						redis的性能更强但是锁不够健壮

​						zk的锁更健壮但是性能稍弱

实际应用取决于真实场景