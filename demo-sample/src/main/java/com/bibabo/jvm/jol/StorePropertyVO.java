package com.bibabo.jvm.jol;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/10/25 20:04
 * @Description
 */
public class StorePropertyVO {

    /**
     * 商家
     */
    private VenderPropertyVO venderProperty;
    /**
     * 门店/门店组ID
     */
    private Integer storeId;
    /**
     * 门店/门店组名称
     */
    private String storeName;
    /**
     * 门店类型(2：门店组、1：普通门店)
     * @see
     */
    private Integer category;
    /**
     * 1, "主力店"2, "区域平台店"3, "全国平台店"
     */
    protected Integer storeFlag;
    /**
     * 门店Logo
     */
    protected String storeLogo;
}
