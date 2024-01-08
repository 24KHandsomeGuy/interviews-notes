package com.bibabo.date;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.concurrent.TimeUnit;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/27 14:26
 * @Description
 */
public class InstantTest {

    public static void main(String[] args) throws InterruptedException {
        Instant threeSecondAgo = Instant.now();
        System.out.println(LocalDateTime.ofInstant(threeSecondAgo, ZoneId.systemDefault()));
        TimeUnit.SECONDS.sleep(3);

        System.out.println(Duration.between(threeSecondAgo, Instant.now()).toMillis());

        System.out.println(Instant.now().toEpochMilli() - threeSecondAgo.toEpochMilli());


    }
}
