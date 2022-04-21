package com.bibabo.hardware;


import sun.misc.Contended;

/**
 * @author fukuixiang
 * @date 2022/3/9
 * @time 13:23
 * @description CPU高速缓存
 * L1、L2、L3 高速缓存由缓存行组成，一个缓存行64byte，也就是说一次最少加载64byte，不够的话需要预加载（类似于操作系统与硬盘交互的）
 * CPU之间是存在可见性的如：MESI协议
 * 如果多CPU同时并行操作同一变量，该变量所在缓存行由多个对象组成，如：obj0、obj1、obj2、obj3各16byte，全部加载进来
 * CPU0想计算obj0，需要加载obj0、obj1、obj2、obj3进缓存行。CPU1想计算obj1，也如此
 * CPU0、CPU1互使其重新加载缓存行(我们假设两个线程在不同CPU执行)
 * 造成伪共享问题
 * 伪共享:这个缓存行可以被许多线程访问。如果其中一个修改了v2，那么会导致Thread1和Thread2都会重新加载整个缓存行。你可能会疑惑为什么修改了v2会导致Thread1和Thread2重新加载该缓存行，毕竟只是修改了v2的值啊。
 * 虽然说这些修改逻辑上是互相独立的，但同一缓存行上的数据是统一维护的，一致性的粒度并非体现在单个元素上。这种不必要的数据共享就称之为“伪共享”(False Sharing)。
 * 为了避免该场景，可将对象对齐填充为64byte
 * 或jdk1.8使用@Contened注解、使用该注解需要加jvm参数-XX:-RestrictContended 128字节的padding
 * 空间换时间
 */
public class CacheLineExample implements Runnable {

    public final static long ITERATIONS = 500L * 1000L * 100L;
    // private static ValuePadding[] longs;
    private static ValueNoPadding[] longs;


    // 每个线程对象所需更改的数组下标
    private int arrayIndex;

    public CacheLineExample(int arrayIndex) {
        this.arrayIndex = arrayIndex;
    }

    @Override
    public void run() {
        long i = ITERATIONS + 1;
        while (0 != --i) {
            // 只修改当前线程所属的数组下标对象值
            longs[arrayIndex].value = 0L;
        }
    }


    public static void main(String[] args) throws InterruptedException {
        for (int i = 1; i < 10; i++) {
            System.gc();
            final long start = System.currentTimeMillis();
            runTest(i);
            final long end = System.currentTimeMillis();
            System.out.println("次数：" + i + "，执行时间：" + (end - start));
        }

    }

    private static void runTest(int thread_num) throws InterruptedException {
        Thread[] threads = new Thread[thread_num];
        longs = new ValueNoPadding[thread_num];

        for (int i = 0; i < longs.length; i++) {
            // longs[i] = new ValuePadding();
            longs[i] = new ValueNoPadding();
        }

        for (int i = 0; i < threads.length; i++) {
            threads[i] = new Thread(new CacheLineExample(i));
        }

        for (Thread t : threads) {
            t.start();
        }

        for (Thread t : threads) {
            t.join();
        }
    }


    public final static class ValuePadding {
        protected long p1, p2, p3, p4, p5, p6, p7;
        protected volatile long value = 0L;
        protected long p8, p9, p10, p11, p12, p13, p14;
        protected long p15;
    }

    @Contended
    public final static class ValueNoPadding {
        protected volatile long value = 0L;
    }
}
