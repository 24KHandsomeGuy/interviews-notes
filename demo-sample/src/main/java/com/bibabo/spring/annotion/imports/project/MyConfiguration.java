package com.bibabo.spring.annotion.imports.project;

import com.bibabo.spring.annotion.imports.project.domain.Person;
import com.bibabo.spring.annotion.imports.project.importselector.AnimalImportSelector;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportBeanDefinitionRegistrar;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:30
 * @Description:
 */
@Configuration
@Import(value = {Person.class, AnimalImportSelector.class, PlantImportBeanDefinitionRegistrar.class})
public class MyConfiguration {
}
