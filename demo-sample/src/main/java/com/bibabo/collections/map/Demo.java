package com.bibabo.collections.map;

import java.util.Objects;

/**
 * @author fukuixiang
 * @date 2020/9/21
 * @time 10:19
 * @description
 */
public class Demo implements Comparable {

    private Integer age;

    private String name;

    public Integer getAge() {
        return age;
    }

    public String getName() {
        return name;
    }

    public Demo(Integer age, String name) {
        this.age = age;
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Demo demo = (Demo) o;
        return Objects.equals(age, demo.age) &&
                Objects.equals(name, demo.name);
    }

    /*@Override
    public int hashCode() {
        return Objects.hash(age, name);
    }*/

    @Override
    public int hashCode() {
        return Objects.hash(age);
    }

    @Override
    public String toString() {
        return "Demo{" +
                "age=" + age +
                ", name='" + name + '\'' +
                '}';
    }

    @Override
    public int compareTo(Object o) {
        //return this.hashCode() - o.hashCode();
        Demo oo = (Demo)o;
        return age.intValue() - oo.age.intValue();
    }
}
