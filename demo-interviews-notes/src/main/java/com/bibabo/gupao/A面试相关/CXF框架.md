# CXF

官网：<https://cxf.apache.org>

文档：https://cxf.apache.org/docs/index.html

## 服务暴露类型

CXF support three major types of services:

- SOAP
- REST-ful - REST support is described [here](https://cxf.apache.org/docs/restful-services.html).
- CORBA

简述前两种

## Java使用CXF

##### pom

```
<dependency>
	<groupId>org.apache.cxf</groupId>
	<artifactId>cxf-rt-transports-http</artifactId>
	<version>2.6.16</version>
</dependency>
<dependency>
	<groupId>org.apache.cxf</groupId>
	<artifactId>cxf-rt-frontend-jaxws</artifactId>
	<version>2.6.16</version>
	<exclusions>
		<exclusion>
			<artifactId>asm</artifactId>
			<groupId>asm</groupId>
		</exclusion>
	</exclusions>
</dependency>
<dependency>
	<groupId>org.apache.cxf</groupId>
	<artifactId>cxf-rt-rs-extension-search</artifactId>
	<version>2.6.16</version>
</dependency>
<dependency>
	<groupId>org.apache.cxf</groupId>
	<artifactId>cxf-rt-rs-extension-providers</artifactId>
	<version>2.6.16</version>
</dependency>
<dependency>
	<groupId>org.apache.cxf</groupId>
	<artifactId>cxf-bundle-jaxrs</artifactId>
	<version>2.6.16</version>
</dependency>
<dependency>
	<groupId>org.apache.cxf</groupId>
	<artifactId>cxf-rt-core</artifactId>
	<version>2.6.16</version>
</dependency>
```

##### web.xml

```xml
<servlet>    
	<servlet-name>CXFService</servlet-name>    	
	<servlet-class>org.apache.cxf.transport.servlet.CXFServlet</servlet-class></servlet> 
<servlet-mapping>    
	<servlet-name>CXFService</servlet-name>    
	<url-pattern>/services/*</url-pattern>
</servlet-mapping>
```

### SOAP

**简介**：SOAP 是基于 XML 的简易协议，可使应用程序在 HTTP 之上进行信息交换。

或者更简单地说：SOAP 是用于访问网络服务的协议。

#### SOAP是什么？

- SOAP 指*简易对象访问协议*
- SOAP 是一种*通信协议*
- SOAP 用于*应用程序之间*的通信
- SOAP 是一种用于*发送消息*的格式
- SOAP 被设计用来*通过因特网*进行通信
- SOAP *独立于平台*
- SOAP *独立于语言*
- SOAP *基于 XML*
- SOAP *很简单并可扩展*
- SOAP 允许您*绕过防火墙*
- SOAP 将被作为 *W3C 标准*来发展

#### 为什么使用 SOAP？

对于应用程序开发来说，使程序之间进行因特网通信是很重要的。

目前的应用程序通过使用远程过程调用（RPC）在诸如 DCOM 与 CORBA 等对象之间进行通信，但是 HTTP 不是为此设计的。RPC 会产生兼容性以及安全问题；防火墙和代理服务器通常会阻止此类流量。

通过 HTTP 在应用程序间通信是更好的方法，因为 HTTP 得到了所有的因特网浏览器及服务器的支持。SOAP 就是被创造出来完成这个任务的。

SOAP 提供了一种标准的方法，使得运行在不同的操作系统并使用不同的技术和编程语言的应用程序可以互相进行通信。

#### SOAP语法

##### SOAP 构建模块

一条 SOAP 消息就是一个普通的 XML 文档，包含下列元素：

- 必需的 Envelope 元素，可把此 XML 文档标识为一条 SOAP 消息
- 可选的 Header 元素，包含头部信息
- 必需的 Body 元素，包含所有的调用和响应信息
- 可选的 Fault 元素，提供有关在处理此消息所发生错误的信息

所有以上的元素均被声明于针对 SOAP 封装的默认命名空间中：

<http://www.w3.org/2001/12/soap-envelope>

以及针对 SOAP 编码和数据类型的默认命名空间：

<http://www.w3.org/2001/12/soap-encoding>

##### 语法规则

这里是一些重要的语法规则：

- SOAP 消息必须用 XML 来编码
- SOAP 消息必须使用 SOAP Envelope 命名空间
- SOAP 消息必须使用 SOAP Encoding 命名空间
- SOAP 消息不能包含 DTD 引用
- SOAP 消息不能包含 XML 处理指令

##### SOAP 消息的基本结构

```xml
<?xml version="1.0"?>
<soap:Envelope
xmlns:soap="http://www.w3.org/2001/12/soap-envelope"
soap:encodingStyle="http://www.w3.org/2001/12/soap-encoding">

<soap:Header>
...
</soap:Header>

<soap:Body>
...
  <soap:Fault>
  ...
  </soap:Fault>
</soap:Body>
</soap:Envelope>
```

##### 详情请见<https://www.runoob.com/soap/soap-header.html>

##### 网上免费查询手机号归属地api为例

请求：

POST /WebServices/MobileCodeWS.asmx HTTP/1.1
Host: ws.webxml.com.cn
Content-Type: text/xml; charset=utf-8
Content-Length: <calculated when request is sent>
SOAPAction: "http://WebXml.com.cn/getMobileCodeInfo"

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <getMobileCodeInfo xmlns="http://WebXml.com.cn/">
      <mobileCode>string</mobileCode>
      <userID>string</userID>
    </getMobileCodeInfo>
  </soap:Body>
</soap:Envelope>
```

响应：

HTTP/1.1 200 OK
Content-Type: text/xml; charset=utf-8
Content-Length: <calculated when request is sent>

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <getMobileCodeInfoResponse xmlns="http://WebXml.com.cn/">
      <getMobileCodeInfoResult>string</getMobileCodeInfoResult>
    </getMobileCodeInfoResponse>
  </soap:Body>
</soap:Envelope>
```

#### CXF框架使用SOAP

##### server端

jaxws:endpoint和jaxws:server均可

```xml
<?xml version="1.0" encoding="GBK"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:jaxws="http://cxf.apache.org/jaxws" 
	xmlns:jaxrs="http://cxf.apache.org/jaxrs"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.2.xsd  
	    http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.2.xsd  
	    http://cxf.apache.org/jaxws     
	    http://cxf.apache.org/schemas/jaxws.xsd 
	    http://cxf.apache.org/jaxrs     
	    http://cxf.apache.org/schemas/jaxrs.xsd ">

	<import resource="classpath:META-INF/cxf/cxf.xml" />
	<import resource="classpath:META-INF/cxf/cxf-extension-soap.xml" />
	<import resource="classpath:META-INF/cxf/cxf-servlet.xml" />
<!-- 订单状态service -->
	<jaxws:endpoint id="OrderStatusService"
		implementor="com.chunbo.order.orderstatus.imp.OrderStatusServerImpl"
		address="/OrderStatusService" />

	<jaxws:server id="OrderStatusService2" serviceClass="com.chunbo.order.orderstatus.imp.OrderStatusServerImpl" address="/OrderStatusService2">
		<jaxws:serviceBean>
			<ref bean="orderStatusServerImpl"/>
		</jaxws:serviceBean>
	</jaxws:server>
```

暴露的接口如下：

```java
@WebService(serviceName = "OrderStatusService", endpointInterface = "com.chunbo.order.orderstatus.OrderStatusServer", targetNamespace = "http://orderstatus.order.chunbo.com/")
public interface OrderStatusServer {
	@WebMethod
	String updateOrderStatus(@WebParam(name = "orderStatus", targetNamespace = "http://orderstatus.order.chunbo.com/")String orderStatus);
	...
}
```

##### client客户端

动态代理生成服务调用类，和dubbo使用类似

```
<bean id="askWmsService" class="com.chunbo.wms.service.datasync.OrderCancelService"
      factory-bean="clientFactoryAskWms" factory-method="create"/>
<bean id="clientFactoryAskWms" class="org.apache.cxf.jaxws.JaxWsProxyFactoryBean">
    <property name="serviceClass" value="com.chunbo.wms.service.datasync.OrderCancelService"/>
    <property name="address" value="${clientFactory.askWmsService}"/>
</bean>
```

泛化调用，dubbo也有这种调用方式

```java
JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
				factory.setServiceClass(OrderExceptionService.class);
				factory.setAddress(exceptionOrderUrl);// url
				com.chunbo.order.OrderExceptionService eService = (com.chunbo.order.OrderExceptionService) factory
						.create();
```

![1645438038032](E:\笔记\A面试相关\1645438038032.png)

##### ！！！如果不使用java动态代理生成客服端调用，或者跨语言该怎么调用？

URL:http://127.0.0.1:8081/services/OrderStatusService/

POST请求

请求头headers设置Content-Type: text/xml; charset=utf-8

请求体body设置传输类型为xml

body如下：

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <updateOrderStatus xmlns="http://orderstatus.order.chunbo.com/">
      <orderStatus>{"orderId":"184957090183","orderType":"1","orderStatus":"4005","opDate":"2021-07-07 10:00:01"}</orderStatus>
    </updateOrderStatus>
  </soap:Body>
</soap:Envelope>
```

响应结果如下：

```xml
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
        <ns2:updateOrderStatusResponse xmlns:ns2="http://orderstatus.order.chunbo.com/">
            <return>{"result":1,"orderId":184957090183,"orderStatus":4005}</return>
        </ns2:updateOrderStatusResponse>
    </soap:Body>
</soap:Envelope>
```

![1645438095741](E:\笔记\A面试相关\1645438095741.png)

![1645438176122](E:\笔记\A面试相关\1645438176122.png)

##### 注意

方法参数上需要加@WebParam，且指向指定命名空间targetNamespace

```
@WebParam(name = "orderStatus", targetNamespace = "http://orderstatus.order.chunbo.com/")String orderStatus
```

否则会报错

```
Caused by: javax.xml.bind.UnmarshalException: 意外的元素 (uri:"http://orderstatus.order.chunbo.com/", local:"orderStatus")。所需元素为<{}orderStatus>
```



### REST

#### REST是什么？

REST即表述性状态传递（英文：Representational State Transfer，简称REST）是Roy Fielding博士在2000年他的博士论文中提出来的一种[软件架构](https://baike.baidu.com/item/软件架构/7485920)风格。它是一种针对[网络应用](https://baike.baidu.com/item/网络应用/2196523)的设计和开发方式，可以降低开发的复杂性，提高系统的可伸缩性。

在三种主流的[Web服务](https://baike.baidu.com/item/Web服务)实现方案中，因为REST模式的Web服务与复杂的[SOAP](https://baike.baidu.com/item/SOAP/4684413)和[XML-RPC](https://baike.baidu.com/item/XML-RPC)对比来讲明显的更加简洁，越来越多的web服务开始采用REST风格设计和实现。例如，Amazon.com提供接近REST风格的Web服务进行图书查找；[雅虎](https://baike.baidu.com/item/雅虎/108276)提供的Web服务也是REST风格的。

#### CXF框架使用REST

server服务端：

```xml
<!-- reatfull服务（http服务） -->
	<jaxrs:server id="orderStatusRestfulService" address="/orderStatus">
		<jaxrs:serviceBeans>
			<bean class="com.chunbo.order.orderstatus.imp.OrderStatusServerImpl" />
		</jaxrs:serviceBeans>
		<jaxrs:extensionMappings>
			<entry key="json" value="application/json" />
		</jaxrs:extensionMappings>
	</jaxrs:server>
```

```java
	@Override
    @SuppressWarnings("unchecked")
    @POST
    @Path("/updateOrderStatus")
    public String updateOrderStatus(@PathVariable("orderStatus") String orderStatus) {
    
    }
```

client客户端：

url：http://127.0.0.1:8081/services/orderStatus

http调用

请求头headers为Content-Type：application/json

