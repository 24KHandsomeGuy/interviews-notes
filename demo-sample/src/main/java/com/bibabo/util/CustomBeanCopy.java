package com.bibabo.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/1/5 14:13
 * @Description bean 拷贝
 */
@Slf4j
public abstract class CustomBeanCopy {

    /**
     * bean copy
     *
     * @param source
     * @param target
     * @param ignoreFields
     * @return
     */
    public static int beanCopy(Object source, Object target, String... ignoreFields) {
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
            if (!CollectionUtils.isEmpty(ignoreFieldList) && ignoreFieldList.contains(fieldName)) {
                log.info("bean copy ignore field: {}", fieldName);
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
                    log.info("bean copy source value is null: {}", fieldName);
                    continue;
                }
                Method targetGetMethod = targetClazz.getDeclaredMethod(getMethodName);
                Object targetValue = targetGetMethod.invoke(target);
                if (sourceValue.equals(targetValue)) {
                    log.info("bean copy target value is null or equals: {}", fieldName);
                    continue;
                }
                Method targetSetMethod = targetClazz.getDeclaredMethod(setMethodName, field.getType());
                targetSetMethod.invoke(target, sourceValue);
                diffFiledValueCount++;
            } catch (NoSuchMethodException e) {
                log.warn("bean copy no such method: {}", e.getMessage());
                continue;
            } catch (InvocationTargetException | IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }
        return diffFiledValueCount;
    }
}
