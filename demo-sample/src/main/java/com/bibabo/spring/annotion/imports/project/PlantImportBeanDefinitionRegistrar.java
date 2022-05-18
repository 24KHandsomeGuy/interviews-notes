package com.bibabo.spring.annotion.imports.project;

import com.bibabo.spring.annotion.imports.project.domain.Rose;
import com.bibabo.spring.annotion.imports.project.domain.SunFlower;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanNameGenerator;
import org.springframework.beans.factory.support.RootBeanDefinition;
import org.springframework.context.annotation.ImportBeanDefinitionRegistrar;
import org.springframework.core.type.AnnotationMetadata;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 10:40
 * @Description: 将植物注册到IOC容器中
 */
public class PlantImportBeanDefinitionRegistrar implements ImportBeanDefinitionRegistrar {

    @Override
    public void registerBeanDefinitions(AnnotationMetadata importingClassMetadata, BeanDefinitionRegistry registry, BeanNameGenerator importBeanNameGenerator) {
        // IOC容器中如果存在动物，那么，也需要存在植物
        boolean isDogExist = registry.containsBeanDefinition("com.bibabo.spring.annotion.imports.project.domain.Cat");
        boolean isCatExist = registry.containsBeanDefinition("com.bibabo.spring.annotion.imports.project.domain.Dog");
        if (isDogExist && isCatExist) {
            BeanDefinition roseBeanDefinition = new RootBeanDefinition(Rose.class);
            String roseBeanName = importBeanNameGenerator.generateBeanName(roseBeanDefinition, registry);
            System.out.println("roseBeanName" + roseBeanName);
            registry.registerBeanDefinition(roseBeanName, roseBeanDefinition);

            BeanDefinition sunFlowerBeanDefinition = new RootBeanDefinition(SunFlower.class);
            String sunFlowerBeanName = importBeanNameGenerator.generateBeanName(sunFlowerBeanDefinition, registry);
            System.out.println("sunFlowerBeanName" + sunFlowerBeanName);
            registry.registerBeanDefinition(sunFlowerBeanName, sunFlowerBeanDefinition);
        }
    }

    @Override
    public void registerBeanDefinitions(AnnotationMetadata importingClassMetadata, BeanDefinitionRegistry registry) {

    }
}
