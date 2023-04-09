# 遇到的问题

客服的getOrderCancelList接口大量等待数据库连接池连接超时异常

![1640165867814](E:\ChunBo相关\笔记\1640165867814.png)

**问题可能出现在**：

1.数据库的连接太多了（CS、DMS、TMS在一起，排查减少其他应用实例的数据库连接数。如果连接数没异常，考虑是否需要分库等等）需要DBA分析问题

2.读写分离，从读库读取数据

​	尽可能减少读的操作，加缓存

**即使加缓存也会出现缓存穿透**：缓存和db都不存在

客服的order_cancel_request表30w+记录，订单库的主表1600w+记录，概率约0.01875

缓存命中概率很低，此时理论值1570w订单，依旧请求到数据库，出现了缓存穿透问题

**解决办法**：1.空值也缓存（缺点是会存很多key，而且失效时间不能太短，浪费redis存储空间）

​				   2.**BloomFilter**



# Bloomfilter

百度百科：

布隆过滤器（Bloom Filter）是1970年由布隆提出的。它实际上是一个很长的[二进制](https://baike.baidu.com/item/二进制/361457)向量和一系列随机映射函数。布隆过滤器可以用于[检索](https://baike.baidu.com/item/检索/11003896)一个元素是否在一个[集合](https://baike.baidu.com/item/集合/2908117)中。它的优点是空间效率和查询时间都比一般的算法要好的多，缺点是有一定的误识别率和删除困难。

1.海量数据的去重
2.处理缓存穿透的场景

# 在使用bloomfilter之前，思考用到分布式项目中可能遇到的问题和挑战

### 1.技术选择，选哪家BloomFilter？

一开始想用Redisson的RBloomFilter，因为是分布式操作的，可效率太慢

这里我做了测试，4c8g、单线程、uat、30w的数据预热

redisson的RbloomFilter需要24min

**guava的BloomFilter只需要151ms (3000w才需要15s)**

虽然redisson的RbloomFilter天然地解决了分布式的问题，但是效率相差甚远，此处还是使用guava的BloomFilter

### 2.何时将数据写入到BloomFilter中？

##### 1.容器启动完毕全量加载

spring容器初始完毕后 初始化布隆过滤器

读cscoredb.order_cancel_request表，加载到Bloom中

*读库操作优化*

1.存到Bloom里的值最好是mysql的索引列，这样查库这一步可以做到覆盖索引，无需回表 

2.between and（索引级别range）  比limit（索引级别All） 快

##### 2.新增数据如何同步到Bloom？

​	1.每一次增加cscoredb.order_cancel_request记录时***同步增量***到Bloom中（实时性） 
​	2.定时任务job查表，***全量同步***或***批量增量同步***到Bloom中
   根据具体业务场景选择，我这里使用1

### 3.guava的BloomFilter是进程内 同步增量时分布式问题如何解决？

**因为我这里要求强实时性，如果不需要实时性可以用job异步抓表同步**

一台机器的插入。其他机器该如何知晓？

需要借助第三方组件完成分布式信息通信

#### Zookeeper Wathcer

version 3.4.6                                                      

使用Curator子节点监听器，注册监听子节点新增事件，事件回调插入到Bloom中

```java
PathChildrenCache pathChildrenCache = new PathChildrenCache(curatorClient, NODE_PATH, true);
PathChildrenCacheListener pathChildrenCacheListener = new PathChildrenCacheListener() {
    @Override
    public void childEvent(CuratorFramework curatorFramework, PathChildrenCacheEvent pathChildrenCacheEvent) {
        // 发生子节点新增事件、插入bloom
        if (pathChildrenCacheEvent.getType() == PathChildrenCacheEvent.Type.CHILD_ADDED) 			{}}
};
// 注册监听
pathChildrenCache.getListenable().addListener(pathChildrenCacheListener);
```

创建临时节点，触发监听器事件回调

```java
curatorClient.create().withMode(CreateMode.EPHEMERAL).forPath(path);
```

 3.5.8支持TTL

#### MQ

记得以广播模式消费，以保证同组每个consumer都能消费到

```java
defaultMQPushConsumer.setMessageModel(MessageModel.BROADCASTING);
```

#### Redis Pub/Sub

```
jedis.publish("bloomfilter-ordercancelrequest", message);
```

```
jedis.subscribe(new JedisPubSub() {
           @Override
           public void onMessage(String channel, String message) {
                // 将message插入到Bloom中
            }
        }, "bloomfilter-ordercancelrequest");
```

Zookeeper、3.4.6版本不支持设置TTL，不推荐使用



### order_cancel_request客服的订单取消中间表

#### 插入时机？

1.http://cs.uat.chunbo.com:8080/ws/orderCancel/addOrderCancel  ws应用

前端流量用户自助取消(request_type.9)、三方订单用户自助取消(request_type.3)

2.作弊订单客服批量取消 web应用

CheatHandleAction#cancelOrder 老拉新作弊取消处理

AntiCheatFirstOrderAction#cancelOrders 首单作弊用户监控取消处理

3.客服工作台 订单取消 web应用

OrderCancleAction#keyin

4.job、orderCancelJob elasticJob

抓取新增状态的处理where ocr.status = 0 AND ocr.request_type IN (1,2,3,9)

如果是已拆单的父单 通过父单 获取子单去取消 

OrderCancelTimeTaskServiceImpl#process#orderCancel#dealCSCancelOrder#cancelByParentOrder#insertCcancelOrder

*上线的时候这三个服务都需要重启。我操作时漏掉了job*



没有使用布隆过滤器前 下午2点一分钟db访问334 

![1640138929636](E:\ChunBo相关\笔记\1640138929636.png)

使用布隆过滤器后 降到了71

![1640139494063](E:\ChunBo相关\笔记\1640139494063.png)



**getPostSaleInfoByOrderId、getOrderCheckStatus也存在相同问题**

