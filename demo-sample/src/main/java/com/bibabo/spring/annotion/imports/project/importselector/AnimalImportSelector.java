package com.bibabo.spring.annotion.imports.project.importselector;

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
        return new String[]{"com.bibabo.spring.annotion.imports.project.domain.Cat", "com.bibabo.spring.annotion.imports.project.domain.Dog"};
    }
}
