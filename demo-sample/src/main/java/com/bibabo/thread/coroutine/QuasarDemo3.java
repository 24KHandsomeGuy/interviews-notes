package com.bibabo.thread.coroutine;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.strands.SuspendableCallable;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/2 17:57
 * @Description:
 */
public class QuasarDemo3 {

    public static void main(String[] args) throws Exception {
        //使用阻塞队列来获取结果。
        LinkedBlockingQueue<Fiber<Integer>> fiberQueue = new LinkedBlockingQueue<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        for (int i = 0; i < 100; i++) {
            int finalI = i;
            //这里的Fiber有点像Callable,可以返回数据
            Fiber<Integer> fiber = new Fiber<>((SuspendableCallable<Integer>) () -> {
                //这里用于测试内存占用量
                Fiber.sleep(1000);
                System.out.println(Thread.currentThread().getName() + ",in-" + finalI + "-" + LocalDateTime.now().format(formatter));
                return finalI;
            });
            //开始执行
            fiber.start();
            //加入队列
            fiberQueue.add(fiber);
        }
        System.out.println("全部添加完毕");
        Fiber<Integer> fiber = null;
        while ((fiber = fiberQueue.poll(5, TimeUnit.SECONDS)) != null) {
            //阻塞
            System.out.println(Thread.currentThread().getName() + ",out-" + fiber.get() + "-" + LocalDateTime.now().format(formatter));
        }
    }
}
