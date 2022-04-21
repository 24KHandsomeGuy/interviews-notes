package com.bibabo.thread.linked;

/**
 * @author fukuixiang
 * @date 2021/3/2
 * @time 15:57
 * @description
 */
public class Order {

    private long id;

    private int status;

    private String custName;

    public Order(long id, int status, String custName) {
        this.id = id;
        this.status = status;
        this.custName = custName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", status=" + status +
                ", custName='" + custName + '\'' +
                '}';
    }
}
