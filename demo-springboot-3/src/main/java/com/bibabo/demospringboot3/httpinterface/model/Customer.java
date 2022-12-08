package com.bibabo.demospringboot3.httpinterface.model;

import lombok.Builder;
import lombok.Data;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 11:24
 * @Description:
 */
@Data
@Builder
public class Customer {

    private Long id;

    private String name;

    private String phone;

    private String address;
}
