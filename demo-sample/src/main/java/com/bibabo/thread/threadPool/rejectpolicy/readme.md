##dubbo中的线程拒绝策略
丢弃并且上报信息
org.apache.dubbo.common.threadpool.support.AbortPolicyWithReport
1）输出了一条警告级别的日志，日志内容为线程池的详细设置参数，以及线程池当前的状态，还有当前拒绝任务的一些详细信息。可以说，这条日志，使用dubbo的有过生产运维经验的或多或少是见过的，这个日志简直就是日志打印的典范，其他的日志打印的典范还有spring。得益于这么详细的日志，可以很容易定位到问题所在
2）输出当前线程堆栈详情，这个太有用了，当你通过上面的日志信息还不能定位问题时，案发现场的dump线程上下文信息就是你发现问题的救命稻草。
3）继续抛出拒绝执行异常，使本次任务失败，这个继承了JDK默认拒绝策略的特性

##Netty中的线程池拒绝策略

org.jboss.netty.handler.execution.NewThreadRunsPolicy
Netty中的实现很像JDK中的CallerRunsPolicy，舍不得丢弃任务。不同的是，CallerRunsPolicy是直接在调用者线程执行的任务。而 Netty是新建了一个线程来处理的。

所以，Netty的实现相较于调用者执行策略的使用面就可以扩展到支持高效率高性能的场景了。但是也要注意一点，Netty的实现里，在创建线程时未做任何的判断约束，也就是说只要系统还有资源就会创建新的线程来处理，直到new不出新的线程了，才会抛创建线程失败的异常。

##activeMq中的线程池拒绝策略

activeMq中的策略属于最大努力执行任务型，当触发拒绝策略时，在尝试一分钟的时间重新将任务塞进任务队列，当一分钟超时还没成功时，就抛出异常
```java
new RejectedExecutionHandler() {
@Override public void rejectedExecution(final Runnable r, final ThreadPoolExecutor executor) { try { executor.getQueue().offer(r, 60, TimeUnit.SECONDS); } catch (InterruptedException e) { throw new RejectedExecutionException("Interrupted waiting for BrokerService.worker"); } throw new RejectedExecutionException("Timed Out while attempting to enqueue Task."); } });
```

##pinpoint中的线程池拒绝策略
pinpoint的拒绝策略实现很有特点，和其他的实现都不同。他定义了一个拒绝策略链，包装了一个拒绝策略列表，当触发拒绝策略时，会将策略链中的rejectedExecution依次执行一遍。

##自定义拒绝策略
1.打印日志
2.打印堆栈信息
3.是否超时熔断，是则舍弃
4.判断是否有内存，有就new，没有就caller