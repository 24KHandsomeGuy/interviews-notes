# SpringBoot自动装配

## main

main启动java进程扫描@SpringBootApplication注解

```java
@SpringBootApplication
public class CuratorSpringBootStarterTestApplication {
    public static void main(String[] args) {
        SpringApplication.run(CuratorSpringBootStarterTestApplication.class, args);
    }
}
```

## @SpringBootApplication

```java
// ...
@EnableAutoConfiguration
// ...
public @interface SpringBootApplication {
   
}
```

## @EnableAutoConfiguration 

开启自动装配

```java
// ...
@Import({AutoConfigurationImportSelector.class})
public @interface EnableAutoConfiguration {
    String ENABLED_OVERRIDE_PROPERTY = "spring.boot.enableautoconfiguration";
	// ...
}
```

## AutoConfigurationImportSelector

org.springframework.boot.autoconfigure.AutoConfigurationImportSelector 该类是Springframework.boot下的包，派生自org.springframework.context.annotation.ImportSelector

```java
/* 
 * @since 3.1
 * ...
 */
public interface ImportSelector {

	/**
	 * Select and return the names of which class(es) should be imported based on
	 * the {@link AnnotationMetadata} of the importing @{@link Configuration} class.
	 * @return the class names, or an empty array if none
	 */
	String[] selectImports(AnnotationMetadata importingClassMetadata);

```

### ImportSelector

ImportSelector接口 since spring 3.1 selectImports含有批量加载类功能

例如下

```java
@Import(MyImportSelector.class)
public class CuratorSpringBootStarterTestApplication {
```

```java
public class MyImportSelector implements ImportSelector {

    @Override
    public String[] selectImports(AnnotationMetadata importingClassMetadata) {
        // 返回需要装载到容器的@Configuration or 直接传你所需要装载的目标bean
        return new String[] {"com.chunbo.importselector.MyImportSelectorConfiguration"};
    }
}
```

### AutoConfigurationImportSelector

```java
public class AutoConfigurationImportSelector implements DeferredImportSelector, BeanClassLoaderAware,
      ResourceLoaderAware, BeanFactoryAware, EnvironmentAware, Ordered {
        // ...
        @Override
		public String[] selectImports(AnnotationMetadata annotationMetadata) {
		if (!isEnabled(annotationMetadata)) {
			return NO_IMPORTS;
		}
        // 返回的该实体中的List<String> configurations，显然springboot中批量加载的是@Configuration。
        // 那么他是如何找到我们自定义的加了@Configuration注解类的呢？下面
		AutoConfigurationEntry autoConfigurationEntry = getAutoConfigurationEntry(annotationMetadata);
		return StringUtils.toStringArray(autoConfigurationEntry.getConfigurations());
	}
        // ...
}
```

接上#getAutoConfigurationEntry()方法

```java
protected AutoConfigurationEntry getAutoConfigurationEntry(AnnotationMetadata annotationMetadata) {
		if (!isEnabled(annotationMetadata)) {
			return EMPTY_ENTRY;
		}
		AnnotationAttributes attributes = getAttributes(annotationMetadata);
		// 获取所有候选的@Configuration
		List<String> configurations = getCandidateConfigurations(annotationMetadata, attributes);
		configurations = removeDuplicates(configurations);
		Set<String> exclusions = getExclusions(annotationMetadata, attributes);
		checkExcludedClasses(configurations, exclusions);
		configurations.removeAll(exclusions);
		configurations = getConfigurationClassFilter().filter(configurations);
		fireAutoConfigurationImportEvents(configurations, exclusions);
		return new AutoConfigurationEntry(configurations, exclusions);
	}
```

### Spring SPI

是通过Spring的SPI机制

SpringFactoriesLoader加载classpath:META-INF/spring.factories文件

接上#getCandidateConfigurations()方法

```java
protected List<String> getCandidateConfigurations(AnnotationMetadata metadata, AnnotationAttributes attributes) {
    	// 通过Spring的SPI获取classpath:META-INF/spring.factories文件中所有的key为
    	// org.springframework.boot.autoconfigure.EnableAutoConfiguration的value集合
    	// 这样我们自定义的@Configuration注解就会被扫描装载到了
		List<String> configurations = SpringFactoriesLoader.loadFactoryNames(getSpringFactoriesLoaderFactoryClass(),
				getBeanClassLoader());
		Assert.notEmpty(configurations, "No auto configuration classes found in META-INF/spring.factories. If you "
				+ "are using a custom packaging, make sure that file is correct.");
		return configurations;
	}
```



# XXX-spring-boot-starter

接上

## 1.spring.factories

classpath:META-INF/下新建spring.factories

```properties
org.springframework.boot.autoconfigure.EnableAutoConfiguration=spring.boot.autoconfigure.CuratorAutoConfiguration
```

## 2.创建Configuration

```java
@Configuration 
@EnableConfigurationProperties(CuratorPropertites.class) // 启动配置文件
public class CuratorAutoConfiguration {

    @Bean(initMethod = "start", destroyMethod = "close")
    public CuratorFramework curatorClient(CuratorPropertites curatorPropertites) {
        return CuratorFrameworkFactory.builder()
                .connectString(curatorPropertites.getConnectString())
                .retryPolicy(curatorPropertites.getRetryPolicy())
                .connectionTimeoutMs(curatorPropertites.getConnectionTimeoutMs())
                .sessionTimeoutMs(curatorPropertites.getSessionTimeoutMs()).build();
        // extended if necessary.  etc. etc.
    }
}
```

至此一个starter就完成了。如果你想要从application.properties文件中获取一些配置

## 3.创建Propertites

```
@ConfigurationProperties(prefix = "curator") // springboot-application.properties
public class CuratorPropertites {
	
}
```

## 4.提示功能spring-boot-configuration-processor

```
 <dependency>
 	<groupId>org.springframework.boot</groupId>
 	<artifactId>spring-boot-configuration-processor</artifactId>
 	<optional>true</optional>
 </dependency>
```

