package com.bibabo.reflect;

import lombok.Data;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/1/5 10:37
 * @Description
 */
public class ReflectBeanTest {

    public static void main(String[] args) {
        BeanA beanA = new BeanA();
        beanA.setFlag(true);
        beanA.setWrapFlag(true);
        beanA.setName(null);
        beanA.setNoCopyField("noCopyField");

        // boolean 使用is -> Boolean 使用get
        // System.out.println(beanA.isFlag());
        // System.out.println(beanA.getWrapFlag());

        BeanB beanB = new BeanB();
        beanB.setName("zhangsan");

        // 拷贝忽略的字段
        // BeanUtils.copyProperties(beanA, beanB, "wrapFlag");

        // spring的bean拷贝null字段也会赋值
        // BeanUtils.copyProperties(beanA, beanB);

        // System.out.println(beanB);

        beanHandler(beanA, beanB, "111");
    }

    private static int beanHandler(Object source, Object target, String... ignoreFields) {
        int diffFiledValueCount = 0;
        List<String> ignoreFieldList = new ArrayList<>();
        if (ignoreFields != null && ignoreFields.length > 0) {
            ignoreFieldList = Arrays.asList(ignoreFields);
        }

        Class sourceClazz = source.getClass();
        Class targetClazz = target.getClass();
        Field[] fields = source.getClass().getDeclaredFields();
        for (Field field : fields) {
            String fieldName = field.getName();
            if (ignoreFieldList.contains(fieldName)) {
                continue;
            }
            String methodSubffix = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
            String getMethodName = "get" + methodSubffix;
            String setMethodName = "set" + methodSubffix;
            // only base type need to check is or get
            if (field.getType() == boolean.class) {
                getMethodName = "is" + methodSubffix;
            }
            try {
                Method sourceGetMethod = sourceClazz.getDeclaredMethod(getMethodName);
                Object sourceValue = sourceGetMethod.invoke(source);
                if (sourceValue == null) {
                    System.out.println("source value is null: " + fieldName);
                    continue;
                }
                Method targetGetMethod = targetClazz.getDeclaredMethod(getMethodName);
                Object targetValue = targetGetMethod.invoke(target);
                if (sourceValue.equals(targetValue)) {
                    System.out.println("target value is null or equals: " + fieldName);
                    continue;
                }
                Method targetSetMethod = targetClazz.getDeclaredMethod(setMethodName, field.getType());
                targetSetMethod.invoke(target, sourceValue);
                diffFiledValueCount++;
            } catch (NoSuchMethodException e) {
                System.out.println("no such method: " + e.getMessage());
                continue;
            } catch (InvocationTargetException | IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }
        return diffFiledValueCount;
    }
}

@Data
class BeanA {

    private boolean flag;

    private Boolean wrapFlag;

    private String name;

    private String noCopyField;
}

@Data
class BeanB {

    private boolean flag;

    private Boolean wrapFlag;

    private String name;
}