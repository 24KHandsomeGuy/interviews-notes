package com.bibabo.algorithm.loadbalance.shortestresponse;

import com.bibabo.algorithm.loadbalance.AbstractLoadBalance;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/12 14:08
 * @Description:
 */
public class ShortestResponseLoadBalance extends AbstractLoadBalance<ShortestResponseLoadBalance.ShortestResponseServer> {

    private final ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(
            Runtime.getRuntime().availableProcessors(), Runtime.getRuntime().availableProcessors(), 0, TimeUnit.SECONDS, new LinkedBlockingQueue<>());

    public void shutdownThreadPool() {
        threadPoolExecutor.shutdown();
    }

    @Override
    protected ShortestResponseServer doSelect(List<ShortestResponseServer> serverList) {
        CompletableFuture[] cfs = new CompletableFuture[serverList.size()];
        serverList.forEach(server -> cfs[serverList.indexOf(server)] = CompletableFuture.supplyAsync(() -> server.ping(), threadPoolExecutor));
        ShortestResponseServer resultServer = new ShortestResponseServer();
        CompletableFuture cf = CompletableFuture.anyOf(cfs);
        cf.thenAccept(ip -> resultServer.setIp((String) ip));
        try {
            cf.get();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultServer;
    }

    public static class ShortestResponseServer {

        private String ip;

        public ShortestResponseServer() {
        }

        public ShortestResponseServer(String ip) {
            this.ip = ip;
        }

        public String getIp() {
            return ip;
        }

        public void setIp(String ip) {
            this.ip = ip;
        }

        public String ping() {
            int random = ThreadLocalRandom.current().nextInt(1000, 2000);
            try {
                Thread.sleep(random);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return ip;
        }
    }
}
