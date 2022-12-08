package com.bibabo.demospringboot3.httpinterface.service;

import com.bibabo.demospringboot3.common.CommonResult;
import com.bibabo.demospringboot3.httpinterface.model.Customer;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.service.annotation.GetExchange;
import org.springframework.web.service.annotation.HttpExchange;
import org.springframework.web.service.annotation.PostExchange;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 11:41
 * @Description:
 */
@HttpExchange
public interface CustomerApiCaller {

    @GetExchange("customer/{id}")
    CommonResult<Customer> getCustomerById(@PathVariable Long id);

    @PostExchange("customer")
    CommonResult createCustomer(@RequestBody Customer customer);
}
