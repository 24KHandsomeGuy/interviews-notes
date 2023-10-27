package com.bibabo.jvm.jol;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/10/25 20:03
 * @Description
 */
public class SceneCardVO {

    /**
     * 主标题
     */
    private String title;

    private String titleImg;

    private Integer titleImgWidth;

    private Integer titleImgHeight;
    /**
     * 副标题
     */
    private String subTitle;

    /**
     * 背景色
     */
    private String background;

    /**
     * 宽
     */
    private Integer imgWidth;

    /**
     * 高
     */
    private Integer imgHeight;

    /**
     * 主标题颜色
     */
    private String titleColor;

    /**
     * 副标题颜色
     */
    private String subTitleColor;

    /**
     * 文案
     */
    private String context;

    /**
     * 文案颜色
     */
    private String contextColor;

    /**
     * 是否自动抓取商品
     */
    private Boolean isAuto;

    /**
     * 自动抓取活动id
     */
    private Long activityId;


    private Integer bgImgWidth;

    private Integer bgImgHeight;

    private String bgImg;

    // 卡片类型 秒杀、场景2N、场景3N(上1下2)、场景3N(上2下1)、场景4N(上2下2)、场景4N(上1下3)
    private Integer sceneCardType;


    private List<DecorationLayoutPositionEntity> sceneCardContent;
}
