# 实战

## JDK常用工具

### Jps

使用jps可以查看已启动的应用进程id，后续可以选择对应的进程id进行jvm调优

### Jmap

#### 查看应用中各实例生成情况

jmap -histo 进程pid > 文件目录及名称

- num：序号
- instances：实例数量
- bytes：占用空间大小
- class name：类名称，其中：[C is a char[]，[S is a short[]，[I is a int[]，[B is a byte[]，[[I is a int[][]

#### 快速定位内存突然飙升导致的OOM异常

使用jmap -dump:format=b,file=eureka.hprof 14660可以导出这一时刻的堆快照信息(.hprof和.dump都是当前堆内存中的快照信息！)

也可以在jvm参数中设置内存溢出（OOM）时自动导出dump文件，保护事故现场(内存很大的时候，可能会导不出来)，参数设置如下：

-XX:+HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=./ （路径）

#### 查看堆内存使用情况

查看命令：jmap -heap 14660

### Jstack

#### 检测线程死锁

jstack 28212

### Jinfo

jinfo最主要作用是：查看正在运行的Java应用程序的扩展参数
jinfo -flags 进程pid

### Jstat

jstat可以动态的查看堆内存各部分（Eden、s0、s1、老年代、元空间）的使用情况
jstat -gc pid

### Jvisualvm

jvisualvm是jdk提供的一个可视化界面，可以看做是对jmap、jstack、jinfo等命令的一个可视化实现，
使用jvisualvm可以更加直观的查看堆内存信息、检测死锁，GC等情况！

## 减少上下文切换实战

1.查看每一秒cs上下文切换次数

```text
vmstat 1
```

机器10.254.8.197，该机器包含oms_order_flow工程和kafka。结果如下

```text
r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 137140 161908 3898912    0    0     2     5    0    0  1  0 99  0  0	
 0  1      0 136760 161908 3898944    0    0     0   320  558  922  1  0 99  0  0	
 0  0      0 136760 161908 3898948    0    0     0     4  465  770  0  0 100  0  0	
 0  0      0 136636 161908 3898948    0    0     0     0  487  845  0  0 100  0  0	
 0  0      0 136568 161908 3898952    0    0     0     0  414  691  0  0 100  0  0	
 0  0      0 136584 161908 3898956    0    0     0     0  404  702  0  0 100  0  0	
 0  0      0 136584 161908 3898956    0    0     0     8  419  692  0  0 100  0  0	
 0  0      0 136584 161908 3898960    0    0     0    16  578  959  1  0 99  0  0	
 0  0      0 136080 161908 3898964    0    0     0    40  823 1200  1  1 99  0  0	
 0  0      0 136228 161908 3899000    0    0     0     0  671 1099  1  0 99  0  0	
 0  0      0 136584 161908 3899000    0    0     0     0  453  703  0  0 100  0  0	
 0  0      0 136344 161908 3899004    0    0     0     4  520  855  1  0 99  0  0	
 0  0      0 136468 161908 3899020    0    0     0     0  671 1152  0  0 99  0  0	
 0  0      0 136220 161908 3899044    0    0     0    32 1722 3882  2  1 97  0  0	
 0  0      0 136212 161908 3899088    0    0     0     0 1327 1727  3  1 97  0  0
```

cs最高峰达到了3882次，也就是1s进行了3882次上下文切换

2.用jstack命令dump oms_order_flow的线程信息，看看pid为1277的进程里的线程都在做什么

```bash
/usr/java/jdk1.7.0_80/bin/jstack  1277 > /data/dump/dump202206201720
```

3.统计所有线程分别处于什么状态

```bash
grep java.lang.Thread.State dump202206201720 | awk '{print $2$3$4$5}' | sort | uniq -c
```

```text
24 RUNNABLE
74 TIMED_WAITING(onobjectmonitor)
27 TIMED_WAITING(parking)
43 TIMED_WAITING(sleeping)
2 WAITING(onobjectmonitor)
278 WAITING(parking)
```

278 WAITING(parking)

```text
"sendWmsFetchOrderThreadPool-1" - Thread t@4442
   java.lang.Thread.State: WAITING
	at sun.misc.Unsafe.park(Native Method)
	- parking to wait for <5751be95> (a java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject)
	at java.util.concurrent.locks.LockSupport.park(LockSupport.java:186)
	at java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.await(AbstractQueuedSynchronizer.java:2043)
	at java.util.concurrent.LinkedBlockingQueue.take(LinkedBlockingQueue.java:442)
	at java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1068)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1130)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
	at java.lang.Thread.run(Thread.java:745)

   Locked ownable synchronizers:
	- None
```

这些线程都是线程池中的worker线程，他们都处在workQueue.take()阻塞中，queue存在任务会被唤醒，说明线程大多数时间处于空闲状态

## 查看线程状态

```java
Thread.class.State.enum 
```

jps查看java在运行的进程

```text
jps

5700 Launcher
13288
16184 KotlinCompileDaemon
8888 ThreadStateDemo
8140 Jps

jstack 8888
"BlockedThread-2" #15 prio=5 os_prio=0 tid=0x0000000020486800 nid=0x3278 waiting for monitor entry [0x000000002109f000]
   java.lang.Thread.State: BLOCKED (on object monitor)
        at com.bibabo.thread.artofconcurrentprogramming.ThreadStateDemo$Blocked.run(ThreadStateDemo.java:55)
        - waiting to lock <0x000000076b5df368> (a java.lang.Class for com.bibabo.thread.artofconcurrentprogramming.ThreadStateDemo$Blocked)
        at java.lang.Thread.run(Thread.java:745)

"BlockedThread-1" #14 prio=5 os_prio=0 tid=0x0000000020484000 nid=0x1d80 waiting on condition [0x0000000020f9f000]
   java.lang.Thread.State: TIMED_WAITING (sleeping)
        at java.lang.Thread.sleep(Native Method)
        at java.lang.Thread.sleep(Thread.java:340)
        at java.util.concurrent.TimeUnit.sleep(TimeUnit.java:386)
        at com.bibabo.thread.artofconcurrentprogramming.ThreadStateDemo$Blocked.run(ThreadStateDemo.java:55)
        - locked <0x000000076b5df368> (a java.lang.Class for com.bibabo.thread.artofconcurrentprogramming.ThreadStateDemo$Blocked)
        at java.lang.Thread.run(Thread.java:745)

"WaitingThread" #13 prio=5 os_prio=0 tid=0x000000002048c000 nid=0x3570 in Object.wait() [0x0000000020e9e000]
   java.lang.Thread.State: WAITING (on object monitor)
        at java.lang.Object.wait(Native Method)
        - waiting on <0x000000076b5db7a8> (a java.lang.Class for com.bibabo.thread.artofconcurrentprogramming.ThreadStateDemo$Waiting)
        at java.lang.Object.wait(Object.java:502)
        at com.bibabo.thread.artofconcurrentprogramming.ThreadStateDemo$Waiting.run(ThreadStateDemo.java:40)
        - locked <0x000000076b5db7a8> (a java.lang.Class for com.bibabo.thread.artofconcurrentprogramming.ThreadStateDemo$Waiting)
        at java.lang.Thread.run(Thread.java:745)

"TimeWaitingThread" #12 prio=5 os_prio=0 tid=0x000000002048d000 nid=0x34e4 waiting on condition [0x0000000020d9f000]
   java.lang.Thread.State: TIMED_WAITING (sleeping)
        at java.lang.Thread.sleep(Native Method)
        at java.lang.Thread.sleep(Thread.java:340)
        at java.util.concurrent.TimeUnit.sleep(TimeUnit.java:386)
        at com.bibabo.thread.artofconcurrentprogramming.ThreadStateDemo$TimeWaiting.run(ThreadStateDemo.java:28)
        at java.lang.Thread.run(Thread.java:745)
        
Java层面的Lock锁阻塞的状态不是BLOCKED而是WAITING        
"ReentrantLock-Thread-2" #13 prio=5 os_prio=0 tid=0x0000000020496800 nid=0x4a4 waiting on condition [0x0000000021d9e000]
   java.lang.Thread.State: WAITING (parking)
        at sun.misc.Unsafe.park(Native Method)
        - parking to wait for  <0x000000076b5db038> (a java.util.concurrent.locks.ReentrantLock$NonfairSync)
        at java.util.concurrent.locks.LockSupport.park(LockSupport.java:175)
        at java.util.concurrent.locks.AbstractQueuedSynchronizer.parkAndCheckInterrupt(AbstractQueuedSynchronizer.java:836)
        at java.util.concurrent.locks.AbstractQueuedSynchronizer.acquireQueued(AbstractQueuedSynchronizer.java:870)
        at java.util.concurrent.locks.AbstractQueuedSynchronizer.acquire(AbstractQueuedSynchronizer.java:1199)
        at java.util.concurrent.locks.ReentrantLock$NonfairSync.lock(ReentrantLock.java:209)
        at java.util.concurrent.locks.ReentrantLock.lock(ReentrantLock.java:285)
        at com.bibabo.thread.artofconcurrentprogramming.lock.ReentrantLockDemo.lambda$main$1(ReentrantLockDemo.java:27)
        at com.bibabo.thread.artofconcurrentprogramming.lock.ReentrantLockDemo$$Lambda$2/1608446010.run(Unknown Source)
        at java.lang.Thread.run(Thread.java:745)        
```

##排查死锁、CPU飙高
*死锁*

```text
jps
jstack 进程id
Found one Java-level deadlock:

```

*CPU飙高*

```text
top -c 查看CPU飙升的Java进程PID
top -H -p PID 查看这个进程里面最消耗CPU的线程PID
printf "0x%x\n" 线程PID 转为16进制PID
jstack 进程PID | grep -A 20 十六进制线程PID
可以得到占用CPU飙高的线程的代码行

```

### JVM参数

堆大小

```
-Xms512m // 初始堆
-Xmx512m // 最大堆
-Xmn192m // 新生代大小
-XX:MetaspaceSize=128m // 元空间
-Xss512k // 栈大小

```

打印gc日志相关

```
-verbose:gc 			// 打印gc信息
-XX:+PrintGCDateStamps  // 打印gc的时间戳
-XX:+PrintGCDetails     // 打印gc详情
-XX:+PrintHeapAtGC      // 打印gc前后堆信息
-XX:+PrintGCApplicationStoppedTime // 打印gc应用线程暂停时间
-Xloggc:E:/logs/gclogs/test_gc_%p_%t.log // 指定日志打印目录，%p指pid，%t指时间戳

-XX:+UseGCLogFileRotation // 打印到多个文件中
-XX:NumberOfGCLogFiles=5 // 最多生成5个文件，满了会循环覆盖第一个文件
-XX:GCLogFileSize=30m  // 每个文件大小

```

oom相关

```
-XX:-HeapDumpOnOutOfMemoryError 
-XX:HeapDumpPath=/data/cs-dubbo-10880/javadump/cs-dubbo-jvmdump.hprof

```

禁用偏向锁

```
-XX:-UseBiasedLocking

```

服务启动的时候真实的分配物理内存给jvm

如果没有此参数，jvm启动的时候，分配的只是虚拟内存，当真正使用的时候才会分配物理内存，代码运行的时候，实时分配物理内存，导致代码运行速度变慢

jvm启动的时候速度会下降很多，如果不在意启动时长可以设置该参数

```
-XX:+AlwaysPreTouch

```

垃圾回收

G1

```
-XX:+UseG1GC

-XX:+PrintAdaptiveSizePolicy // 自适应策略  如果开启 AdaptiveSizePolicy，则每次 GC 后会重新计算 Eden、From 和 To 区的大小，计算依据是 GC 过程中统计的 GC 时间、吞吐量、内存占用量。
因为不是很了解底层原理，先慎用
-XX:G1HeapRegionSize=4m // 堆内存中一个Region的大小
每个Region被标记了E、S、O和H，说明每个Region在运行时都充当了一种角色，其中H是以往算法中没有的，它代表Humongous，这表示这些Region存储的是巨型对象（humongous object，H-obj），当新建对象大小超过Region大小一半时，直接在新的一个或多个连续Region中分配，并标记为H。
-XX:InitiatingHeapOccupancyPercent=30 // 当老年代大小占整个堆大小百分比达到该阈值时，会触发一次mixed gc
-XX:G1ReservePercent=25  // 通过-XX:G1ReservePercent指定G1为分配担保预留的空间比例，默认10%。也就是老年代会预留10%的空间来给新生代的对象晋升，如果经常发生新生代晋升失败而导致Full GC，那么可以适当调高此阈值。但是调高此值同时也意味着降低了老年代的实际可用空间。
-XX:SoftRefLRUPolicyMSPerMB=0
// SoftRefLRUPolicyMSPerMB这个参数大概意思是每1M空闲空间可保持的SoftReference对象的生存时长(单位是ms毫秒)，LRU是Least Recently Used的缩写，最近最少使用的。
这个值jvm默认是1000ms，如果被设置为0，就会导致软引用对象马上被回收掉，进而会导致重新频繁的生成新的类，而无法达到复用的效果。
先慎用

```

CMS

```
-XX:+UseConcMarkSweepGC 
-XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses 
-XX:+CMSScavengeBeforeRemark

```

# JDK

JVM + java基础类库 + java开发工具

# JRE

JVM + java基础类库

# JVM

具体实现Sun HotSpot VM、BEA JRockit VM、IBM J9 VM...

以下说的JVM都是**HotSpot VM**

作用：

- 不同操作系统下需要不同的JVM（安装JDK），从软件层面屏蔽不同操作系统在底层硬件和指令上的区别
- 类加载、执行引擎（执行字节码，垃圾收集）、运行时数据区

当运行java命令执行一个.class文件时，会由JVM的类加载器将其类信息加载至运行时数据区的方法区，后由执行引擎执行程序

## 1.类装载子系统

## 2.执行引擎

# 3.运行时数据区

## 程序计数器

线程私有，存储当前线程所需执行代码的行号指示器

## 虚拟机栈

线程私有，每执行一个方法在栈中为一个栈帧

### 栈帧

#### 局部变量表

存储局部变量，存储的引用类型可作为GCRoot

#### 操作数栈

进行运算所需的临时存储空间

```java
int a = 1;
int b = 2;
int c = a + b 

```

- 为a在局部变量表中开辟一块4字节空间，将1压入操作数栈，将操作数栈中的1出栈赋值给局部变量表a
- 为b在局部变量表中开辟一块4字节空间，将1压入操作数栈，将操作数栈中的1出栈赋值给局部变量表b
- 为c在局部变量表中开辟一块4字节空间，将局部变量表中a的值1和局部变量表中b的值2压入操作数栈，将1和2从操作数栈中弹出，进行iadd加运算，将结果3赋值给局部变量表c

#### 动态链接

将符号引用转换为直接引用

符号引用：方法的名称为静态符号

直接引用：方法真正的引用地址

当前方法运行时，所有要调用的方法，如ObjectA.hashcode()方法，将符号引用转换为直接引用地址

那是怎样找到ObjectA的直接引用地址的？

**对象头中的Klass Pointer（类型指针），该指针指向类的元信息（方法区），也就是通过这个指针找到元信息找到所要执行的方法**

#### 方法出口

记录当前方法执行完毕后的返回地址，当前方法所属的栈帧需要出栈删除

## 本地方法栈

结构与虚拟机栈相同，这块内存区域主要供本地方法使用，被native修饰的方法

## 方法区

JDK1.7及以前，实现为永久代。在JVM运行时数据区之中

JDK1.8开始，实现为元空间。使用直接内存，在JVM运行时数据区之外

主要存储：

- 常量
- 静态变量
- 类元信息：类加载器在装载类时，会将类中的方法、常量等类元信息存储在这里

## 堆

### 垃圾回收

#### 哪些对象需要被视作垃圾进行回收

##### 引用计数法

给对象中添加一个引用计数器，每有一个引用指向，计数器+1，当引用失效，技术器-1，为0时gc掉

**问题**：无法解决对象间循环引用的问题

```java
Object a = new Object();
Object b = new Object();
a.setField(b);
b.setField(a);
a = null;// want to gc
b = null;// want to gc

```

因为彼此引用指向，引用计数为1，无法gc，导致内存泄露

##### 可达性分析算法

将“GC Roots”作为起点，向下搜索引用的对象，能够搜索到的都为非垃圾对象。没有被GC Root搜索到的对象都为垃圾对象

**可以作为GC Root的节点**：虚拟机栈的局部变量表、本地方法栈的局部变量表、方法区的静态变量 常量、Thread、类加载器

#### 垃圾回收算法

对被视作为垃圾的对象进行回收

##### 标记清除

Mark-Sweep

- 标记

  确定所有需要回收的对象，并做标记

- 清除

  将被标记为垃圾的对象进行清除

缺点：

- 产生大量碎片化空间，空间不连续，而导致频繁的回收
- 标记和清除的效率都不高

##### 复制算法

Copying

- 内存分成大小相等的两块，每次只使用其中一块（使用区），当垃圾回收的时候，把存活的对象复制到另一块上（复制区），然后把当前的使用区内存整个清理掉。回收后两块区域含义颠倒

优点：

- 不会产生碎片化空间

缺点：

- 需要浪费额外的内存作为复制区
- 当存活率较高时，复制算法的效率会下降

##### 标记整理

Mark-Compact

- 标记

  同“标记清除”的第一步，确定所有需要回收的对象，并做标记

- 整理

  把存活的对象往内存的一端移动，然后回收边界以外的内存

优点：

- 不会产生碎片化空间

缺点：

- 算法相对复杂，执行步骤较多，效率偏低

#### 垃圾回收器

垃圾收集器就是上述三种算法的真正实现者。

jdk1.8及以前，除G1外都采用的分代模型进行垃圾回收，新生代、老年代、包括1.7及以前的永久代

jdk1.8以后，G1、ZGC采用的分区模型进行回收，不存在分代的概念。

##### Serial

- 新生代收集器

1. 只能使用一条线程进行垃圾收集工作
2. 并且在垃圾收集的时候，所有的工作线程都需要停止工作（STW），等待垃圾收集线程完成以后，其他线程才可以继续工作。

> 使用算法：复制算法

##### Serial Old

- 老年代收集器

是Serial收集器的老年代版本，这款收集器主要用于客户端应用程序中，也可以作为服务端的垃圾收集器。

> 使用算法：标记-整理

##### Parallel Scavenge

- 新生代收集器

Parallel Scavenge收集器是一款多线程的垃圾收集器，但是它与ParNew有很大的不同。

ParNew和CMS关注的是如何缩短垃圾收集的时间，而Parallel关注的是系统的吞吐量。

系统吞吐量 = 代码运行时间 / （代码运行时间 + 垃圾收集时间）

**高吞吐可以用在job等异步任务的场景**

> 使用算法：复制算法

##### Parallel Old

- 老年代收集器

与Parallel Scavenge是一对收集器

Parallel Scavenge + Parallel Old是JDK1.8的默认垃圾收集器

> 使用算法：标记-整理

##### ParNew

- 新生代收集器

ParNew收集器是Serial收集器的多线程版本。为了利用CPU多核多线程的优势，ParNew收集器可以运行多个线程来进行垃圾收集工作，这样可以提高垃圾收集的效率。

> 使用算法：复制算法

##### CMS

Concurrent Mark Sweep

- 老年代收集器

CMS收集器是目前老年代收集器中比较优秀的垃圾收集器。使用标记-清除算法的并发收集器。

CMS垃圾收集器是一款以获取**最短停顿时间**为目标的收集器。

CMS收集器工作过程：

- 初始标记（initial mark）

  需要Stop The World，只有GC线程进行标记。

  只是标记一下GC Roots能直接关联到的对象，速度很快

  初始标记只是标记一下GC Roots能直接关联到的对象，速度很快

- 并发标记（Concurrent mark）

  不需要STW，GC线程与用户线程一起进行。

  从GC Roots开始遍历整个对象引用的过程，这个阶段时间较长，但不需要停顿用户线程

- 重新标记（remark）

  需要Stop The World，多GC线程进行并发标记。

  为了修正并发标记期间，因为用户线程执行而导致标记产生变动（错标、漏标）的那一部分对象，这个阶段停顿时间通常比初始标记时间长，但也远比并发标记时间短

- 并发清除（Concurrent Sweep）

  不需要STW，GC线程与用户线程一起进行。

  清理删除标记阶段已被判处死亡的对象，由于基于清除算法，不需要移动存活对象，这个阶段可以和用户线程并发执行

优点：

- 最短停顿时间。**订单接单、web页面，低停顿的都可以使用CMS**

缺点：

- **对处理器资源非常敏感**。CMS默认启动的回收线程数为（CPU核心数+3）/ 4，建议4核及以上CPU使用

- 在CMS并发标记和并发清除阶段，用户线程还是活跃的，自然也会产生新的垃圾对象，那么这些垃圾对象就只能等到下一次垃圾回收的时候才能进行清除，这一部分我们叫做“**浮动垃圾**”。

  同样因为并发收集垃圾的原因，CMS收集器需要预留足够的内存空间来存储新的对象，所以CMS收集器并不能像其他收集器一样等到老年代几乎满了之后才会回收垃圾。

  在jdk5默认当老年代使用达到68%的空间后就会进行垃圾清除，而在jdk6之后这个默认值设定为92%。这个参数可以通过JVM参数-XX:CMSInitiatingOccupancyFraction参数来设定。如果这个值设置的过小垃圾回收就相对频繁，如果设置的过大就会产生“并发失败”（Concurrent Mode Failure），如果出现并发失败，那么JVM就不得不暂停用户线程，临时启用Serial Old收集器来重新进行老年代的回收，这样整个垃圾回收过程就会停顿很长的时间。因此这个值需要在实际生产过程中根据实际情况配置。

- CMS是基于标记-清除的算法实现的垃圾收集器，所以CMS垃圾收集会**产生大量的空间碎片**，由于大量的空间碎片的产生，当分配大对象找不到足够的空间时，就不得不提前进行一次Full GC。

> 使用算法：标记-清除

##### G1

- 分区模型

G1虽然抛弃了将新生代和老年代作为整块内存空间的方式，但依然保留了新生代和老年代的概念。只是老年代和新生代的内存空间不再是物理连续的了，它们都是Region的集合。

与之前的经典垃圾收集器不同，G1可以由用户自己去设置STW的最大时间，然后G1会根据STW的时间来进行内存回收，这个STW的时间包含了初始标记、最终标记和筛选回收三个阶段STW的总时间。

G1的垃圾收集(主要指Mixed GC)过程可以分为下面几个步骤：

- 初始标记：

  需要暂定所有线程，即STW，并记录下`GC Roots`能直接引用的对象，速度很快。与CMS的初始标记一样

- 并发标记

  可以与应用线程一起工作，进行可达性分析，与CMS的并发标记一样

- 最终标记

  需要暂定所有线程(STW)，根据三色标记算法修复一些引用的状态，与CMS的重新标记是一样的

- 筛选回收

  筛选回收阶段会对各个Region的回收价值和成本进行排序，根据用户所期望的GC停顿STW时间(可以通过参数 -XX:MaxGCPauseMillis设置)来制定回收计划。

  比如此时有1000个Region都满了，但根据用户设置的STW时间，本次垃圾回收只能停顿200毫秒，那么通过之前的回收成本计算，200毫秒只能回收600个Region的内存空间，那么G1就会只回收这600个Region(Collection Set，要回收的集合)的内存空间，尽量把GC的停顿时间控制在用户指定的停顿时间内。

  在回收的时候，使用的是复制算法，将一个Region中的存活对象移动到另一个空的Regin中，然后将之前的Region内存空间清空，G1就不需要像CMS那样回收完内存后因为有很多脆片还要进行整理，采用复制算法几乎不会有内存碎片

优点：

- 由于第四阶段筛选回收使用的是复制算法，所以垃圾回收后**不会产生空间碎片**
- 第四阶段筛选回收虽然是STW，但多线程清理减少了整体的GC时间，**提升了吞吐**
- 并发标记阶段是最耗时的阶段，采用了与用户线程并发处理，**减少停顿时间**
- **可预测停顿**，用户可以明确指定在一个长度为M毫秒的时间片段(通过参数`-XX:MaxGCPauseMillis`)内完成垃圾收集

CMS在并发清理阶段，垃圾收集线程是可以与用户线程一起并发执行，但G1因为内部实现太复杂就没有实现并行回收，不过到了ZGC就实现了并发收集。

> 使用算法：标记-整理 + 复制算法

##### ZGC

- 分区模型

#### 分代

新生代与老年代默认的内存比为1:2

**为啥要分代？**

不同代适合不同的回收算法。对象大多为朝生夕死，新生代作为大多数对象（除大对象）创建时所存放的位置，需要频繁的回收（相比于整个堆的Full GC），所以使用复制算法，简单高效（minor GC），且每次仅空闲1/10新生代内存即可完成复制算法。对象经历过默认15次的GC后或者Suvivor区装不下，会扔入老年代，这块区域的对象不容易死，GC频率也会低一些，所以尽可能不浪费内存，充分利用空间，即不使用复制算法，使用标记-清除、标记-整理算法，但也会耗时一些，所以要尽可能减少Full GC次数。

##### 新生代

新生代默认内存配比Eden:S0:S1为8:1:1

每一次gc，分代年龄+1，对象的分代年龄使用4bit存储在对象头当中，所以最大分代年龄为15

###### Eden区

存放新生对象

###### Survivor From区

存放上一次gc后存活的对象

###### Survivor To区

存放本次gc后存活的对象

gc后Survivor From和Survivor To区含义颠倒

##### 老年代

###### 哪些对象会进入老年代

- 动态对象年龄判断：当前放对象的Survivor区域里，一批对象的总大小大于了这块Survivor区域的内存大小的50%，那么此时大于等于这批对象年龄的对象，就可以直接进入老年代了。
- 大对象直接进入老年代。
- 15次Minor GC后还存活的对象。
- Minor GC后的对象太多无法放入Survivor区。



##### 永久代（jdk1.7及以前方法区的实现）

jdk1.7及以前，为方便方法区的回收，将这块区域也交由堆垃圾收集器来管理，1.8以后方法区的实现改为元空间



#### 调优

**为什么要调优JVM？**：减少STW

- 减少Full GC次数
- 减少每次Full GC的执行时间



1.秒杀系统，JVM调优，版本JDK1.8及以前

频繁的Full GC导致系统响应很慢

3G内存，ParNew + CMS，默认新生代老年代配比1:2，新生代1G、老年代2G

其中新生代eden区比survivor区默认比例8:1:1，eden区800M+，survivor区100M+

一个订单对象大约1M，1秒钟大约100单，第9秒堆满eden区，触发minor gc，但假设此时第9秒有一部分50单接单没有处理完，依旧有GC Root引用不可以被GC，这50M超过survivor区50%，会直接将这批对象直接放入老年代，每8秒钟有50M进入老年代，**40秒老年代被放满**，触发Full GC。

解决办法：

- 减少FullGC：survivor区太小，导致每8秒就会有50M对象扔入老年代，**调高survivor区占比为6:2:2**
- 减少MinorGC：大多数对象是朝生夕死，**调大新生代占比为2:1**

2.项目启动时频繁FullGC

metaspace满了触发FullGC，可调高metaspace大小，减少GC次数



### 对象

#### 对象头