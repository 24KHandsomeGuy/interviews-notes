# Zookeeper

## 分布式协调框架

协调什么？分布式架构下的所有需要协调的应用节点

master选举，顺序写入，注册中心（服务管理，服务上下线感知），配置中心（key文件名 value文件详情）

类似目录存储

## Zookeeper的节点

**临时节点**（生命周期为一个会话）（服务上下线感知，provider挂掉了，zookeeper心跳检测他挂了，临时节点删除，consumer注册watcher这个节点，通知consumer，长连接）

​		临时节点不可存在子节点

**有序节点**、**持久化节点**

​		必须现有父节点，再有子节点

​		同级节点下，节点名称必须唯一

### 有序节点

全局ID

### 同级节点唯一性

master选举、分布式锁

## Zookeeper的作用

### 配置中心

**存储**：如：/bibabo/stock/stock-ws.properties里面的nodedata就是配置详情

**配置修改动态感知**：开发或运维人员修改set /bibabo/stock/stock-ws.properties 10086

客户端Wacther机制监听事件回调，拿到修改后的值

### 注册中心

**存储**：服务端启动成功创建临时节点，如：/bibabo/dubbo/stock/providers -> dubbo://192.168....																										   				同级另一个dubbo://192.169....

服务端下线，心跳检测失败，临时节点会删除

**服务动态上下线感知**：Wacther机制监听/bibabo/dubbo/stock/providers的子节点，发生变更则刷新地址列表

### 分布式锁

#### 1.同级节点唯一性

分布式多应用节点共同写入一个锁临时节点，第一个写入成功的获得锁，释放锁时会话关闭或者删除节点，其余节点watcher监听，再去竞争写入（惊群）

#### 2.临时有序节点

/lock-0001  /lock-0002  /lock-0003

3监听2 2监听1

1. 多台客户端并发向Zookeeper写入节点，第一个写入成功的节点，即获得分布式锁
2. 后续的节点与第一个节点同级，通过watcher机制依次监听前一个节点的删除事件
3. 获得锁的客户端处理完业务请求后，释放分布式锁，即删除节点
4. 后一个节点收到监听事件回调，获取锁成功

## Wacther机制

push还是pull？

Zookeeper是通过push的机制将变化通知给订阅者，**push机制必须维持一个会话否则zookeeper找不到客户端**，这个会话是一个长连接，Zookeeper中使用SessionManager用来管理会话，向客户端发送心跳包来维持会话。

一次watcher的生命周期：（如果想一直监听，需要循环注册）

> 1.注册
>
> 2.事件回调后，监听完成

## Zookeeper是如何保证CP的

Zab协议

### ZAB协议(zookeeper 原子广播)

ZAB（Zookeeper Atomic Broadcast） 协议是为分布式协调服务 ZooKeeper 专门设计的一种支持崩溃恢复的原子广播协议。在 ZooKeeper 中，主要依赖 ZAB 协议来实现分布式数据一致性，基于该协议，ZooKeeper 实现了一种主备模式的系统架构来保持集群中各个副本之间的数据一致性。通过单一的主进程来接收并处理客户端的所有事务请求。

ZAB协议包含两种基本模式：**崩溃恢复和消息广播**

#### 崩溃恢复模式

ZAB 协议的这个基于原子广播协议的消息广播过程，在正常情况下是没有任何问题的，但是一旦 Leader 节点崩溃，或者由于网络问题导致 Leader 服务器失去了过半Follower 节点的联系（leader 失去与过半 follower 节点联系，可能是 leader 节点和 follower 节点之间产生了网络分区，那么此时的 leader 不再是合法的 leader 了），那么就会进入到崩溃恢复模式。在 ZAB 协议中，为了保证程序的正确运行，整个恢复过程结束后需要选举出一个新的Leader。

1. 已经被处理的消息不能丢失
2. 被丢弃的消息不能再次出现

#### 消息广播模式

消息广播的过程实际上是一个简化版本的二阶段提交过程

leader 接收到消息请求后，将消息赋予一个全局唯一的64 位自增 id，叫：zxid，通过 zxid 的大小比较既可以实现因果有序这个特征
leader 为每个 follower 准备了一个 FIFO 队列（通过 TCP协议来实现，以实现了全局有序这一个特点）将带有 zxid的消息作为一个提案（proposal）分发给所有的 follower
当 follower 接收到 proposal，先把 proposal 写到磁盘，写入成功以后再向 leader 回复一个 ack
当 leader 接收到合法数量（超过半数节点）的 ACK 后，leader 就会向这些 follower 发送 commit 命令，同时会在本地执行该消息
当 follower 收到消息的 commit 命令以后，会提交该消息
   leader 的投票过程，不需要 Observer 的 ack，也就是Observer 不需要参与投票过程，但是 Observer 必须要同步 Leader 的数据从而在处理请求的时候保证数据的一致性

## 集群

Leader、Follower、Observer

Leader：所有事务型操作都会转发到Leader节点上处理

Follower：读操作可以由Follower节点处理。参与投票

Observer：只处理读操作。不参与投票，只提升性能用

### 数据同步

1.客户端发起请求，如果是事务请求，必须分发到Leader节点

2.Leader节点将事务请求数据传递给所有的Follower节点

3.Follower节点接收到请求后，会在磁盘记录一条事务日志，但未提交

4.Follower节点写入事务日志成功后，返回ack给到Leader节点

5.Leader节点收到ack后，决策，是否收到的成功ack大于半数节点

​	如果大于，则认为事务成功，返回客户端成功

​	否则则认为事务失败，返回客户端失败

6.成功则commit，失败则rollback

7.如果6同步失败，则通过心跳机制，检测数据一致性，不一致则同步

#### 2PC二阶段提交

需要第一阶段的所有节点返回成功，第二阶段才commit，否则rollback

### 节点的元数据

查看元数据

```zookeeper
stat /damon/age 
```

```text
cZxid = 0x3  //节点被创建的事务zxid
ctime = Thu Mar 09 16:35:32 CST 2023 //创建的时间 
mZxid = 0x3 //修改的事务zxid
mtime = Thu Mar 09 16:35:32 CST 2023 //修改的时间
pZxid = 0x3 //子节点列表中最后一次被修改的zxid
cversion = 0 //子节点的版本号 
dataVersion = 2 //当前节点数据版本号 可是通过版本号实现乐观锁 get /damon/age的dataVersion=2 								set -v 1 /damon/age 17会失败set -v 2 /damon/age 17会成功
aclVersion = 0 //权限版本号
ephemeralOwner = 0x0 //临时节点的所属会话，当前会话结束会删除这个临时节点 
dataLength = 2 //数据长度
numChildren = 0 //子节点数量
```

### 集群搭建

1.集群的每台机器zoo.cfg配置

```properties
tickTime=2000
dataDir=/data/zookeeper/data
clientPort=2181
initLimit=5
syncLimit=2
#2888代表数据同步的端口号 3888代表leader选举的端口号
server.1=zoo1:2888:3888 
server.2=zoo2:2888:3888
server.3=zoo3:2888:3888
```

2.每台机器在dataDir=/data/zookeeper/data下配置myid，myid的值为1-255代表当前zk服务的id

```shell
sh zkServer.sh status
```











## 面试题

1. 什么是Zookeeper？谈谈你对Zookeeper的认识？
   Zookeeper是一个分布式的，开放源代码的分布式应用程序协调服务。它是一个为分布式应用提供一致性服务的软件，提供的功能包括：配置维护、域名服务、分布式同步、组服务等。
2. Zookeeper的核心功能？
   Zookeeper提供了三个核心功能：文件系统、通知机制和集群管理机制。
3. 文件系统
   Zookeeper存储数据的结构，类似于一个文件系统。每个节点称之为znode，买个znode都是类似于K-V的结构，每个节点的名字相当于key，每个节点中都保存了对应的数据，类似于key-value中的value。
4. 通知机制
   当某个client监听某个节点时，当该节点发生变化时，zookeeper就会通知监听该节点的客户端，后续根据客户端的处理逻辑进行处理。
5. 集群管理机制
   zookeeper本身是一个集群结构，有一个leader节点，负责写请求，多个follower节点负责相应读请求。并且在leader节点故障的时候，会根据选举机制从剩下的follower中选举出新的leader。
6. Zookeeper中的角色都有哪些？
7. leader
   处理所有的事务请求（写请求），可以处理读请求，集群中只能有一个leader。
8. follower
   只能处理读请求，同时作为leader的候选节点，即如果leader宕机，follower节点要参与到新的leader选举中，有可能成为新的leader节点。
9. observer
   只能处理读请求，不能参与选举。
10. Zookeeper中的节点有哪几种，分别有什么不同？
    Zookeeper中的几点一共分为7中，分别是持久节点（PERSISTENT）、持久顺序节点（PERSISTENT_SEQUENTIAL）、临时节点（EPHEMERAL）、临时顺序节点（EPHEMERAL_SEQUENTIAL）、容器节点（CONTAINER）、带过期时间的持久节点（PERSISTENT_WITH_TTL）、带过期时间的持久顺序节点（PERSISTENT_SEQUENTIAL_WITH_TTL）。
11. 持久节点（PERSISTENT）
    持久节点，一旦创建成功不会被删除，除非客户端主动发起删除请求。
12. 持久顺序节点（PERSISTENT_SEQUENTIAL）
    持久顺序节点，会在用户路径后面拼接一个不会重复的自增数字后缀，一旦创建成功不会被删除，除非客户端主动发起请求。
13. 临时节点（EPHEMERAL）
    临时节点，当创建该节点的客户端断开连接后就会被自动删除。
14. 临时顺序节点（EPHEMERAL_SEQUENTIAL）
    临时顺序节点，创建时会在用户路径后面拼接一个不会重复的自增数字后缀，当创建该节点的客户端断开连接后就会被自动删除。
15. 容器节点（CONTAINER）
    容器节点，一旦子节点被删除完，该节点就会被服务端自动删除。
16. 带过期时间的持久节点（PERSISTENT_WITH_TTL）
    带过期时间的持久节点，带有超时时间的节点，如果超时时间内没有子节点被创建，就会被删除。需要开启服务端配置extendedTypesEnabled=true。
17. 带过期时间的持久顺序节点（PERSISTENT_SEQUENTIAL_WITH_TTL）
    带过期时间的持久顺序节点，创建节点时会在用户路径后面拼接一个不会重复的自增数字后缀，带有超时时间，如果超时时间内没有子节点被创建，就会被删除。需要开启服务端配置extendedTypesEnabled=true。
18. Zookeeper的工作原理
    Zookeeper的核心是原子广播，这个机制保证了各个Server之前的同步。实现这个机制的协议叫做Zab协议。Zab协议有两种模式，分别是恢复模式（选主）和广播模式（同步）。当服务启动或者在leader崩溃后，Zab就进入了恢复模式，当leader被选举出来，且大多数Server完成了和leader的状态同步后，恢复模式就结束了。状态同步保证了leader和server具有相同的系统状态。之后进入广播模式，如果这个时候当一个server加入到Zookeeper服务中，它会在恢复模式下启动，发现leader，并和leader进行状态同步。等同步结束，它也参与消息广播。Zookeeper服务一直维持在Broadcast状态，直到leader崩溃或者leader失去了大部分followers的支持。
19. Zookeeper是如何保证事务的顺序一致性的？
    Zookeeper采用了递增的事务Id来标识，所有的proposal（提议）都在被提出时加上了zxid，zxid实际上是一个64位的数字，高32位是epoch（纪元）用来标识leader是否发生改变，如果有新的leader产生出来，epoch会自增，低32位用来递增计数。当新产生proposal时，会依赖数据库的两阶段过程，首先会向其他的server发出事务执行请求，如果超过半数的机器都能执行并且能够成功，那么久开始执行。
20. Zookeeper下的server的工作状态？
    每个Server在工作过程中有三种状态：

LOKKING：竞选状态，当前Server不知道leader是谁，正在搜寻
LEADER：领导者状态，当前Server即为选举出来的leader
FOLLOWING：随从状态，leader已经选举出来，当前Server与之同步
OBSERVING：观察状态，同步leader状态，不参与投票

8. 集群中为什么需要leader？
   在分布式环境中，有些业务逻辑只需要集群中的某一台机器执行，其他的机器可以共享这个结果，这样可以大大减少重复计算，提高性能，于是就需要进行leader选举。
9. Zookeeper节点宕机怎么处理？
   Zookeeper本身也是集群，推荐配置不少于3个服务。Zookeeper自身也要保证当一个节点宕机时，其他节点会继续提供服务。

如果是一个Follower宕机，还有2台服务器提供访问，因为Zookeeper上的数据是有多个副本的，数据并不会丢失；如果是一个Leader宕机，Zookeeper会选举出新的Leader。

Zookeeper集群的机制是只要超过半数的节点正常，集群就能正常提供服务。只有在Zookeeper节点挂的太多，只剩一半或者一半不到的节点能工作时，集群才会失效。

10. Zookeeper是如何选择leader节点的？
    当leader崩溃或者leader失去大多数的follower，这时Zookeeper集群进入恢复模式，恢复模式需要重新选举一个leader，让所有的Server都恢复到一个正确的状态。Zookeeper的选举算法有两种：一种是基于basic paxos实现的，另一种是基于fast paxos算法实现的。系统默认的选举算法为fast paxos。Zookeeper集群选举leader节点，有两种情况：①集群刚刚启动时；②当原有的leader节点崩溃时。

部分名词解释：

1服务器id：myid（或sid，集群模式下必有该配置项）
2事务id：服务器中存放的最大zxid
3逻辑时钟：发起的投票轮数计数，用来怕判断多个投票是否在同一轮选举周期中，该值在服务端是一个自增序列。

无论对于那种情况选举leader，只要逻辑时钟不是最新的，这个Server的投票会被清除。

1. 服务器启动时期的Leader选举
   每个Server发出一个投票。由于是初始情况，Server1和Server2都会将自己作为leader服务器来进行投票，每次投票会包含锁推举的服务器的myid和zxid，使用（myid, zxid）表示，此时Server1的投票为（1, 0），Server2的投票为（2, 0），然后各自将这个投票发给集群中其他机器。

接受来自各个服务器的投票。集群的每个服务器收到投票后，首先判断该投票的有效性，如检查逻辑时钟、是否来自于LOOKING状态的服务器。

处理投票。针对每一个投票，服务器都需要将别人的投票和自己的投票进行比较，比较规则如下：

1优先判断zxid。zxid（事务ID）比较大的服务器优先作为Leader。
2如果zxid相同，那么久比较myid。myid（服务器ID）比较大的服务器作为Leader服务器。

对于Server1而言，它的投票是（1, 0），接收Server2的投票为（2, 0），首先会比较两者的zxid，均为0，在比较myid，此时Server2的myid最大，于是更新自己的投票为（2, 0），然后重新投票，对于Server2而言，不需要更新自己的投票，只是再次向集群中所有机器发出上一次投票信息即可。

统计投票。每次投票后，服务器都会统计投票信息，判断是否已经有过半机器接收到相同的投票信息，对于Server1、Server2恶言，都统计出集群中已经有两台机器接受了（2, 0）的投票信息，此时便认为已经选出了Leader。
改变服务器状态。一旦确定了Leader，每个服务器就会更新自己的状态，如果是Follower，那么就变更为FOLLOWING，如果是Leader，那就变更为LEADING。

2. 服务器运行时期Leader选举
   在Zookeeper运行期间，Leader与非Leader服务器各司其职，即便当有非Leader服务器宕机或者新加入，此时也不影响Leader，但是一旦Leader服务器挂了，那么整个集群将暂停对外服务，进入新一轮Leader选举，其过程和启动时期的Leader选举过程基本一致。假设正在运行的有Server1、Server2、Server3三台服务器，当前Leader是Server2，若某一时刻Leader挂了，此时便开始Leader选举。

变更状态。Leader宕机后，剩下的非Observer服务器都会将自己的服务器状态变更为LOOKING，然后开始进入Leader选举过程。
每个Server发出一个投票。在运行期间，每个服务器上的zxid可能不同，此时假定Server1的zxid为111，Server3的zxid为122；在第一轮投票中，Server1和Server2都会投子，产生投票（1, 111)，（3, 122），然后将各自投票发送给集群中所有机器。
接收来自各个服务器的投票。与启动时过程相同。
处理投票。与启动时过程相同，此时，Server3会成为Leader。
统计投票。与启动过程相同。
改变服务器状态。与启动过程相同。