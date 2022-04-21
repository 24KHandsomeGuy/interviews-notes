package com.bibabo.lombok;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

/**
 * @author fukuixiang
 * @date 2021/4/19
 * @time 9:42
 * @description
 */
@Builder
@Getter
@Setter
public class Person {

    private int age;

    private String name;



}
