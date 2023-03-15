## 一. 概要介绍

```properties
#重要网址
项目主页: https://nacos.io/
git: https://github.com/alibaba/nacos
#Nacos Eureka consul zookeeper 对比CAP
https://blog.csdn.net/fly910905/article/details/100023415
#Eureka工作原理:
https://blog.csdn.net/qwe86314/article/details/94552801
Nacos = Eureka + spring cloud config
#spring cloud 中文网站
http://springcloud.cn/channel/9
#springboot/springCloud微服务注册中心使用Nacos替还eureka
https://www.jianshu.com/p/48285de011cd

```

## 二. 安装配置

```properties
# nacos server配置安装
UAT ip: 10.254.128.113:8848
登录用户: es/es
项目目录: /data/java_8/nacos/
数据库地址:wmswdb.uat.chunbo.com:3309  数据库账号密码: wms/Z@NRJOd7  数据库:quartz
配置集群地址: xx/conf/cluster.conf  修改ip:port  10.254.128.113
控制台地址: http://10.254.128.113:8848/nacos/index.html
初始登录用户:nacos nacos

启动命令:sh startup.sh
关闭命令:sh shutdown.sh
```

## 三. spring-boot配置

```properties
 <dependency>
     <groupId>com.alibaba.boot</groupId>
     <artifactId>nacos-config-spring-boot-starter</artifactId>
     <version>0.2.4</version>
</dependency>

##nacos主机配置
nacos.config.server-addr=10.254.128.113:8848
```

## 四. spring-cloud配置

```xml
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-alibaba-nacos-config</artifactId>
    <version>2.1.1.RELEASE</version>
</dependency>
```

```yaml
spring:
  application:
    name: dms-addr-es
#  profiles:
#    active: dev, devdb
    #active: prod
  cloud:
    nacos:
      config:
        server-addr: 10.254.128.113:8848
        namespace: 4da5cd62-8418-46e6-9f75-83792d829875
        file-extension: yaml
        group: dms
        ext-config[0]:
          data-id: dms-addr-es-dev.yaml
          group: dms
        ext-config[1]:
          data-id: dms-addr-es-devdb.yaml
          group: dms
```



## 四. 配置中心关键定义

```properties
#命名空间, namspace, 用来隔离租户, 比如WMS, DMS, OMS, PAY, STOCK等
用于进行租户粒度的配置隔离。不同的命名空间下，可以存在相同的 Group 或 Data ID 的配置。Namespace 的常用场景之一是不同环境的配置的区分隔离，例如开发测试环境和生产环境的资源（如配置、服务）隔离等。
#配置分组: 默认DEFAULT_GROUP
Nacos 中的一组配置集，是组织配置的维度之一。通过一个有意义的字符串（如 Buy 或 Trade ）对配置集进行分组，从而区分 Data ID 相同的配置集。当您在 Nacos 上创建一个配置时，如果未填写配置分组的名称，则配置分组的名称默认采用 DEFAULT_GROUP 。配置分组的常见场景：不同的应用或组件使用了相同的配置类型，如 database_url 配置和 MQ_topic 配置。
#配置集 ID
Nacos 中的某个配置集的 ID。配置集 ID 是组织划分配置的维度之一。Data ID 通常用于组织划分系统的配置集。一个系统或者应用可以包含多个配置集，每个配置集都可以被一个有意义的名称标识。Data ID 通常采用类 Java 包（如 com.taobao.tc.refund.log.level）的命名规则保证全局唯一性。此命名规则非强制。
```

## 五. 最佳实践

```properties
#阿里官方建议, 我们使用该建议
命名空间: 用来区分线上, uat, dev, 预上线等
配置分组: 用来区分oms, pay, wms等
配置集: 类似于之前的配置文件名称, 可以通过profile或者ext-config[]数组来指定多个文件


#第一组配置（common配置是公共属性 数据库、redis、mq等，dev全局一套）
spring.cloud.nacos.config.ext-config[0].data-id=common.yaml
spring.cloud.nacos.config.ext-config[0].group=common-config

#业务模块配置（独立配置属性）
spring.cloud.nacos.config.ext-config[1].data-id=member.yaml
spring.cloud.nacos.config.ext-config[1].group=member-config
#动态刷新
spring.cloud.nacos.config.ext-config[1].refresh=true

```

## 六. 工作原理

```
客户端从服务器端拉取模式: 客户端维护了一个长轮询的任务，定时去拉取发生变更的配置信息，然后将最新的数据推送给 Listener 的持有者
客户端维护无状态的轮询(默认10毫秒检查一次), 从服务端拉取配置信息, 更新本地配置信息 , 并保存配置信息的md5作为校验值. 
从本地缓存读取配置信息是判断md5是否一致, 不一致的话更新
本地更新后, 通过观察者模式回调更新.
```

