package com.bibabo.demospringboot.httpinterface.controller;

import com.bibabo.demospringboot.common.CommonResult;
import com.bibabo.demospringboot.httpinterface.controller.model.Customer;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/12/8 11:19
 * @Description:
 */
@RestController
public class CustomerController {

    private static final Map<Long, Customer> CUSTOMER_MAP = new ConcurrentHashMap<>();

    @GetMapping("/customer/{id}")
    public CommonResult<Customer> getCustomerById(@PathVariable Long id) {
        CommonResult<Customer> result = new CommonResult<>();
        if (CUSTOMER_MAP.get(id) == null) {
            result.setCode(0);
            result.setMessage("Not exist id {" + id + "} customer.");
        } else {
            result.setCode(1);
            result.setData(CUSTOMER_MAP.get(id));
        }
        return result;
    }

    @PostMapping("/customer")
    public CommonResult createCustomer(@RequestBody Customer customer) {
        String returnMsg = "";
        if (CUSTOMER_MAP.get(customer.getId()) == null) {
            CUSTOMER_MAP.put(customer.getId(), customer);
            returnMsg = "Create id {" + customer.getId() + "} customer successfully";
        } else {
            CUSTOMER_MAP.put(customer.getId(), customer);
            returnMsg = "Update id {" + customer.getId() + "} customer successfully";
        }
        return CommonResult.builder().code(1).message(returnMsg).build();
    }
}
