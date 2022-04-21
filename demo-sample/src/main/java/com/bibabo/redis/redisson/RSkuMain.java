package com.bibabo.redis.redisson;

/**
 * @author fukuixiang
 * @date 2020/6/10
 * @time 14:04
 * @description
 */
public class RSkuMain {

    private Long skuId;

    private String upcNo;

    private Integer isPopularGoods;

    public RSkuMain() {}

    public RSkuMain(Long skuId, String upcNo, Integer isPopularGoods) {
        this.skuId = skuId;
        this.upcNo = upcNo;
        this.isPopularGoods = isPopularGoods;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public void setUpcNo(String upcNo) {
        this.upcNo = upcNo;
    }

    public void setIsPopularGoods(Integer isPopularGoods) {
        this.isPopularGoods = isPopularGoods;
    }

    public Long getSkuId() {
        return skuId;
    }

    public String getUpcNo() {
        return upcNo;
    }

    public Integer getIsPopularGoods() {
        return isPopularGoods;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof RSkuMain)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (((RSkuMain) obj).getSkuId().equals(this.getSkuId())
                && ((RSkuMain) obj).getUpcNo().equals(this.getUpcNo())) {
            return true;
        }
        return false;
    }

    @Override
    public int hashCode() {
        int hashCode = 17;
        hashCode = 31 * hashCode + (this.getSkuId() == null ? 0 : this.getSkuId().hashCode());
        hashCode = 31 * hashCode + (this.getUpcNo() == null ? 0 : this.getUpcNo().hashCode());
        return hashCode;
    }

}
