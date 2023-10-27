package com.bibabo.jvm.jol;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/10/25 20:04
 * @Description
 */
public class DecorationLayoutPositionEntity {

    /**
     * 主键ID
     */
    private Long id;

    /**
     * 装修页值对象
     */
    private Long decorationPageId;

    /**
     * 装修楼层值对象
     */
    private Long decorationLayoutId;

    /**
     * 展示类型
     */
    private Integer displayType;

    /**
     * 跳转类型
     */
    private Integer forwardType;

    /**
     * 跳转信息
     */
    private String forwardKey;

    /**
     * 图片地址
     */
    private String imgUrl;

    /**
     * 数据来源
     */
    private Integer dataFrom;

    /**
     * 排序号
     */
    private Integer sort;

    /**
     *  门店属性
     */
    private StorePropertyVO storeProperty;

    /**
     * 坑位名称
     */
    private String name;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 父级ID
     */
    private Long parent;

    /**
     * 主备选（1：主选，2：备选）
     */
    private Integer backupType;

    /**
     * 扩展字段
     */
    private DecorationLayoutPositionPropertiesVo propertiesVo;

    /**
     * 操作人
     */
    private OperatorVO operatorVO;

    /**
     * 秒杀id
     */
    private Integer seckillId;

    /**
     * 秒杀名称
     */
    private String seckillName;

    /**
     * 子级坑位数据（例如分类楼层父级坑位是标签，自己坑位是标签下的坑位数据）
     */
    private List<DecorationLayoutPositionEntity> positions;
}
