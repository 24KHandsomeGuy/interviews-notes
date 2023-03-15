项目较老，使用cxf框架完成SOA架构通信。因此没有服务的接口的管理

# OMS

## OMS-ORDER-FORWARD-WebService

#### 订单状态相关处理接口

class：com.chunbo.order.orderstatus.imp.OrderStatusServerImpl

##### 1.暂停订单服务

url：oms-ws.chunbo.com/services/orderStatus/cancelOrder

作用：将订单暂停。订单暂停后，flow履约步骤会停止

服务调用者：订单逆向oms_order_cancel_flow current_process=20节点

```java
UPDATE oms_db.oms_order_status SET is_pause = 1 where order_id = xxx
if (暂停订单失败) {
	return "暂停订单失败";
}
if (该订单已拆单是父单) {
    return "不能取消";
}
if (os.getOrderStatus() < 2010erp占用) {
    return "占用erp前可取消";
}
if (os.getOrderStatus() == 9001取消状态) {
    return "已经是取消状态可以取消";
}
return "订单已经过了erp占用节点，已经或即将下发WMS，需要询问WMS是否可以取消";
```

##### 2.订单拒收服务（没有请求日志，接口已经过时了）

url：oms-ws.chunbo.com/services/orderStatus/rejectOrder

作用：将订单暂停，返回调用者是否可以操作拒收

服务调用者：未知

```java
if (暂停订单失败) {
	return "暂停订单失败";
}
if (os.getIsFinish() == 1) {
	// oms_order_status.is_finish字段，目前只有下发wms成功后会设置为1，当wms有状态回传时这个字段又变为了0？就连妥投、拒收这种终止状态也没有将这个字段设置为1？？很不理解
	return "完成状态，不能拒收，只能退货";
}
return "订单可以拒收";
```

##### 3.订单退货服务

url：oms-ws.chunbo.com/services/orderStatus/returnOrder

作用：订单退货，修改oms_order_main.is_refund字段为1

服务调用者：订单逆向oms_push_issuccess process_flag=105

```
if (订单取消) {
	return "订单已经取消";
}
if (订单未交接出库) {
	return "订单未交接出库不允许取消";
}
update oms_order_main set is_refund = 1 where order_id = xxx and ifnull(is_refund, 0) = 0
return "更新退货标识成功";
```

##### 4.暂停或重新启用订单服务

url：oms-ws.chunbo.com/services/orderStatus/puaseOrderStatus

作用：和暂停订单服务1的核心作用是一样的，不同的是这个接口只修改oms_order_status.is_pause = 1

服务调用者：订单逆向oms_push_issuccess process_flag=60如果取消失败重新启动订单

```java
if (暂停订单) {
	return "暂停订单成功";
} else {
	return "暂停订单失败";
}
```

##### 5.获取订单是否已经付款服务

url：oms-ws.chunbo.com/services/orderStatus/payedOrderStatus

服务调用者：未知

```sql
SELECT is_payed FROM oms_order_main WHERE order_id = #{orderId}
```

##### 6.更改订单为取消服务

url：oms-ws.chunbo.com/services/orderStatus/statuOrderStatus

作用：更改订单为取消，更改状态表的状态为取消并结束订单生命，更改主表类型为取消类型

服务调用者：订单逆向oms_push_issuccess process_flag=60如果取消成功则处理取消回调

```sql
UPDATE oms_order_status SET order_status = 9001,is_finish = 1,update_date = now() 
WHERE order_id = #{orderId} 
```

```sql
UPDATE oms_order_main SET order_type = 100, update_date = now(), modify_date = now() WHERE order_id = #{orderId}
```

##### 7.查询订单状态服务

url：oms-ws.chunbo.com/services/orderStatus/getOrderStatus

作用：查询订单状态

服务调用者：前端

```sql
SELECT	* FROM	oms_order_status WHERE	a.order_id = #{orderId}
```

```sql
select * from order_return_detail WHERE order_id IN (xxx)
```

```
1.查询订单状态
2.http://omscancel-ws.uat.chunbo.com/services/detail/orderIds
if (询问逆向是否存在销退明细) {
	// 有销退明细把销退id返回调用者
	return "{\"result\":1,\"orderId\":" + orderId + ",\"orderStatus\":" + os.getOrderStatus() + ",\"returnId\":" + returnId + "}";
} else {
	return "{\"result\":1,\"orderId\":" + orderId + ",\"orderStatus\":" + os.getOrderStatus() + "}";
}
```

##### 8.修改订单状态服务（很重要的服务）

url：oms-ws.chunbo.com/services/orderStatus/updateOrderStatus

作用：修改订单状态。一张订单的状态机流转触发事件后激活相应的Action（如妥投后需要推凭证到结算系统）

​			所有触发事件后激活的Action，需要做幂等

服务调用者：WMS、TMS、DMS、前端

```
if (修改订单状态失败) {
	return "修改订单状态失败";
}
// 修改订单状态成功，执行幂等 redisSentinelService.eval(RedisLuaEnum.SETNX_AND_EXPIRE_TIME.getLuaScript(), Arrays.asList(redisKey), Arrays.asList("1", RedisPrefixEnum.ORDER_STATUS_UPDATE_IDEMPOTENT.getExpireSeconds() + ""));
if (rst <= 0) { 
	return "{\"result\":1,\"orderId\":" + orderId + ",\"orderStatus\":" + os.getOrderStatus() + "}";
}
/**
* 幂等的校验需要借助数据存储来做，这里借助redis做幂等校验
* 我这里是将所有的Action统一做幂等校验，不建议！！！
* 出现的幂等
* 1.Action没有存储源。如发送短信，推送微信模板这类，没法做幂等，需要借助数据源。
* 2.Action在数据库中有记录。如妥投推送凭证是需要插入异步队列表异步处理，可以通过数据库本身做幂等。insert ignore、replace into
* 3.Action是通知其他系统。比如MQ，或实时调用通知其他系统则需要被通知方做幂等
* 所以如果再遇到这种情况，不要统一做幂等了。因为在分布式事务没办法保证的情况下，每个Action做幂等可以尽可能* 的保证分布式的数据一致性。比如一个状态机事件的发生，可能触发10个动作，在执行第三个动作时tomcat异常关
* 闭，接口是整体失败的，但是幂等校验已经生效，等下次调用方再调用时，后面7个动作将没有机会执行
* 
* 如果把幂等校验后置，放到所有Action的最后，那么将无法保证并发，还需要做并发，而且部分失败的情况还是需要每* 个Action分别做幂等才能保证
* 
* 所以不建议做统一幂等
*/
// Action1 三方订单需要通过MQ发送消息到三方系统，三方系统接收到消息通知第三方商户（如美团、饿了么）
AbstractOrderStatusProcess adapter = OrderStatusFactory.createAdapterService(OrderStatusAdapterEnum.getAdapterName(orderStatusParam.getStatus()));
adapter.handler(orderStatusParam);
// Action2 妥投、拒收、配送失败、丢包这四个事件任意一个发生都需要触发推结算动作
insert into oms_db.oms_order_status_rule(异步推结算队列表)
// Action3 妥投更改附赠记录
update wmsindb.oms_gift_cust_record  set update_date = now(), gift_status = 1
// Action4 充值卡的妥投，自动发送电子发票给用户预留
http://api.uat.chunbo.com/Einvoice/mailApi
// Action5 如果是企销订单,三方订单和爱奇艺充值订单, 需要将订单推送到财务系统
```



##### 9.支付系统检查订单是否可以支付

url：oms-ws.chunbo.com/services/orderStatus/getPayCheckOrder

接口方法映射：getPayCheckOrder

接口描述：校验订单是否还可以支付。超时30分钟不可以支付，逆向存在取消记录不可以支付

已知服务调用者：Pay

目前支持的协议：SOAP、HTTP

```sql
SELECT order_id FROM oms_order_main WHERE order_id = #{orderId} AND create_date &lt;= SUBDATE(SYSDATE(), INTERVAL 30 MINUTE) AND order_source != 1025 limit 0,1
union
select order_id from ordercancel_db.oms_order_cancel  where order_id = #{orderId} limit 0,1
```

##### 10.根据交易单号获取子订单最大状态

url：oms-ws.chunbo.com/services/orderStatus/getSubOrderMaxStatus

接口方法映射：getSubOrderMaxStatus

接口描述：根据交易单号获取所有子订单的最大状态

已知服务调用者：Order-third三方系统查询销售计划状态

目前支持的协议：SOAP、HTTP

```
select os.order_status
   		  from oms_order_main om,
	        oms_order_status os
	  where om.order_id = os.order_id
	    and om.root_parent_id=#{orderId}
	    and om.is_parent = 0 
	    and om.order_type not in(41,5,4)
	  order by os.order_status desc,os.create_date desc
 	limit 0,1
```

##### 11.获取订单来源列表

url：oms-ws.chunbo.com/services/orderStatus/getOrderSource

接口方法映射：getOrderSource

接口描述：获取订单来源列表

已知服务调用者：TMS

目前支持的协议：SOAP、HTTP

```
select order_source as orderSource, order_source_value as orderSourceName
		from oms_order_source
```

##### 12.获取配送类型列表

url：oms-ws.chunbo.com/services/orderStatus/getShipmentType

接口方法映射：getShipmentType

接口描述：获取配送类型列表

已知服务调用者：TMS

目前支持的协议：SOAP、HTTP

ShipmentType.class

##### 13.更新订单发票状态为已打印

url：oms-ws.chunbo.com/services/orderStatus/updateOrderInvoiceStatus

接口方法映射：updateOrderInvoiceStatus

接口描述：更新订单发票状态为已打印，并将电子发票发送邮件

已知服务调用者：客服补开发票->FMS发票系统->updateOrderInvoiceStatus更新为已打印

目前支持的协议：SOAP、HTTP

```
update oms_order_invoice
        set invoice_status=1,is_invoiced=1,invoice_type=3,invoice_title='个人',
        invoice_content='商品明细',
        ,invoice_tax_payer_code = '91110107MA01K5YN56'
         , invoice_email = 'yangliangyangshu@163.com'
        where order_id in ();
```

{"invoiceEmail":"","sendEmail":"1","orders":"171388072","taxCode":"91110107MA01K5YN56","invoiceTitle":"北京育稚堡托育有限公司","invoiceContent":"商品明细"}

##### 14.改派承运商接口

url：oms-ws.chunbo.com/services/orderStatus/updateDeliveryInfo

接口方法映射：updateDeliveryInfo

接口描述：订单改派承运商后，通知OMS更新承运商，三方订单如有需要通过MQ异步通知快递改派

已知服务调用者：WMS操作改派->TMS->updateDeliveryInfo

目前支持的协议：SOAP、HTTP

```
UPDATE oms_order_delivery_main
         SET delivery_id = 642,delivery_company = "中通快递", waybill_no = "73177150934996"
        WHERE order_id = #{orderId}
```

{"orderId":"171203044","deliveryId":"642","deliveryCompany":"中通快递","waybillNo":"73177150934996"}

##### 15.库房上传实际出库数量

url：oms-ws.chunbo.com/services/orderStatus/recordSkuDeliveryNum

接口方法映射：recordSkuDeliveryNum

接口描述：订单部分出库，上传商品明细的实际出库数量，订单在妥投时需要按实际出库数量推结算系统

​                  目前，RWMS部分出库会上传实际出库数量和WMS的部分出库只有零售店补货单(order_source in 			1010 || 10010)所创建的大仓销单才会走这个逻辑

已知服务调用者：WMS部分出库操作

目前支持的协议：SOAP、HTTP

```
insert into oms_order_detail_exp
```



## OMS-ORDER-FORWARD-FLOW



## OMS-ORDER-REVERSAL-WebService



## OMS-ORDER-REVERSAL-FLOW

