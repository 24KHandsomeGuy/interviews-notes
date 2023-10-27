package com.bibabo.jvm.jol;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/10/25 20:02
 * @Description
 */
public class DecorationLayoutPositionPropertiesVo {

    /**
     * 商品 SKU
     */
    private  Long sku;

    /**
     * 图片宽高
     */
    private Integer imgWidth;

    /**
     * 图片高度
     */
    private Integer imgHeight;


    /**
     * 定位坐标x值
     */
    private Double locationX;

    /**
     * 定位坐标y值
     */
    private Double locationY;

    /**
     * 任务ID，潘多拉领取优惠券使用
     */
    private Integer taskId;

    /**
     *  是否有弹框（0：否，1：是）
     */
    private Boolean hasPop;

    /**
     * 人群标签
     */
    private List<String> userTag;

    /**
     * 弹框类型：1:图文，2：按钮跳转
     */
    private Integer popType;

    /**
     * 提示文案
     */
    private String toastInfo;

    /**
     * 弹框图片
     */
    private String toastImg;

    /**
     * 按钮文案
     */
    private String buttonInfo;

    /**
     * 按钮跳转地址
     */
    private String buttonForwardUrl;

    /**
     * 文本信息
     */
    private String text;

    /**
     * 副文本信息
     */
    private String subtext;

    /**
     * 轮播文字--关键字
     */
    private String keyword;

    /**
     * Tab标签语
     */
    private String subTitle;

    /**
     * 指定门店
     * 是否混排（是否指定门店，0否，1是）
     */
    private Integer specifiedStore = 0;

    /**
     * 商家名称
     */
    private String venderName;
    /**
     * 门店/门店组名称
     */
    private String storeName;

    /**
     * 商品编码
     */
    private String rfId;

    /**
     * 海报模版ID
     */
    private Long posterTemplateId;
    /**
     * 文案内容
     */
    private List<String> contents;

    /**
     * 角标 逗号分隔 每个单位最多4个字符
     */
    private String cornerMark;

    /**
     * 按钮颜色
     */
    private String buttonColour;

    /**
     * 文字颜色
     */
    private String wordColour;

    /**
     * 专柜ID
     */
    private String counterId;

    /**
     * 专柜名称
     */
    private String counterName;

    /**
     * spuId
     */
    private String spuId;

    /**
     * 商家SKU
     */
    private String venderSku;

    /**
     * 星图key集合
     */
    private List<AdKeyVO> adKeys;

    /**
     * 商品数据来源
     * 默认是1：代表之前的所有物美和其他商家的，2：新百百货，3：重百电器，4：重百百货
     */
    private Integer skuResourceType;

    /**
     * 商品数据来源下的子来源
     * 当 skuResourceType = 4 时 重百百货平台商品：1，重百百货门店商品：2
     */
    private Integer skuResourceSubType;

    /**
     * 指定商家渲染商家ID
     */
    private Integer specifiedVenderId;

    /**
     * 促销ID，商品通用楼层促销数据源使用
     */
    private String promotionId;

    /**
     * 商品折叠
     */
    private WareFoldVO wareFoldVO;

    /**
     * 外部门店id
     */
    private String sapId;

    private SceneCardVO sceneCards;
}
