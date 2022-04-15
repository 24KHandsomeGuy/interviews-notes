

### ExtensionLoader

1.指定名称扩展点

ExtensionLoader.getExtensionLoader(Class<T> type).getExtension(String name);

2.@Adaptive 适配器扩展点

ExtensionLoader.getExtensionLoader(Class<T> type).getAdaptiveExtension();

(1).@Adaptive 类上，直接使用

(2).@Adaptive方法上，动态生成适配器 目的是为了通过URL来匹配到对应的实现类

3.@Activate 激活扩展点

ExtensionLoader.getExtensionLoader(Class<T> type).getActivateExtension(URL url, String[] values, String group);





```
dubbo%3A%2F%2F10.254.128.111%3A20881%2Fcom.chunbo.wms.protocol.tools.db.DbToolsService%3Fanyhost%3Dtrue%26application%3Dwms-api%26default.timeout%3D10000%26dubbo%3D2.8.4%26generic%3Dfalse%26interface%3Dcom.chunbo.wms.protocol.tools.db.DbToolsService%26logger%3Dlog4j%26methods%3DexecuteSql%26organization%3Dwms%26owner%3Dwms%26pid%3D26404%26revision%3D0.0.6%26serialization%3Dkryo%26side%3Dprovider%26threads%3D1000%26timestamp%3D1603682885904, rest%3A%2F%2F10.254.128.111%3A8081%2Fdubbo%2Fcom.chunbo.wms.protocol.tools.db.DbToolsService%3Fanyhost%3Dtrue%26application%3Dwms-api%26default.timeout%3D10000%26dubbo%3D2.8.4%26generic%3Dfalse%26interface%3Dcom.chunbo.wms.protocol.tools.db.DbToolsService%26logger%3Dlog4j%26methods%3DexecuteSql%26organization%3Dwms%26owner%3Dwms%26pid%3D26404%26revision%3D0.0.6%26serialization%3DFST%26server%3Dservlet%26side%3Dprovider%26threads%3D1000%26timestamp%3D1603682885929
```

```
dubbo://10.254.128.111:20881/com.chunbo.wms.protocol.tools.db.DbToolsService?anyhost=true&
application=wms-api&
default.timeout=10000&dubbo=2.8.4&
generic=false&
interface=com.chunbo.wms.protocol.tools.db.DbToolsService&
logger=log4j&
methods=executeSql&
organization=wms&
owner=wms&
pid=26404&
revision=0.0.6&
serialization=kryo&
side=provider&
threads=1000&
timestamp=1603682885904,
```



Dubbo启动

版本2.7.8

1.使用SpringBoot的Registar机制启动

@DubboComponentScan

```
@Documented
@Import(DubboComponentScanRegistrar.class)
public @interface DubboComponentScan {
```

DubboComponentScanRegistrar.class

```
public class DubboComponentScanRegistrar implements ImportBeanDefinitionRegistrar {

@Override
public void registerBeanDefinitions(AnnotationMetadata importingClassMetadata, BeanDefinitionRegistry registry) {

Set<String> packagesToScan = getPackagesToScan(importingClassMetadata);

registerServiceAnnotationBeanPostProcessor(packagesToScan, registry);

// @since 2.7.6 Register the common beans
registerCommonBeans(registry);
}

/**
* Registers {@link ServiceAnnotationBeanPostProcessor}
*
* @param packagesToScan packages to scan without resolving placeholders
* @param registry       {@link BeanDefinitionRegistry}
* @since 2.5.8
*/
private void registerServiceAnnotationBeanPostProcessor(Set<String> packagesToScan, BeanDefinitionRegistry registry) {

BeanDefinitionBuilder builder = rootBeanDefinition(ServiceAnnotationBeanPostProcessor.class);
builder.addConstructorArgValue(packagesToScan);
builder.setRole(BeanDefinition.ROLE_INFRASTRUCTURE);
AbstractBeanDefinition beanDefinition = builder.getBeanDefinition();
BeanDefinitionReaderUtils.registerWithGeneratedName(beanDefinition, registry);

}
// 注册ServiceAnnotationBeanPostProcessor bean
```

注册ServiceAnnotationBeanPostProcessor.class 快要过期 迁移到父类

```
@Deprecated
public class ServiceAnnotationBeanPostProcessor extends ServiceClassPostProcessor {
```

ServiceClassPostProcessor.class

```
public class ServiceClassPostProcessor implements BeanDefinitionRegistryPostProcessor, EnvironmentAware,
// 回调
@Override
public void postProcessBeanDefinitionRegistry(BeanDefinitionRegistry registry) throws BeansException {
// 注册DubboListener
// @since 2.7.5
registerInfrastructureBean(registry, DubboBootstrapApplicationListener.BEAN_NAME, DubboBootstrapApplicationListener.class);
```

DubboBootstrapApplicationListener.class监听器 Spring容器初始和销毁回调监听

```
public class DubboBootstrapApplicationListener extends OnceApplicationContextEventListener implements Ordered {
```

```
@Override
public void onApplicationContextEvent(ApplicationContextEvent event) {
if (event instanceof ContextRefreshedEvent) {
onContextRefreshedEvent((ContextRefreshedEvent) event);
} else if (event instanceof ContextClosedEvent) {
onContextClosedEvent((ContextClosedEvent) event);
}
}

private void onContextRefreshedEvent(ContextRefreshedEvent event) {
dubboBootstrap.start();
}

private void onContextClosedEvent(ContextClosedEvent event) {
dubboBootstrap.stop();
}
```

服务端启动

一个ServiceConfig对应一个dubbo:service 

```
<dubbo:service interface="com.chunbo.wms.protocol.inventory.freezing.WmsFreezingInvCleanService" ref="wmsFreezingInvCleanServiceImpl" protocol="dubbo, rest"/>

<dubbo:registry protocol="zookeeper" address="${zookeeper.url}" />
```

```
伪代码
for (协议) {
	for (所有注册中心) {
		Invoker<?> invoker = proxyFactory.getInvoker(this.ref, this.interfaceClass, registryURL.addParameterAndEncoded("export", url.toFullString()));
		// 发布invoker 此时invoker的protocol为registry 动态适配为RegistryProtocol
        Exporter<?> exporter = protocol.export(invoker);
	}
}
```

Protocol$Adpative动态适配器

url.getProtocol() = registry 找到RegistryProtocol

```
package com.alibaba.dubbo.rpc;
import com.alibaba.dubbo.common.extension.ExtensionLoader;
public class Protocol$Adpative implements com.alibaba.dubbo.rpc.Protocol {
public void destroy() {throw new UnsupportedOperationException("method public abstract void com.alibaba.dubbo.rpc.Protocol.destroy() of interface com.alibaba.dubbo.rpc.Protocol is not adaptive method!");
}
public int getDefaultPort() {throw new UnsupportedOperationException("method public abstract int com.alibaba.dubbo.rpc.Protocol.getDefaultPort() of interface com.alibaba.dubbo.rpc.Protocol is not adaptive method!");
}
public com.alibaba.dubbo.rpc.Exporter export(com.alibaba.dubbo.rpc.Invoker arg0) throws com.alibaba.dubbo.rpc.Invoker {
if (arg0 == null) throw new IllegalArgumentException("com.alibaba.dubbo.rpc.Invoker argument == null");
if (arg0.getUrl() == null) throw new IllegalArgumentException("com.alibaba.dubbo.rpc.Invoker argument getUrl() == null");com.alibaba.dubbo.common.URL url = arg0.getUrl();
String extName = ( url.getProtocol() == null ? "dubbo" : url.getProtocol() );
if(extName == null) throw new IllegalStateException("Fail to get extension(com.alibaba.dubbo.rpc.Protocol) name from url(" + url.toString() + ") use keys([protocol])");
com.alibaba.dubbo.rpc.Protocol extension = (com.alibaba.dubbo.rpc.Protocol)ExtensionLoader.getExtensionLoader(com.alibaba.dubbo.rpc.Protocol.class).getExtension(extName);
return extension.export(arg0);
}
public com.alibaba.dubbo.rpc.Invoker refer(java.lang.Class arg0, com.alibaba.dubbo.common.URL arg1) throws java.lang.Class {
if (arg1 == null) throw new IllegalArgumentException("url == null");
com.alibaba.dubbo.common.URL url = arg1;
String extName = ( url.getProtocol() == null ? "dubbo" : url.getProtocol() );
if(extName == null) throw new IllegalStateException("Fail to get extension(com.alibaba.dubbo.rpc.Protocol) name from url(" + url.toString() + ") use keys([protocol])");
com.alibaba.dubbo.rpc.Protocol extension = (com.alibaba.dubbo.rpc.Protocol)ExtensionLoader.getExtensionLoader(com.alibaba.dubbo.rpc.Protocol.class).getExtension(extName);
return extension.refer(arg0, arg1);
}
}
```

RegistryProtocol.class

```
public <T> Exporter<T> export(Invoker<T> originInvoker) throws RpcException {
	// 协议发布
	doLocalExport(originInvoker);
	// 注册地址到注册中心
	registry.register(registedProviderUrl);
	}
	
```

协议发布 此处把url协议头换成真实协议 如dubbo rest 继续通过URL 动态适配到具体实现类 如DubboProtocol.class

```
public <T> Exporter<T> export(Invoker<T> invoker) throws RpcException {
    
    ...
    // 启动
    this.openServer(url);
    ...
    return exporter;
}
```

```
private void openServer(URL url) {
    ...
        // 创建
            this.serverMap.put(key, this.createServer(url));
        ...

}
```

```
private ExchangeServer createServer(URL url) {
    ...
        ExchangeServer server;
        try {
        // HeaderExchanger
            server = Exchangers.bind(url, this.requestHandler);
        } catch (RemotingException var5) {
            throw new RpcException("Fail to start server(url: " + url + ") " + var5.getMessage(), var5);
        }
...
        return server;
    }
}
```

```HeaderExchanger
public class HeaderExchanger implements Exchanger {
    public static final String NAME = "header";

    public HeaderExchanger() {
    }

    public ExchangeClient connect(URL url, ExchangeHandler handler) throws RemotingException {
        return new HeaderExchangeClient(Transporters.connect(url, new ChannelHandler[]{new DecodeHandler(new HeaderExchangeHandler(handler))}));
    }

    public ExchangeServer bind(URL url, ExchangeHandler handler) throws RemotingException {
        return new HeaderExchangeServer(Transporters.bind(url, new ChannelHandler[]{new DecodeHandler(new HeaderExchangeHandler(handler))}));
    }
}

```





### Dubbo中为什么都叫适配器呢？

适配的目标接口Protocol

被适配对象 真正的执行的Protocol功能实现类对象

既然同源，为什么还叫适配呢？首先肯定不是包装或者代理，因为这两者都是功能的增强。在这里，并没有对其功能增强，而是使用原有功能，只不过需要帮助找到确切的实现类，这个寻找确切实现类的过程，就是适配的能力

试想，最经典的适配器模式描述，想使用330v插口充电，但是只有220v的充电器，那么就需要适配器把330v电流转换220v，这样就具有了330v充电的功能了

非同源适配

1.不同伏特的插座，但只有一个220v充电器：

现 既有360v又有440v充电插座，这时可以使用多功能转换器，通过某种按钮来选择 到底适配到哪种伏特的电流上，两个方法，一个把440v转成220v，一个把330v转成220v

我把220v的充电器适配到了多个不同伏特的插座里

2.不同伏特的充电器，但只有一个220v的插座

现在问题反过来了，现在在中国大陆 只有220v的插座，但是我刚从香港，美国，日本回来，3种充电器分别为330v，440v，550v。需要一个转换器，转换器的目标是把插座的220v电流转为330v，440v，550v，这是一个方法。选择到底如何转换需要通过一个开关，这个开关是一个参数

我把插座的220v电流适配了多个不同伏特的充电器

同理2，dubbo中的适配器也是如此，例如Protocol，是适配器通过对URL进行解析 从而来确定到底把谁的功能适配进来使用。不同的点是，传统的适配器是不同源的，dubbo里的适配器 是同源的

同源还叫适配器，使我一度很疑惑，直到有一天在买饭的路上 我在思考 茅塞顿开

1.所有的实现类（包括适配器） 都实现Protocol，他们是同源，但他们也不是同源

2.类比去看

对于设计者来说，只有一个220v的插座，而充电器却有多种非220v的，需要适配器

对于设计者来说，只有一个发布协议的Protocol.bind()，而真实的实现却有多种非Protocol.bind()（真实实现都是Protocol1.bind1();Protocol3.bind3();），需要适配器

站在适配器的视角来看，我到底要适配哪个对象的哪个功能？其实这N种被适配的类，对于适配器来说他们不是同源的，抽象出来看，结果可以如下

Protocol$Adpative implements Protocol { void bind(); }

DubboProtocol implements Protocol1  { void bind1(); }

HttpProtocol implements Protocol2  { void bind2(); }

GrpcProtocol implements Protocol3  { void bind3(); }

......

适配器只是把Protocol不具备的功能，如DubboProtocol.bind1() GrpcProtocol.bind3()适配进来，他们是不同接口的不同的方法实现

用户只需要关心Protocol接口，找他的唯一实现类也就是适配器，给出一个选择URL，不需要关心Protocol1，Protocol2，Protocol3







# Dubbo实战

## protocol

### thrift协议的使用

1.下载

http://thrift.apache.org下载thrift，exe和gz文件都要下载

[thrift-0.15.0.tar.gz](http://www.apache.org/dyn/closer.cgi?path=/thrift/0.15.0/thrift-0.15.0.tar.gz)

[Thrift compiler for Windows (thrift-0.15.0.exe)](http://www.apache.org/dyn/closer.cgi?path=/thrift/0.15.0/thrift-0.15.0.exe)

我下载的0.12.0把0.15.0替换成0.12.0就好

2.配置环境变量，即任意路径使用thrift编译命令

​	1)将下载的exe文件改名改成thrift.exe放在一个目录下

​	2)设置环境，在path这个里面加入刚才exe文件放的目录位置，比我的D:\thrift

​	3)打开cmd输入thrift或thrift -version 没问题表示可以了，如果不可以需要source一下或重启

3.编译

 把刚才下载的那个thrift-0.12.0.tar.gz文件解压

找到你需要用到的语言，我用的是java， 我的路径是"D:\SoftInstallPackage\thrift\thrift-0.12.0\tutorial\java"

生成thrift文件，在此目录下执行语法：thrift -r --gen java tutorial.thrift

<https://thrift.apache.org/tutorial/>有示例

4.自定义thrift文件

```c++
namespace cl shared
namespace cpp shared
namespace d share // "shared" would collide with the eponymous D keyword.
namespace dart shared
namespace java shared
namespace perl shared
namespace php shared
namespace haxe shared
namespace netstd shared

//请求
struct HelloThriftRequest { 
  1: string value
}
//响应
struct HelloThriftResponse{ 
  1: i32 key
}
//接口
service HelloThriftService {
  HelloThriftResponse sayHello(1: HelloThriftRequest request)
}
```

执行thrift -r --gen java helloThrift.thrift

5.把编译好的java用到dubbo项目中

```java
/**
 * Autogenerated by Thrift Compiler (0.12.0)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
package com.icu.services;

import com.icu.dto.thrift.HelloThriftRequest;
import com.icu.dto.thrift.HelloThriftResponse;

@SuppressWarnings({"cast", "rawtypes", "serial", "unchecked", "unused"})
@javax.annotation.Generated(value = "Autogenerated by Thrift Compiler (0.12.0)", date = "2021-12-30")
public class HelloThriftService {

  public interface Iface {

    public HelloThriftResponse sayHello(HelloThriftRequest request) throws org.apache.thrift.TException;

  }
  ...
}
```

provider的实现类实现HelloThriftService$Iface接口

```java
public class HelloThriftServiceImpl implements HelloThriftService.Iface {
    @Override
    public HelloThriftResponse sayHello(HelloThriftRequest request) throws TException {
        ...
    }
}
```

```xml
dubbo配置文件
<dubbo:protocol name="thrift" port="3030"/>
<bean id="helloThrift" class="com.icu.services.impl.HelloThriftServiceImpl"/>
<dubbo:service interface="com.icu.services.HelloThriftService$Iface" ref="helloThrift" protocol="thrift"/>
```

引入pom

```xml
<dependency>
  <groupId>org.apache.thrift</groupId>
  <artifactId>libthrift</artifactId>
  <version>0.12.0</version>
</dependency>
```

启动服务器，consumer端就可以调用了

#### 测试

| 协议/次数=ms | dubbo长连接 | thrift | hession短连接 | http/rest | webservice | Triple | grpc |
| ------------ | :---------: | :----: | :-----------: | :-------: | ---------- | ------ | ---- |
| 1            |     76      |   48   |      48       |    226    |            |        |      |
| 10           |     94      |   72   |      68       |    248    |            |        |      |
| 100          |     214     |  166   |      172      |    624    |            |        |      |
| 1000         |     609     |  478   |     1702      |   1825    |            |        |      |
| 10000        |    2824     |  2437  |     25312     |   19552   |            |        |      |
| 100000       |    17592    | 15471  |               |  197687   |            |        |      |
| 1000000      |   160736    | 151798 |               |           |            |        |      |

dubbo、thrift、rest

thrift：可跨语言，需要IDL编译成不同语言

dubbo：只能java通信，tcp传输，长链接，默认hessian2序列化

rest：可跨语言，现在非常流行的通信方式，但是效率远不及上面两种协议。但是因为是跨语言且不需要像thrift		  使用IDL编译，使用起来很方便。比如我们前端使用PHP，那么可以使用rest协议来发布接口

#### Dubbo中的序列化

测试中发现，kryo序列化传输List<T>时会由于乱码异常而找不到类，但是ArrayList<T>则可以，其他序列化传输List<T>没有发现异常。

经过dubbo官网查找发现，Kryo和FST完全发挥出高性能，最好将那些需要被序列化的类注册到dubbo系统中

```fallback
GregorianCalendar
InvocationHandler
BigDecimal
BigInteger
Pattern
BitSet
URI
UUID
HashMap
ArrayList
LinkedList
HashSet
TreeSet
Hashtable
Date
Calendar
ConcurrentHashMap
SimpleDateFormat
Vector
BitSet
StringBuffer
StringBuilder
Object
Object[]
String[]
byte[]
char[]
int[]
float[]
double[]
```

我手动注册一下List<T>试试，class List has no zero-arg constructor！

由于List是接口，没有构造器抛异常

所以如果想在kryo或者FST中使用集合，那么传输时就要精准到类