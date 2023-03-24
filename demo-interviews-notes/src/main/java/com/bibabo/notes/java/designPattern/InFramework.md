##创建型模式
###简单工厂模式
通过if else选择创建责任链条
###工厂方法模式
Spring中的BeanFactory
###抽象工厂模式
###单例模式
Spring中的单例模式

###建造者模式
Lombok的@Builder，建造器模式
组装责任链条时，单向链表的构建，可以使用建造者模式
###原型模式
Spring中通过一个bean去clone
##结构型
###代理模式
Spring中的AOP动态代理，事务
###适配器模式
Dubbo中的自适应扩展点，动态生成一个适配器对象，这个适配器对象通过URL适配到指定的处理类
责任链条中需要生成损废单据，可以将通用的生成损益单据的service，适配到当前链条中进来
将第三方订单model适配成春播订单model
###装饰器模式
IO流
Dubbo中协议发布时的包装器QosProtocolWrapper->ProtocolListenerWrapper->ProtocolFilterWrapper->DubboProtocol
责任链条中生成损废单后，某种情况还需要生成报废的流水传给ERP系统，此时需要增强生成流水这个动作，即Wrapper一下。
###门面模式
某些聚合动作的类
###享元模式
数据库连接池，拿出来用，再还回去
##行为型模式
###策略模式
某种策略的选择
Dubbo中的LoadingStrategy，dubboSPI机制的支持，目前有三种策略，分别扫描不同的文件路径DubboInternalLoadingStrategy、DubboLoadingStrategy、ServicesLoadingStrategy
Curator中连接服务端失败的RetryPolicy重试策略
订单履约状态流转时，决定下一个处理节点是哪个的时候使用策略模式
###责任链模式
责任链模式，需要事先组装好链条，依次向下调用
各种Filter：javax.servlet中的Filter。Dubbo中的TimeoutFilter、AccessLogFilter、CacheFilter、TokenFilter...
库房报缺质检确认，订单质检完毕链条->生成损废单链条->不足起订量上架链条->上传信息至客服系统链条...
###状态模式
订单履约状态流转，通过每一个节点执行完毕后的所属状态，决定一个处理节点是什么
###模板方法模式
Dubbo中的负载均衡算法，AbstractLoadBalance模板方法对空和一个invoker做了统一处理，具体的算法实现下发到实现类
创建订单时，订单的接收途径可以是不同的，创建订单的方法是相同的抽离为模板方法，但是创建订单后占用库存以及失败的处理是不同的，子类具体实现
Curator中连接服务端失败的SleepingRetry重试策略
###观察者模式
Spring的事件监听机制，ApplicationListener接口，可以监听到容器刷新事件ContextRefreshedEvent、容器关闭事件ContextClosedEvent