package com.bibabo.serverless;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author fukuixiang
 * @date 2021/4/1
 * @time 15:13
 * @description
 */
@Data
@AllArgsConstructor
public class Resp {

    private Integer randomId;

    private String name;

    private String msg;

}
