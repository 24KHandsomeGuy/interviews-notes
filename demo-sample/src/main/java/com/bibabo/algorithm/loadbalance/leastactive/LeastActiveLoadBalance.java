package com.bibabo.algorithm.loadbalance.leastactive;

import com.bibabo.algorithm.loadbalance.LoadBalance;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/12 11:28
 * @Description:
 */
public class LeastActiveLoadBalance implements LoadBalance<String, String> {

    private final List<LeastActiveServer> serverList;

    private volatile boolean closeFlag = false;

    public LeastActiveLoadBalance(List<LeastActiveServer> serverList) {
        this.serverList = serverList;
        this.serverList.stream().filter(server -> server.getActive() == null).forEach(server -> server.setActive(new AtomicInteger(0)));
        new Thread(() -> {
            while (!closeFlag) {
                try {
                    TimeUnit.SECONDS.sleep(5);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                this.serverList.stream().filter(server -> server.getActive().get() > 0).forEach(server -> server.getActive().getAndDecrement());
            }
        }).start();
    }

    public void setCloseFlag(boolean closeFlag) {
        this.closeFlag = closeFlag;
    }

    @Override
    public String select(String s) {
        Optional<LeastActiveServer> optional = this.serverList.stream().min((o1, o2) -> o1.getActive().get() - o2.getActive().get());
        LeastActiveServer server = optional.get();
        // 获取ip增加活跃度
        server.getActive().getAndIncrement();
        return server.getIp();
    }

    public static class LeastActiveServer {

        private String ip;

        private AtomicInteger active;

        public LeastActiveServer(String ip) {
            this.ip = ip;
        }

        public LeastActiveServer(String ip, AtomicInteger active) {
            this.ip = ip;
            this.active = active;
        }

        public String getIp() {
            return ip;
        }

        public void setIp(String ip) {
            this.ip = ip;
        }

        public AtomicInteger getActive() {
            return active;
        }

        public void setActive(AtomicInteger active) {
            this.active = active;
        }
    }
}
