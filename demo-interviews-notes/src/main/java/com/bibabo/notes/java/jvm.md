#多线程

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