# Redis

1kb等于1024字节

1字节8比特位

分布式缓存

C语言写的

0-15 16个分区

单线程、无线程安全问题

### 五种数据类型

#### String

可以存储 字符串、整数、浮点

整数：可以使用incr()原子递增

##### 实战：1.作计数器，比如修改订单状态里，妥投和拒收两种状态可以相互更改，修改状态成功后，需要处理后续得流程，比如妥投要推结算，三方订单妥投或拒收要mq发送给三方系统，使用incr()，可以作幂等、可以作并发控制   

String类型在Redis底层是使用什么数据结构存储的？

答： int / SDS int存储整型，SDS存储字符和浮点

C语言的字符无法存储二进制，存储字符串'\0'结尾 如果字符串里含有空格 那么空格后面的字符将不会被识别

所以使用SDS sdshdr8  默认长度2^8 - 1  sdshdr 5、8、16、32、64

##### 应用场景：Session共享、keyvalue的缓存比如订单里有春播卡展示卡号

#### List

Redis底层是如何存储来实现这种数据类型的？

redis3.2之前使用的是LinkedList（双向链表，内存占用多，插入删除快）和ZipList（存储元素个数少或者长度短，使用压缩链表、连续内存、占用少，插入删除稍慢）

redis3.2开始使用quickList（基于ZipList的双向链表）

quickListNode{

```
	prev;

	next;

	zipList;// 压缩存储空间，提高存储效率这是list（entry1、entry2）
```

}

##### 应用场景：消费队列（左进右出）、栈（左进左出）

#### Hash

key -> value( filed -> value;filed -> value;filed -> value;) 

也是使用链表解决hash碰撞的

##### 应用场景：宅急送快递推tms时，每一天要为其生成一个批次交接单，交接单对象用Map存储

#### Set

不可重复、无序

##### 应用场景：每日单独成箱质检录入爆品、一堆Sku要Set

Redis底层是如何存储来实现这种数据类型的？

intSet hashTable

如果使用hashTable时，只是用key做存储，value是空的

intset只存储整数类型，使用数组顺序存储，查找二分查找

#### SortedSet

key -> value( score -> value )

可以通过score作排序

Redis底层是如何存储来实现这种数据类型的？

ziplist 或者 skiplist + hashtable

##### 应用场景：需要存排名

### 过期时间

像库房详情warehouse这种redis缓存，不需要设置过期时间

其余绝大多数场景都需要设置过期时间

expire(key, 过期时间);

setex(key ,value, 过期时间)

ttl命令查看剩余过期时间

persist 对key持久化 不需要过期了

**删除过期的key的策略**

1.消极方法：

已经过期了，再一次读取的时候会删除

2.积极方法：周期性的从设置了过期时间的key中选择一部分的key进行删除

  (1)随机测试20个带有超时时间的key

  (2) 如果超过25%的key被删除，则重复执行整个流程

### Rdis内存回收策略

当内存达到一定大时，淘汰一些对象

redis.conf

maxmemory-policy 默认是noeviction直接报错

allkeys-lru 所有的key（设置过期时间和没设置过期时间都算上）最少使用的数据淘汰

allkeys-random 所有的key随机淘汰

volatile-random（随机）/lru（最少使用）/ttl（即将过期） 以上都是设置了过期时间的

### Redis为什么单线程性能却很高？

redis的限制在于：内存和网络带宽

性能高是因为使用到了多路复用

### Redis持久化

1.使用redis作Nosql数据库

2.redis出现故障，快速恢复redis

#### RDB（快照）默认、AOF（事务日志）

RDB:当符合【条件】时，会fork一个子进程  生成dump.rdb文件 进行io操作

条件有4种：1.配置规则 redis.conf  save seconds changes  或的关系

```
														 save 900 1

														 save 300 10

														 save 60 10000

				 2.客户端主动save（阻塞所有来自客户端的请求）或者bgsave（异步后台备份）

                 3.客户端flushall 

                4.执行复制操作 master-slave
```

缺点：两次快照的间隔 会出现数据丢失

AOF：事务操作追加到文件、像实时日志一样、记录所有事务行为。效率会低

redis.conf   Append Only no  改为yes 开启

redis支持两种模式同时存在，但是AOF的优先级更高，启动时会直接加载AOF文件

AOF很大的时候会重写，fork子进程重写，重写的过程中，把后续的指令再记录，再合并

操作系统缓存刷到硬盘 默认是1s

aof的修改内容持久化写入aof file的步骤
aof buffer → os buffer → aof file
appendfsync=always，每次修改事件都将aof buffer的内容写到aof文件并同步aof文件，这种同步策略的安全性最高，效率最低，发生系统奔溃时最多丢失一个事件循环的数据。
appendfsync=everysec，每次修改都aof buffer内容写到aof文件，每秒同步一次aof文件，这种同步策略与每次修改都同步的策略相比，安全性差一些，但性能高一些，是性能与安全性的折中，发生系统奔溃时最多会丢失1s的数据。
appendsync=no，每次修改都将aof buffer内容写到aof文件，同步动作的进行时机交给操作系统来决定，redis不管，这种安全性最低，但性能最好。操作系统系统一般考虑繁忙程度以及其它一些因素综合判断同步时机。

appendsync=no同步策略与binlog的binlog_sync=0的刷盘策略思路是一样的，都是将刷盘的时机判断脚背操作系统。


dump.rdb 或者 appendonly.aof文件 在服务器启动时 会自动加载到redis里

### Redis的Lua脚本

eval 执行lua脚本

### 发布订阅

pub / sub

Bloomfilter单点内，分布式情况下的新增或删除如何通知到其他节点

## 分布式Redis

### 主从

从节点redis.conf  配置salveof 主ip 主port

主节点宕机后，无法选出新的主节点

Redis中使用外部的哨兵节点帮助Redis主从选主

### 哨兵

1.监控master slave健康情况

2.当master出现故障时，从slave选举一个新的master

#### 哨兵也要作集群

哨兵之间不需要做配置，使用节点订阅pub/sub，订阅redis集群主节点来了解彼此

哨兵集群也要有选leader，使用raft算法

### Cluster

分片用的，一般3个分片，并且对3个分片做salve

### 分布式锁

setnx 不能重复

setnx返回1 设置成功

expire设置带超时时间的

### 缓存雪崩

**现象**：大量key同一时间点失效，同时又有大量请求打进来，导致流量直接打在DB上，造成DB不可用。

**解决方案**：

1.设置key永不失效（热点数据）；

2.设置key缓存失效时候尽可能错开；乘以随机数

3.使用多级缓存机制，比如同时使用redsi和memcache缓存，请求->redis->memcache->db；

### 缓存穿透

Redis和DB都不存在

- 从DB中查询出来数据为空，也进行空数据的缓存，避免DB数据为空也每次都进行数据库查询；
- 使用布隆过滤器，但是会增加一定的复杂度及存在一定的误判率；

前端 调用  wms return 实物库存 - 占用数

把仓库 + 商品id + lot 存入布隆过滤器中

mysql最大连接数**16384**

### 缓存击穿

击穿了redis，但是数据库存在

某一时刻对同一个key有大量的并发请求进来，这时候会出现请求打到数据库层面

解决方案：

1.加分布式锁，对于同一个key，访问redis时加分布式锁，那么大并发情况下，只有一个线程会拿到锁，读DB并且写入缓存，后续排队的线程就可以从缓存中读取了。

再优化

```java
// trylock的时间是很难确定的，需要容忍被击穿的可能
lock.tryLock(100ms);// 假如一时刻数万请求进来，则100ms后，阻塞结束，不需要再排队串行，改为并行
String cache = getStockFromCache();
if (cache == null) {
    cache = getStockFromDb();
}
lock.unlock();
```

2.热点数据不过期

和雪崩的区别在于，雪崩是同一时刻大批量key失效，而击穿是指某一个key失效后多个并发访问



### 数据库与Redis的数据一致性

无法实现强一致性

#### 最终一致的实现

##### 先删除Redis再更新数据库

如果redis删除失败则抛出异常，innodb事务回滚。不会出现问题

如果redis删除成功，但是更新mysql失败，再次读取redis时发现不存在会读数据库，读到的一定是最新的。不会出现问题

**此种处理方式看起来并不会出现数据一致性的问题，但是先删除redis值成功时的临界点，可能出现并发问题导致一致性问题**

线程A先删除redis成功，线程B读取redis为空，则读数据库，读到的是线程A还未更新操作的值(线程A所认为的旧值，而不是线程A所预期的最新值)，线程A再更新数据库成功，但此时redis上的值是不准确的

该问题需要加分布式锁来保证，线程A删除redis与更新数据库操作需要被分布式写锁包裹住，线程B读取需要被分布式读锁包裹住

#### 先更新数据库再更新Redis

如果更新数据库失败，则事务回滚。不会出现问题

如果更新数据库成功，再删除redis失败，此时需要保证一致性，可以采用重试机制

​		1.MQ重试，RocketMQ和Mysql可以保证最终一致性，消费端删除redis来达到Mysql与Redis的最终一致

​		2.本地表重试，删除redis的操作表与Mysql的事务表放到一个事务提交。redis操作表job重试（1s一次也会延			迟1s，容忍的情况可以使用）

​		3.借助mysql的Binlog，比如Canal框架，更新Redis，优解，因为即满足了一定的实时性，又不侵入业务
