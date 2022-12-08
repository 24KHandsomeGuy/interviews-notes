package com.bibabo.demospringboot3.controller;

import com.bibabo.demospringboot3.common.CommonResult;
import com.bibabo.demospringboot3.httpinterface.model.Customer;
import com.bibabo.demospringboot3.httpinterface.service.CustomerApiCaller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 10:52
 * @Description:
 */
@RestController
public class HelloController {

    @Autowired
    CustomerApiCaller customerApiCaller;

    @GetMapping("/hello/{name}")
    public String sayHello(@PathVariable String name) {
        return "hello:" + name + ", this is springboot 3";
    }

    @GetMapping("/customer/{id}")
    public CommonResult<Customer> getCustomerById(@PathVariable Long id) {
        CommonResult<Customer> commonResult = customerApiCaller.getCustomerById(id);
        return commonResult;
    }

    @PostMapping("/customer/{id}")
    public CommonResult createCustomer(@PathVariable Long id) {
        return customerApiCaller.createCustomer(Customer.builder().id(id).name("Damon").phone("18511111112").address("北京天安门").build());
    }
}
