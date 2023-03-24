# 操作系统预读取

磁盘数据的读取相比于内存是很慢的，所以操作系统支持预读取，来减少读取的次数。

默认操作系统的页缓存是4kb，也就是常说的4k对齐。

# 服务端与客户端连接

通信类型：同步/异步

连接方式：长连接/短连接

协议：TCP/Unix Socket

# Mysql

## 常用系统级sql语句

### 查看版本

```sql
SELECT VERSION();
```

### 查看使用数据库

```sql
show databases;
use bibabo_order;
```

### 查看连接相关

客户端每连接服务端产生一个Session，服务端就会开启一个线程去处理

在窗口查看服务端的线程数量

```sql
show global status like '%Thread%';
```

```properties
+------------------------------------------+-------+
| Variable_name                            | Value |
+------------------------------------------+-------+
| Delayed_insert_threads                   | 0     |
| Performance_schema_thread_classes_lost   | 0     |
| Performance_schema_thread_instances_lost | 0     |
| Slow_launch_threads                      | 0     |
| Threads_cached                           | 8     |
| Threads_connected                        | 3     |##连接的线程数，有一台服务开启了50个连接
| Threads_created                          | 53    |##创建的线程数，但连接关闭线程却没有关闭
| Threads_running                          | 1     |
+------------------------------------------+-------+
```

连接的线程数，有一台服务开启了50个连接

创建的线程数，但连接关闭线程却没有关闭

此时需要有回收线程机制

**非交互式超时时间，如JDBC程序**

```sql
show global variables like 'wait_timeout'; 
```

```properties
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| wait_timeout  | 28800 |
+---------------+-------+
```

**交互式超时时间，如数据库工具**

```sql
show global variables like 'interactive_timeout'; 
```

```properties
+---------------------+-------+
| Variable_name       | Value |
+---------------------+-------+
| interactive_timeout | 28800 |
+---------------------+-------+
```

想让线程尽快释放，可以调小这两个值

#### Mysql默认最大连接数是多少

多查看mysql的document文档https://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_interactive_timeout

| Command-Line Format | `--max-connections=#` |
| :------------------ | --------------------- |
| System Variable     | `max_connections`     |
| Scope               | Global                |
| Dynamic             | Yes                   |
| Type                | Integer               |
| Default Value       | `151`                 |
| Minimum Value       | `1`                   |
| Maximum Value       | `100000`              |

默认最大连接数只有151个，允许调整到最大10万连接

### 查询缓存开启

```sql
show variables like 'query_cache%';
```

```properties
+------------------------------+---------+
| Variable_name                | Value   |
+------------------------------+---------+
| query_cache_limit            | 1048576 |
| query_cache_min_res_unit     | 4096    |
| query_cache_size             | 1048576 |
| query_cache_type             | OFF     |
| query_cache_wlock_invalidate | OFF     |
+------------------------------+---------+
```

在**5.7**的版本，默认查询缓存是关闭的。官方给出的说法：

1. sql语句必须完全一致，包括大小写空格，才会命中缓存
2. 查询缓存的表，只要有数据行被修改，就会清空这张表所有的查询缓存

**8.0**以后的版本压根就不存在query_cache了，缓存就交给专业的缓存中间件来做

## 执行流程

mysql服务端启动，默认监听端口3306

一个客户端请求到mysql服务端，mysql都做了哪些事情？

**分层**：连接层、服务层、存储引擎层

连接层：负责管理连接

服务层：缓存、解析器、预处理器、优化器、执行器

存储引擎层：存储引擎

### 查询缓存

query_cache

### 解析器

parser

#### 词法解析

把一个完整的SQL语句打碎成一个个的单词

##### 解析树

select Fields from Tables where Conditons.

#### 语法解析

语法检查

比如：sql=aaaavvv，解析无法通过

```
错误代码： 1064
You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near
```

### 预处理器

pre processor

比如：select * from aaa.  但是aaa表不存在

```
错误代码： 1146
Table 'bibabo_marketing.aaa' doesn't exist
```

### 优化器

optimizer

不同的sql语句会有不同的执行路径，优化器的作用就是确定执行路径

1. 多表的连接查询以哪张表为基准表
2. 使用哪个索引
3. 语法的优化

#### 查询优化

1. 子查询优化
2. 等价谓词重写
3. 条件化简
4. 外连接消除
5. 嵌套连接消除
6. 连接的消除
7. 语义优化
8. 非SPJ优化

生成、选择执行路径（基于cost）：会生成多条执行路径，通过计算成本，找到最优执行路径

### 执行计划

#### explain

查看执行计划

```sql
EXPLAIN SELECT * FROM bibabo_order.`order_main` WHERE id = 16
```

json格式查看

```sql
EXPLAIN FORMAT=JSON SELECT * FROM bibabo_order.`order_main` WHERE id = 16
```

#### optimizer trace

优化器跟踪：默认是不开启的，因为耗费性能。会写入information_schema.`OPTIMIZER_TRACE`表

```sql
SHOW VARIABLES LIKE 'optimizer_trace';
SET optimizer_trace='enabled=ON';
SELECT * FROM bibabo_order.`order_main` WHERE id = 14;
SELECT * FROM information_schema.`OPTIMIZER_TRACE`;
SET optimizer_trace='enabled=OFF';
```

### 执行器

1. 调用存储引擎接口按执行计划执行
2. 将执行后的结果返回给用户

### 存储引擎

查看数据存储目录

```sql
show variables like 'datadir';
```

建表语句

```sql
CREATE TABLE `bibabo_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=156140742 DEFAULT CHARSET=utf8 COMMENT='单品页分享重试表';
```

ENGINE就是存储引擎

常见存储引擎如下：InnoDB、Mysaim、Memory、CSV、Archive

为什么要支持多种存储引擎，因为这些存储引擎的特性是不同的，支持不同的业务场景。**插拔式更换**

https://dev.mysql.com/doc/refman/5.7/en/storage-engines.html

#### InnoDB

Mysql默认的存储引擎

```sql
show engine innodb status;
```

优点：支持事务、行锁、MVCC

#### Mysaim

Mysaim是每一种索引的叶子节点也就是数据区，都存储表数据对应的地址

表级锁

#### Memory

存储引擎  数据存储在内存（临时表）

优点：内存存储，不需要持久化

#### CSV

优点：

1. 数据的快速导入导出   
2. 表格直接生成csv文件

#### Archive

优点：大数据量，数据压缩

# InnoDB

## 存储引擎查询优化

### 页缓存

操作系统默认页缓存默认是4kb

Mysql中InnoDB存储引擎的页缓存默认是16kb

### InnoDB buffer pool

InnoDB存储引擎在处理客户端的请求时，如果需要访问某个页的数据，就会把完整的页中的数据全部加载到内存中，即使只访问页中的一条记录，也需要先把整个页的数据加载到内存中。将整个页加载到内存后就可以进行读写访问了，而且在读写访问之后并不着急把该页对应的内存空间释放掉，而是将其缓存起来，这样将来有请求再次访问该页面时，就可以剩下磁盘IO的开销了。

为了缓存磁盘中的页，Innodb在MySQL服务器启动时就像操作系统申请了一片连续的内存，即[Buffer](https://so.csdn.net/so/search?q=Buffer&spm=1001.2101.3001.7020) Pool（缓冲池）。默认情况下，Buffer Pool的大小为128M。

Buffer Pool对应的一片连续的内存被划分为若干个页面，页面大小与Innodb表空间用的页面大小一致，默认都是16kb，为了与磁盘中的页面区分开来，我们把这些Buffer Pool中的页面称为缓冲页。

当我们修改了Buffer Pool中某个缓冲页的数据，它就与磁盘上的页不一致了，这样的缓冲页称为脏页。当然，我们可以每当修改完某个数据页时，就立即将其刷新到磁盘中对应的页上，但是频繁的往磁盘中写数据会严重的影响程序的性能，所以每次修改缓冲页后，我们并不着急立即将修改刷新到磁盘上，而是在某个时间点进行刷新。

后台有专门的线程负责每隔一段时间就把脏页刷新到磁盘，这样就可以不影响用户线程处理正常的请求。

总结：InnoDB存储引擎是以页为单位来管理存储空间的，在真正访问页面之前，需要先把磁盘中的页加载到内存中的Buffer Pool中，之后才可以访问，所有的变更都必须先更新缓冲池中的数据，然后缓冲池中的脏页以一定的频率刷新到磁盘（checkpoint机制），通过缓冲池来优化CPU和磁盘之间的鸿沟，这样就能保证整体的性能不会下降的太快。

### redo log

根据事务的持久性，对于一个已经提交的事务，在事务提交之后即使系统发生了崩溃，这个事务对数据库所在的更改也不能丢失。

在真正访问页面之前，需要先把磁盘中的页加载到内存中的Buffer Pool中，之后才可以访问。如果我们只在内存中的Buffer Pool中修改了页面，假设在事务提交之后突然发生了某个故障，导致内存中的数据都失效了，就无法保证事务的持久性了。

那么如何保证事务的持久性呢？

一个简单的做法就是在事务提交完成之前，把该事务修改的所有页面都刷新到磁盘，但是这个粗暴的做法存在下面这些问题：

> (1) 刷新一个完整的数据页太浪费时间了，有时我们仅仅修改了某个页面中的一个字节，但是由于InnoDB是以页为单位进行磁盘IO的，也就是事务提交时不得不将一个完整的页面刷新到磁盘，太浪费了。
> (2) 随机IO刷新的比较慢，一个事务可能包含很多语句，即使是一条语句也可能修改许多页面，而且这些页面可能并不相邻。这就意味着在将某个事务修改的Buffer Pool中的页面刷新到磁盘时，需要进行很多的随机IO。

我们只是想让已经提交了的事务对数据库中的数据所在的修改能永久生效，即使后来系统崩溃，在重启后也能把这种修改恢复过来。所以，其实没有必要在每次提交事务时就把该事务在内存中修改过的全部页面刷新到磁盘，只需要把修改的内容记录下来即可。

比如，某个事务将系统表空间中第10号 页面中偏移量为 100 处的那个字节的值 1 改成 2 。我们只需要记录一下：

```cobol
将第0号表 空间的10号页面的偏移量为100处的值更新为 2
```

这样在事务提交时，就会把上述的内容刷新到磁盘中，即使之后系统崩溃了，重启之后只要按照上述内容所记录的步骤重新更新一下数据页，那么该事务对数据库中所做的修改就可以被恢复过来，这样就能满足持久性的要求了。

因为在系统因崩溃而重启时需要按照上述内容所记录的步骤重新更新数据页，所以上述内容也称为**重做日志**。

#### redo log 的好处

相较于在事务提交时将所有修改过的页刷新到磁盘中，只将该事务执行过程中产生的redo日志刷新到磁盘，有下面的好处：

- **redo日志降低了刷盘频率**

- **redo日志占用的空间非常小**
- **redo日志是顺序写入磁盘的**。在执行事务的过程中，每执行一条语句，就可能产生若干条redo日志，这些日志是按照产生的顺序写入磁盘的，也就是顺序IO。

InnoDB存储引擎的事务采用了WAL技术（Write-Ahead Logging）,这种技术就是先写日志，再写磁盘，只有日志写入成功，才算事务提交成功，这里的日志就是redo log。当发生宕机且数据未刷新到磁盘的时候，可以通过redo log恢复过来，保证事务的持久性。

redo log跟bin log的区别：redo log是存储引擎层产生的，而bin log是数据库层产生的。假设一个事务，对表做了10万行的记录插入，在这个过程中，一直不断的往redo log顺序记录，而bin log不会记录，直到这个事务提交，才会一次写入bin log文件中。

#### redo log 的组成

- **重做日志缓冲区**（redo log buffer）：保存在内存中，是易丢失的。InnoDB为了解决磁盘速度过慢的问题而引入了Buffer Pool，同理，写入redo log日志时，也不能直接写到磁盘中，实际上在服务器启动时就向操作系统申请了一片称为`redo log buffer`的连续存储空间。
- **重做日志文件** (redo log file) ：保存在硬盘中，是持久的。redo日志总存放在内存`redo log buffer`中待着也不是个办法，在一些情况下他们会被刷新到磁盘中。mysql的数据目录下默认有名为`ib_logfile0`和`ib_logfile1`两个文件，log buffer中的日志在默认情况下就是刷新到这两个磁盘文件中，即`redo log file`。

#### redo log 刷盘时机

- **log buffer空间不足时**：log buffer的大小是有限的，如果不停的向这个有限大小的log buffer中塞入日志，很快就会将它填满，设计InnoDB的大叔认为，如果当前写入log buffer的redo日志量已经占满了log buffer总容量的50%左右，就需要将这些日志刷新到磁盘中。
- **事务提交时**：之所以提出redo log的概念，主要是因为它占用的空间少，而且可以将其顺序写入磁盘，引入redo日志之后，虽然在事务提交时可以不把修改过的buffer pool页面立即刷新到磁盘，但是为了保持持久性，必须要把页面修改时所对应的redo日志刷新到磁盘，否则系统崩溃后，无法将该事务对页面所做的修改恢复过来。
- **将某个脏页刷新到磁盘前，会先保证该脏页对应的redo日志刷新到磁盘中**：redo日志是顺序写入的，因此在将某个脏页对应的redo日志从redo log buffer刷新到磁盘中时，也会保证将在其之前产生的redo日志也刷新到磁盘中。
- **后台有一个线程，大约以每秒一次的频率将redo log buffer中的redo日志刷新到磁盘中**。
- **做checkpoint时**。

#### redo log 的整体流程

第1步：先将原始数据从磁盘中读入内存中来，修改数据的内存拷贝 。

第2步：生成一条重做日志并写入redo log buffer，记录的是数据被修改后的值 。

第3步：当事务commit时，将redo log buffer中的内容刷新到 redo log file，对 redo log file采用追加写的方式 。

第4步：定期将内存中修改的数据刷新到磁盘中。

Write-Ahead Log(预先日志持久化)：在持久化一个数据页之前，先将内存中相应的日志页持久化。

#### redo log 的刷盘策略

redo log的写入并不是直接写入磁盘的，InnoDB引擎会在写redo log的时候先写redo log buffer，之后以 一 定的频率刷入到真正的redo log file 中。这里的一定频率怎么看待呢？这就是我们要说的刷盘策略。

redo log buffer刷盘到redo log file的过程并不是真正的刷到磁盘中去，只是刷入到文件系统缓存 （page cache）中去，真正的写入会交给系统自己来决定（比如page cache足够大了）。那么对于InnoDB来说就存在一个问题，如果交给系统来同 步，同样如果系统宕机，那么数据也丢失了（虽然整个系统宕机的概率还是比较小的）。

针对这种情况，InnoDB给出`innodb_flush_log_at_trx_commit `参数，该参数控制 commit提交事务时，如何将 redo log buffer中的日志刷新到 redo log file 中。它支持三种策略：

- 设置为0 ：表示每次事务提交时不进行刷盘操作。默认master thread每隔1s进行一次重做日志的同步。

  InnoDB存储引擎有一个后台线程，每隔1秒，就会把redo log buffer中的内容写到文件系统缓存（page cache），然后调用刷盘操作。一个没有提交事务的redo log日志，也可能会刷盘，因为在事务执行过程redo log记录是会写入redo log buffer中，这些redo log记录会被后台线程刷盘。

- 设置为1 ：表示每次事务提交时都将进行同步，刷盘操作（ 默认值 ）

  redo log记录就一定在硬盘里，不会有任何数据丢失。如果在事务执行期间MySQL挂了或者宕机了，这部分日志丢了，但是事务并没有提交，所以日志丢了也不会有损失。可以保证ACID的D，数据绝对不会丢失，但是效率是最差的。

- 设置为2 ：表示每次事务提交时都只把 redo log buffer 内容写入 page cache，不进行同步。由os自己决定什么时候同步到磁盘文件。

  只要事务提交成功，redo log buffer中的内容只写入文件系统缓存Page Cache，如果只是MySQL挂了不会有任何数据丢失，但是操作系统或电脑宕机可能会有1秒数据的丢失，这种情况下无法满足ACID中的D。

```sql
show variables like 'innodb_flush_log_at_trx_commit';
```

```properties
+--------------------------------+-------+
| Variable_name                  | Value |
+--------------------------------+-------+
| innodb_flush_log_at_trx_commit | 1     |
+--------------------------------+-------+
```

#### redo log file

##### 相关参数设置

- `innodb_log_group_home_dir` ：指定 redo log 文件组所在的路径，默认值为 `./` ，表示在数据库 的数据目录下。MySQL的默认数据目录（ `var/lib/mysql` ）下默认有两个名为 `ib_logfile0 `和 `ib_logfile1` 的文件，log buffer中的日志默认情况下就是刷新到这两个磁盘文件中。此redo日志 文件位置还可以修改
- `innodb_log_files_in_group`：指明redo log file的个数，命名方式如：`ib_logfile0，iblogfile1... iblogfilen`。默认2个，最大100个
- `innodb_flush_log_at_trx_commit`：控制 redo log 刷新到磁盘的策略，默认为1
- `innodb_log_file_size`：单个 redo log 文件设置大小，默认值为 48M 。最大值为512G，注意最大值 指的是整个 redo log 系列文件之和，即（innodb_log_files_in_group * innodb_log_file_size ）不能大 于最大值512G



















































































InnoDB的主键索引的叶子节点也就是数据区，直接存储数据，其余的辅助索引的叶子节点存储的都是主键索引的关键字

行级锁

InnoDB，如果没有主键，就找唯一主键作为主键，没有唯一键默认生成6位int型主键

## 索引

存储引擎是插拔式的

5.5以前默认是Mysaim

5.5开始使用InnoDb

#### 索引是什么？

索引是为了加速对表中数据行的检索而创建的一种分散存储的**数据结构**

硬盘级的

#### 为什么不用平衡二叉查找树？

1.树太深了，O（logn）

2.每个节点存储太小了，比如varchar（64），一次IO操作系统一页4kb，mysql默认读16k，一个关键字64字节加上两个引用，肯定达不到16

k，浪费了一次IO

#### B-Tree多路平衡查找树

绝对平衡，子节点都在同一高度

1.树变矮了

2.一次IO读取的足够多了

为了维护树的平衡，插入时会调整树，所以索引不宜建多不冗余

##### Mysql的索引是几路平衡查找树？

取决于你建索引的关键字的大小，越小路越多，路越多树越矮

#### B+Tree

1.左闭合区间，比如找1，也要找到树的叶子节点

2.非叶子节点不保存数据，只保存关键字和引用

3.叶子节点保存数据

4.叶子节点数据区是有顺序的 天然排序

##### 优点

1.随机IO 变为顺序IO

2.非叶子节点不保存数据，磁盘读写更多，树更矮了

3.排序能力强

4.B+树查询更加稳定



#### 索引的离散性要高

#### 最左匹配原则

对索引中关键字进行计算（对比），一定是从左往右依次进行的，且不可跳过

创建数据库时可以选择  **排序规则** ASCII码

#### 普通索引



#### 主键索引

id

#### 唯一索引

#### 联合索引

1.经常用的列优先（最左匹配原则）  2.离散性高的列优先  3.宽度小的列优先

##### 覆盖索引

如果查询的列可以通过索引节点中的关键字直接返回，则该索引称之为覆盖索引

##### 实战

1.select * from wms_inv where sku_id = 2014565 and ware_id = 1;

2.select sku_id,ware_id,lot;// 

库房的wms_inv表创建一个联合索引，wms_Inv_id，sku_id，ware_id，lot

wms_Inv_id是逻辑主键，建唯一索引

sku_id + ware_id为联合索引，1,2sql都能命中

现在的InnoDB比较智能，颠倒顺序也可以命中索引



##### mysql客户端与服务端的通信方式是“半双工”

半双工指两边可以互相通信，但是某一时刻只会有一个人在讲话

全双工，两人可以同一时刻一起讲话

单工只能一方对另一方讲话

#### explain

##### type All全表扫 < index 基于索引进行全索引扫描（比如命中覆盖索引） <  range（like索引）  < ref < const唯一索引或主键索引

## 事务

一组不可分割的操作集合，数据库操作的最小操作单元

show VARIABLES like ‘autoCommit’

autoCommit 默认为ON

```java
connection.setAutocommit(false)// 关闭自动提交 要手动提交事务
......
commit()
```

### ACID

Atomic：要么一起成功、要么一起失败

Consist：数据要满足预期

Isolation：一个事务提交之前，对其他事务的是不可见的

Durability：事务做出的修改要永久保存

### 其中隔离性会因为并发事务产生以下问题

脏读：事务A修改未提交，事务B读到A事务未提交的值

不可重复读：事务A第一次读取，事务B修改，事务A二次读取时值发生了变化

**前两个是指定莫一行记录读取**  **幻读是指读取多行记录**

幻读：事务A第一次范围读取，只读到两条记录，事务B插入一条未提交，事务A第二次读取读到了三条记录

### 事务隔离级别标准

未提交读：什么问题都没解决

已提交读：解决脏读

可重复读：解决不可重读

串行化：解决幻读

InnoDB默认是可重复读级别，但是解决了幻读的问题

## InnoDB是如何实现事务隔离级别标准的？锁和MVCC

### 锁

innoDB的行锁是通过对索引上的索引项加锁实现的

只有通过索引条件进行数据检索，才会使用行级锁，否则使用表锁（InnoDB的表锁是通过锁住所有行实现的）

假如id是主键索引，name是二级索引辅助索引，如果update的where条件是name过滤的话，那么会先在二级索引上加锁，然后再到找到二级索引的数据区也就是找到主键索引 在主键索引上加锁。会加两把锁

##### 1.共享锁（行锁）

lock in Share mode

一个事务获取到共享锁，其他事务也可以获取到这个共享锁，但不可以获取排他锁

##### 2.排他锁（行锁）

for update

一个是事务获取到排他锁 其他事务不能获取排他锁或共享锁

##### 3.意向共享锁（表锁）

在获取共享锁之前，必须先获得意向共享锁，一把意向共享锁可以被多个事务共持有

##### 4.意向排他锁（表锁）

在获取排他锁之前，必须先获得意向排他锁，一把意向排他锁可以被多个事务共持有

意向锁的作用？当有事务想锁表时，需要判断意向锁是否存在，必须等意向锁释放才能锁表

##### 5.自增锁

对于自增列自增长的一个特殊的表级别锁

show variables like 'innodb_autoinc_lock_mode';

默认自增值为1，事务未提交ID永久丢失

##### 行锁的算法

 1 4 6 7 10 

会分为6个区间 (-~ , 1]、(1 , 4]、( 4, 6 ]、( 6, 7 ]、( 7, 10 ]、(10 , +~]

##### 记录锁 record lock

唯一索引或者主键索引，查询条件是精准匹配，退化为Record锁

select * from user where id =4 for update

**ps：如果是可重复的普通索引，锁的是（1 ， 6）1-6开区间锁住**

##### 间隙锁 gap lock

命中索引后，记录不存在，那么临建锁会退化为Gap锁，也就是只锁一个区间

select * from user where id = 5 for update

( 4, 6 )锁住这个区间 左开右开

**只在RR隔离界别存在**

##### 临键锁（默认行锁算法）next-key lock = gap lock + record lock

select * from user where id > 5 and id < 9 for update;

命中索引后，记录存在6 7  锁住的是记录的当前区间和下一个区间( 4, 6 ]、( 6, 7 ]、( 7, 10 ]，如果现在另一个事务插入8是插不进去的，那么当前事务再次读取的时候，就不会出现幻读



##### 1.如何用锁解决脏读？

读加共享锁，改加排他锁

##### 2.如何用锁解决不可重复读？

读加共享锁，改加排他锁

##### 3.如何用锁解决幻读？

读加排他锁，默认是临建锁，nextkey锁  锁住当前记录所在区间和下一个区间，这样就可以解决幻读

#### 死锁

死锁的避免

1.固定顺序的访问表和行

2.大事务拆小

3.如果业务允许，降低事务隔离级别  因为间隙锁和临建锁 只存在RR隔离级别，所以降低隔离级别后，就不会锁住区间了，锁的粒度就变小了

4.建立合理的索引 尽量避免表锁

默认事务隔离级别就是RR 可重复读

##### 当前读使用临建锁解决幻读、快照读使用MVCC解决幻读

### MVCC(多版本并发控制)

Mutiversion Concurrency Control

对事务内处理的数据做多版本的管理，以达到用来避免写操作的阻塞，从而引发读操作的并发问题

数据行版本号和删除版本号

开起一个事务会分配全局事务id

插入时，数据行版本号为事务id

删除时，删除版本号为事务id

修改时，先把修改的行copy新行，先插入数据行版本号为事务id，再把原行的删除版本号为事务id

查询时，1.找数据行版本号早于当前事务版本号 2.找删除版本号为null或者删除版本号大于当前版本号（小于当前版本号的说明已经删除不要了）



# 幂等

在编程中一个幂等操作的特点是其任意多次执行所产生的影响均与一次执行的影响相同

## 保证幂等性的方案

### Redis

1.不存在并发的场景。比如消息的消费

```java
// 发送端代码
// 生成一个唯一ID，例如时间戳，或UUID或token
String uid = UUID...;
Message message = new Message(消息体中附带uid);

// 消费端代码
// 检查消息是否消费过
String val = redisTemplate.get(KEY_PREFIX + UID);
if (val != null) {return "success"};
// 执行本地事务
begin transaction;
// 执行成功后将消息中的uid写入到redis中
redisTemplate.set(KEY_PREFIX + UID);
```

2.存在并发的场景。这种一般是异常情况，同一时刻客户端发送了多次相同的请求。需要加层分布式锁

```java
// 客户端代码
// 生成一个唯一ID，例如时间戳，或UUID
String uid = UUID...;
Message message = new Message(消息体中附带uid);

// 服务端代码
redisTemplate.lock();
// 检查消息是否消费过
String val = redisTemplate.get(KEY_PREFIX + UID);
if (val != null) {return "success"};
// 执行本地事务
begin transaction;
// 执行成功后将消息中的uid写入到redis中
redisTemplate.set(KEY_PREFIX + UID);
redisTemplate.unlock();
```

### 数据库

1.数据库的唯一约束。UNQUE_KEY  insert 抛出DuplicateKeyException。

比如业务上天然的唯一键如orderId skuId

非天然的。服务端创建一个消息表，基于消息生成MD5作为唯一键做插入，插入成功则处理，异常则认为被幂等校验了

