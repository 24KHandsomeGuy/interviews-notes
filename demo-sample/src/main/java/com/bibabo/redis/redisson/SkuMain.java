package com.bibabo.redis.redisson;

/**
 * @author fukuixiang
 * @date 2020/6/4
 * @time 17:39
 * @description
 */
public class SkuMain {
    private String upcNo;

    private Integer skuId;

    private String skuCode;

    public void setSkuCode(String skuCode) {
        this.skuCode = skuCode;
    }

    public String getSkuCode() {
        return skuCode;
    }

    public void setUpcNo(String upcNo) {
        this.upcNo = upcNo;
    }

    public void setSkuId(Integer skuId) {
        this.skuId = skuId;
    }

    public String getUpcNo() {
        return upcNo;
    }

    public Integer getSkuId() {
        return skuId;
    }
}
