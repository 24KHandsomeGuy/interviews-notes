package com.bibabo.thread.test;

import lombok.SneakyThrows;

import java.util.List;
import java.util.Random;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * @author fukuixiang
 * @date 2021/4/20
 * @time 17:51
 * @description
 */
public class Test1 {

    @SneakyThrows
    public static void main(String[] args) {

        //Executors.newSingleThreadExecutor().submit();

        List<BaseDTO> baseDTOList = new CopyOnWriteArrayList<>();
        CountDownLatch countDownLatch = new CountDownLatch(3);
        new Thread(new ThreadA(baseDTOList, countDownLatch)).start();
        new Thread(new ThreadA(baseDTOList, countDownLatch)).start();
        new Thread(new ThreadA(baseDTOList, countDownLatch)).start();


        countDownLatch.await();
        System.out.println(baseDTOList);
    }

    public static class ThreadA implements Runnable {

        List<BaseDTO> dtoList;

        CountDownLatch countDownLatch;

        public ThreadA(List<BaseDTO> dtoList, CountDownLatch countDownLatch) {
            this.dtoList = dtoList;
            this.countDownLatch = countDownLatch;
        }

        @SneakyThrows
        @Override
        public void run() {
            TimeUnit.SECONDS.sleep(new Random().nextInt(10));
            dtoList.add(new GenerateOrderDTO());
            countDownLatch.countDown();
        }
    }

    public static class BaseDTO {

    }

    public static class GenerateOrderDTO extends BaseDTO {

    }

    public static class SendSmsDTO extends BaseDTO {

    }

    public static class OccupyStockDTO extends BaseDTO {

    }



}
