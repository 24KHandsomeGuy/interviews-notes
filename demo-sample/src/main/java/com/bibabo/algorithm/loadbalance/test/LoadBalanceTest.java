package com.bibabo.algorithm.loadbalance.test;

import com.bibabo.algorithm.loadbalance.shortestresponse.ShortestResponseLoadBalance;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/11 10:08
 * @Description:
 */
public class LoadBalanceTest {

    private static final ThreadPoolExecutor executor = new ThreadPoolExecutor(
            Runtime.getRuntime().availableProcessors(), Runtime.getRuntime().availableProcessors(), 0, TimeUnit.SECONDS, new LinkedBlockingQueue<>());

    public static void main(String[] args) {
        /*List<String> addressList = Arrays.asList("192.168.1.1:8081", "192.168.1.2:8082", "192.168.1.3:8083");

        // TODO round robin
        SimpleRoundRobinLoadBalance<String> simpleRoundRobinLoadBalance = new SimpleRoundRobinLoadBalance<>();
        for (int i = 0; i < 10; ++i) {
            executor.execute(() -> System.out.println("round robin load balance" + simpleRoundRobinLoadBalance.select(addressList)));
        }

        WeightRoundRobinLoadBalance weightRoundRobinLoadBalance = new WeightRoundRobinLoadBalance();
        List<WeightRoundRobinLoadBalance.WeightRoundRobin> weightRoundRobinList = new ArrayList<>();
        weightRoundRobinList.add(new WeightRoundRobinLoadBalance.WeightRoundRobin<>("192.168.1.1:8081", 2));
        weightRoundRobinList.add(new WeightRoundRobinLoadBalance.WeightRoundRobin<>("192.168.1.2:8082", 3));
        weightRoundRobinList.add(new WeightRoundRobinLoadBalance.WeightRoundRobin<>("192.168.1.3:8083", 5));
        for (int i = 0; i < 10; ++i) {
            System.out.println("weight round robin load balance" + weightRoundRobinLoadBalance.select(weightRoundRobinList).getElement());
        }

        SmoothWeightRoundRobinLoadBalance smoothWeightRoundRobinLoadBalance = new SmoothWeightRoundRobinLoadBalance();
        List<SmoothWeightRoundRobinLoadBalance.SmoothWeight> weightList = new ArrayList<>();
        weightList.add(new SmoothWeightRoundRobinLoadBalance.SmoothWeight<>("192.168.1.1:8081", 2));
        weightList.add(new SmoothWeightRoundRobinLoadBalance.SmoothWeight<>("192.168.1.2:8082", 3));
        weightList.add(new SmoothWeightRoundRobinLoadBalance.SmoothWeight<>("192.168.1.3:8083", 5));
        for (int i = 0; i < 10; ++i) {
            System.out.println("smooth weight round robin load balance" + smoothWeightRoundRobinLoadBalance.select(weightList).getElement());
        }

        // TODO random
        RandomLoadBalance<String> randomLoadBalance = new RandomLoadBalance<>();
        for (int i = 0; i < 10; ++i) {
            executor.execute(() -> System.out.println("random load balance" + randomLoadBalance.select(addressList)));
        }*/

        /*WeightRandomLoadBalance weightRandomLoadBalance = new WeightRandomLoadBalance();
        List<WeightRandomLoadBalance.WeightRandom> weightRandomList = new ArrayList<>();
        weightRandomList.add(new WeightRandomLoadBalance.WeightRandom<>("192.168.1.1:8081", 2));
        weightRandomList.add(new WeightRandomLoadBalance.WeightRandom<>("192.168.1.2:8082", 3));
        weightRandomList.add(new WeightRandomLoadBalance.WeightRandom<>("192.168.1.3:8083", 5));
        for (int i = 0; i < 10; ++i) {
            System.out.println("random weight round robin load balance" + weightRandomLoadBalance.select(weightRandomList).getElement());
        }*/

        /*// TODO hash
        List<String> addressList = Arrays.asList("192.168.1.1:8081", "192.168.1.2:8082", "192.168.1.3:8083");
        ConsistentHashLoadBalance consistentHashLoadBalance = new ConsistentHashLoadBalance(addressList);
        for (int i = 0; i < 10; i++) {
            int appendPort = i;
            if (i % 3 == 0) {
                appendPort = 0;
            }
            System.out.println("consistent hash client Ip:" + "111.111.111.111:" + appendPort + ",server Ip:" + consistentHashLoadBalance.select("111.111.111.111:" + appendPort));
        }*/

        /*// TODO least active
        List<LeastActiveLoadBalance.LeastActiveServer> serverList = new ArrayList<>();
        serverList.add(new LeastActiveLoadBalance.LeastActiveServer("192.168.1.1:8081"));
        serverList.add(new LeastActiveLoadBalance.LeastActiveServer("192.168.1.2:8082"));
        serverList.add(new LeastActiveLoadBalance.LeastActiveServer("192.168.1.3:8083"));
        LeastActiveLoadBalance leastActiveLoadBalance = new LeastActiveLoadBalance(serverList);
        for (int i = 0; i < 1000; i++) {
            System.out.println("least active ,server Ip:" + leastActiveLoadBalance.select(null));
        }
        leastActiveLoadBalance.setCloseFlag(true);*/

        // TODO shortest response
        List<ShortestResponseLoadBalance.ShortestResponseServer> serverList = new ArrayList<>();
        serverList.add(new ShortestResponseLoadBalance.ShortestResponseServer("192.168.1.1:8081"));
        serverList.add(new ShortestResponseLoadBalance.ShortestResponseServer("192.168.1.2:8082"));
        serverList.add(new ShortestResponseLoadBalance.ShortestResponseServer("192.168.1.3:8083"));
        ShortestResponseLoadBalance shortestResponseLoadBalance = new ShortestResponseLoadBalance();
        for (int i = 0; i < 10; i++) {
            System.out.println("shortest response, select server Ip:" + shortestResponseLoadBalance.select(serverList).getIp());
        }
        shortestResponseLoadBalance.shutdownThreadPool();

        executor.shutdown();
    }
}
