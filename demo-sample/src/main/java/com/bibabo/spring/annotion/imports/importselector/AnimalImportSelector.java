package com.bibabo.spring.annotion.imports.importselector;

import org.springframework.context.annotation.ImportSelector;
import org.springframework.core.type.AnnotationMetadata;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 23:27
 * @Description: 将动物注册到IOC中
 */
public class AnimalImportSelector implements ImportSelector {

    @Override
    public String[] selectImports(AnnotationMetadata annotationMetadata) {
        return new String[]{"Cat", "Dog"};
    }
}
