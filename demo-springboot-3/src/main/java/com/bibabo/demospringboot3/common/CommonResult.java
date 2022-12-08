package com.bibabo.demospringboot3.common;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 11:20
 * @Description:
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommonResult<T> implements Serializable {

    private T data;

    private List<T> dataList;

    /**
     * 1:成功
     * 0:失败
     */
    private Integer code;

    private String message;
}
