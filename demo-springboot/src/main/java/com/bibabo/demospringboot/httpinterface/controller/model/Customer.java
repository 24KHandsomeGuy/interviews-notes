package com.bibabo.demospringboot.httpinterface.controller.model;

import lombok.Data;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 11:24
 * @Description:
 */
@Data
public class Customer {

    private Long id;

    private String name;

    private String phone;

    private String address;
}
