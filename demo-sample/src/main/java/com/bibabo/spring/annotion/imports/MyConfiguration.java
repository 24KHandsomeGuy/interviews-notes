package com.bibabo.spring.annotion.imports;

import com.bibabo.spring.annotion.imports.importselector.AnimalImportSelector;
import com.bibabo.spring.annotion.imports.domain.Person;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 17:30
 * @Description:
 */
@Configuration
@Import(value = {Person.class, AnimalImportSelector.class, PlantImportBeanDefinitionRegistrar.class})
public class MyConfiguration {
}
