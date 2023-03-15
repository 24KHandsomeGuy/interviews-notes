# Java排查问题命令

启动死锁或cpu飙高的springboot项目

nohup java -jar -Dserver.port=8088 gupao-demo-springboot-thread-0.0.1-SNAPSHOT.jar >all.log &

top命令排查

jps 或 ps -efaux | grep java找到pid

## 1.线程排查死锁

http://192.168.1.8:8088/dead 模拟死锁

jstack pid

![1646535395010](D:\AboutIT\笔记\1646535395010.png)

## 2.cpu飙高

http://192.168.1.8:8088/loop 模拟cpu飙高

![1646535603745](D:\AboutIT\笔记\1646535603745.png)

找到pid，定位飙高的线程

top -H -p 32790

![1646535699982](D:\AboutIT\笔记\1646535699982.png)

32811为飙高线程，转换为16进制

printf "0x%x\n" 32811

0x802b

 jstack 32790| grep -A 30 0x802b

![1646535974833](D:\AboutIT\笔记\1646535974833.png)

## 3.dubbo服务无法访问

检查暴露的rest协议端口

netstat -anp | grep 8080

端口是开启的，并且可以Ping通

查看catalina.out日志发现leak memory导致开启容器时失败

调配JVM参数，缩减服务器所占内存。重启就可以了

## 4.vmstat

**vmstat命令是最常见的Linux/Unix监控工具,属于sysstat包**

procs -----------memory---------- ---swap-- -----io---- --system-- -----cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0   3172 150880 152876 1652272    0    0     0     0  577  934  0  0 100  0  0	
 0  0   3172 150880 152876 1652272    0    0     0     0  510  899  0  0 100  0  0	
 0  0   3172 150880 152876 1652272    0    0     0    44  591  963  0  0 100  0  0	
 0  0   3172 150740 152876 1652272    0    0     0     0 2598 2669  1  0 98  0  0	
 0  0   3172 150204 152876 1652296    0    0     0   120 2916 2889  2  0 98  0  0	
 0  0   3172 149940 152876 1652300    0    0     0     0 3148 3073  1  0 98  0  0	
 0  0   3172 150120 152876 1652308    0    0     0     0 4121 3293  3  1 96  0  0	
 0  0   3172 150060 152876 1652312    0    0     0    56 3276 3133  2  1 98  0  0	
 0  0   3172 149768 152876 1652316    0    0     0     0 3223 3093  2  0 98  0  0	
 0  0   3172 149440 152876 1652316    0    0     0    16 3163 3141  1  1 98  0  0	
 0  0   3172 149424 152876 1652344    0    0     0     0 3005 3312  2  1 98  0  0	
 0  0   3172 149572 152876 1652364    0    0     0     0 3054 3203  2  0 98  0  0	
 0  0   3172 149568 152876 1652368    0    0     0    24 3366 3534  2  1 98  0  0	
 0  0   3172 149816 152876 1652480    0    0     0     0 1444 1921  1  0 99  0  0	

![1669969123657](D:\AboutIT\笔记\1669969123657.png)

vmstat是Virtual Meomory Statistics（虚拟内存统计）的缩写，可对操作系统的虚拟内存、进程、IO读写、CPU活动等进行监视。它是对系统的整体情况进行统计，不足之处是无法对某个进程进行深入分析。

### 输出字段意义：

#### procs

##### r

The number of processes waiting for run time.

等待运行的进程数。如果等待运行的进程数越多，意味着CPU非常繁忙。另外，如果该参数长期大于和等于逻辑cpu个数，则CPU资源可能存在较大的瓶颈。

##### b

The number of processes in uninterruptible sleep. 

处在非中断睡眠状态的进程数。意味着进程被阻塞。主要是指被资源阻塞的进程对列数（比如IO资源、页面调度等），当这个值较大时，需要根据应用程序来进行分析，比如数据库产品，中间件应用等。

#### Memory

##### swpd

the amount of virtual memory used.

 已使用的虚拟内存大小。如果虚拟内存使用较多，可能系统的物理内存比较吃紧，需要采取合适的方式来减少物理内存的使用。swapd不为0，并不意味物理内存吃紧，如果swapd没变化，si、so的值长期为0,这也是没有问题的     

##### free

the amount of idle memory.

空闲的物理内存的大小

##### buff

the amount of memory used as buffers.

用来做buffer（缓存，主要用于块设备缓存）的内存数，单位：KB

##### cache

the amount of memory used as cache.

用来做cache（缓存，主要用于缓存文件）的内存，单位：KB

##### inact

the amount of inactive memory. (-a option)

inactive memory的总量

##### active

the amount of active memory. (-a option)

active memroy的总量

si: Amount of memory swapped in from disk (/s).

#### swap

##### si

Amount of memory swapped in from disk (/s).

从磁盘交换到**swap**虚拟内存的交换页数量，单位：KB/秒。如果这个值大于**0**，表示物理内存不够用或者内存泄露了  

##### so

Amount of memory swapped to disk (/s).

从**swap**虚拟内存交换到磁盘的交换页数量，单位：KB/秒，如果这个值大于**0**，表示物理内存不够用或者内存泄露了

**内存够用的时候，这2个值都是0，如果这2个值长期大于0时，系统性能会受到影响，磁盘IO和CPU资源都会被消耗。**
    当看到空闲内存（free）很少的或接近于0时，就认为内存不够用了，这个是不正确的。不能光看这一点，还要结合si和so，如果free很少，但是si和so也很少（大多时候是0），那么不用担心，系统性能这时不会受到影响的。
    当内存的需求大于RAM的数量，服务器启动了虚拟内存机制，通过虚拟内存，可以将RAM段移到SWAP DISK的特殊磁盘段上，这样会 出现虚拟内存的页导出和页导入现象，页导出并不能说明RAM瓶颈，虚拟内存系统经常会对内存段进行页导出，但页导入操作就表明了服务器需要更多的内存了， 页导入需要从SWAP DISK上将内存段复制回RAM，导致服务器速度变慢。

#### IO

##### bi

Blocks received from a block device (blocks/s).

每秒从块设备接收到的块数，单位：块/秒 也就是读块设备。

##### bo

Blocks sent to a block device (blocks/s).

每秒发送到块设备的块数，单位：块/秒  也就是写块设备。

#### system

##### in

The number of interrupts per second, including the clock.

每秒的中断数，包括时钟中断 

##### cs

The number of context switches per second. 

每秒的环境（上下文）切换次数。比如我们调用系统函数，就要进行上下文切换，而过多的上下文切换会浪费较多的cpu资源，这个数值应该越小越好。

#### CPU

These are percentages of total CPU time.

##### us

Time spent running non-kernel code. (user time, including nice time)

用户CPU时间(非内核进程占用时间)（单位为百分比）。 us的值比较高时，说明用户进程消耗的CPU时间多

##### sy

Time spent running kernel code. (system time)

系统使用的CPU时间（单位为百分比）。sy的值高时，说明系统内核消耗的CPU资源多，这并不是良性表现，我们应该检查原因。

##### id

Time spent idle. Prior to Linux 2.5.41, this includes IO-wait time.

空闲的CPU的时间(百分比)，在Linux 2.5.41之前，这部分包含IO等待时间。

##### wa

Time spent waiting for IO. Prior to Linux 2.5.41, shown as zero.

等待IO的CPU时间，在Linux 2.5.41之前，这个值为0 .这个指标意味着CPU在等待硬盘读写操作的时间，用百分比表示。wait越大则机器io性能就越差。说明IO等待比较严重，这可能由于磁盘大量作随机访问造成，也有可能磁盘出现瓶颈（块操作）。

##### st

Time stolen from a virtual machine. Prior to Linux 2.6.11, unknown.

### 使用示例：

1: 查看vmstat命令的帮助信息

man vmstat

2: 显示活动(active)与非活动(inactive)的内存

vmstat -a 2 10

3：不加任何参数，vmstat命令只输出一条记录，这个数据是自系统上次重启之后到现在的平均数值。

vmstat

4：显示各种事件计数器表和内存统计信息，这显示不重复。

vmstat -s

5：可以扩大字段长度，当内存较大时，默认长度不够完全展示内存时，会导致字段值偏移，导致查看不便

vmstat -w 2 5

6:显示磁盘分区数据（disk partition statistics ）

vmstat -p sdc5 2 10

## 5.pidstat

pidstat是sysstat工具的一个命令，用于监控全部或指定进程的cpu、内存、线程、设备IO等系统资源的占用情况。pidstat首次运行时显示自系统启动开始的各项统计信息，之后运行pidstat将显示自上次运行该命令以后的统计信息。用户可以通过指定统计的次数和时间来获得所需的统计信息。

04:48:45 PM       PID    %usr %system  %guest    %CPU   CPU  Command
04:48:45 PM      1629    0.00    0.00    0.00    0.00     4  crond
04:48:45 PM      2465    0.01    0.04    0.00    0.05     6  zabbix_agentd
04:48:45 PM      2466    0.00    0.01    0.00    0.02     2  zabbix_agentd
04:48:45 PM      2467    0.00    0.01    0.00    0.02     1  zabbix_agentd
04:48:45 PM      2468    0.00    0.01    0.00    0.02     2  zabbix_agentd
04:48:45 PM      2469    0.00    0.00    0.00    0.00     3  zabbix_agentd
04:48:45 PM      5317    0.00    0.00    0.00    0.00     6  java
04:48:45 PM     18423    0.00    0.00    0.00    0.01     5  java
04:48:45 PM     19530    0.00    0.00    0.00    0.00     0  pidstat
04:48:45 PM     33288    0.02    0.01    0.00    0.03     4  java

每隔1秒输出1组数据（需要 Ctrl+C 才结束）

## 6.Linux下环境变量误改错修复

1，在命令行中输入
export PATH=/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11R6/bin
这样可以保证命令行命令暂时可以使用。命令执行完之后先不要关闭终端
或者cd /usr/bin 下执行vi命令

2、恢复bash_profile文件
vi ~/.bash_profile

3、很有可能是你的PATH 环境变量设置错误，比如 $PATH 漏了

```
PATH=$PATH:$PATH1

```

4、 立即生效，source ~/.bash_profile