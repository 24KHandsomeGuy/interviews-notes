# 常见问题

## 线上问题sql

### 非现金

#### 正向

```sql
#余额
SELECT * from accountdb.acct_buyer_account where buyer_id = 5751511;
#礼品卡
SELECT * from accountdb.gift_card where active_buyer_id = 5639687 order by active_date desc;
SELECT * from accountdb.gift_card where card_code = '8510-4321-1265-9965';
##非现金扣减流水，查出trade_id
SELECT a.* FROM payinterdb.pay_no_cash_deduct_flow_sale a WHERE buyer_id = 5751511 order by creation_date desc;
SELECT a.* from  payinterdb.pay_no_cash_deduct_flow_sale a where order_id = 173617533;
###用户账户变更表 正-减 逆-加
SELECT a.* from accountdb.acct_change_log a where id > 20000000 and trade_id in ('1300000003202303261174960931');
####实际应收表（推财务用的）
SELECT * from paycoredb.pay_actual_receive_sale where id > 35000000 and trade_id in ('1300000003202303261174960931');
#####销售订单支付结果同步处理事件表
SELECT * from payeventdb.pay_receive_sync_handle where id > 35000000 and source_id in (35964207);
```

#### 逆向

```sql
#订单退款流水表，根据订单号查询退款流水refund_id
SELECT * from payinterdb.pay_refund_flow_sale where order_id = 173786068;
#订单退款流水明细表，按money_type划分，1为现金，其余为非现金（余额、劵、礼品卡...），找到明细的refund_id
SELECT * from payinterdb.pay_refund_flow_item_sale where parent_refund_id in ('1300000001202304032176143021');
##非现金退款流水
SELECT * from payinterdb.pay_no_cash_refund_flow_sale where refund_id in ('1300000001202304032176143023');
###非现金增加后，写入实退，推送财务
SELECT * from paycoredb.pay_actual_refund_sale where refund_id in ('1300000001202304032176143023');
###非现金增加后，写入用户账户变更表，根据非现金退款流水中的org_trade_id查询（正向的trade_id）
###此时会看见一正一逆两条日志
SELECT a.* from accountdb.acct_change_log a where id > 20000000 and trade_id in ('1300000003202304031176142741');
```

### 现金

#### 正向

```sql
#用户选择支付渠道，支付渠道表
SELECT * from payconfigdb.pay_channel_config where channel_status=2 AND display_plat in (4) and channel_status = 2 order by display_seq;
#支付渠道配置表，可以查看到具体支付渠道的请求网关地址gateway_url
#和如果需要回调我们支付结果所配置的notify_url
SELECT * from payconfigdb.pay_channel_gateway_config where channel_id in (6,9,11) order by creation_date desc;
##选择支付方式后会调用trade.pay.simple.m接口，生成记录
##支付渠道流水表
SELECT a.creation_date,a.* from payinterdb.pay_channel_flow_sale a where buyer_id = 1382437 order by creation_date desc
SELECT * from payinterdb.pay_channel_flow_sale where trade_id in ('1300000003202304031176138979');
##支付交易流水表
##根据order_id查出trade_id
SELECT * from payinterdb.pay_trade_flow_item_sale where order_id = 173808455;
SELECT * from payinterdb.pay_trade_flow_sale where trade_id in ('1300000003202304031176138979');
##支付交易流水明细表，订单维度
SELECT * from payinterdb.pay_trade_flow_item_sale where parent_trade_id in ('1300000003202304031176138979');
##支付操作日志表
SELECT * from paylogdb.pay_operate_log where id > 465954008 and source_id = '1300000003202304031176138979';
###支付成功后，创建支付结果通知流水。回改pay_trade_flow_sale、pay_trade_flow_item_sale、###pay_channel_flow_sale三张表状态为1
SELECT * from payinterdb.pay_channel_notify_flow_sale where id > 15000000 and trade_id in ('1300000003202304031176138979');
###支付成功后，销售订单支付结果通知OMS
SELECT * from payeventdb.pay_trade_notify_sale_handle where id > 15000000 and source_id in ('1300000003202304031176138979');
```

##### 现金正向最常遇到的问题

用户反馈，订单已经付款成功了，却自动取消了?

订单支付超时取消的逻辑,是在订单系统的.如果支付系统同步支付结果不及时,也会导致支付超时取消

* 情况1:推模式, PayCenter未接收到三方支付平台的支付结果通知, 这是他们的问题(几乎不会发生, 银行以及支付宝,微信系统的可用性一定是很高的, 应该不会出问题)

* 情况2:推模式, PayCenter接收到三方支付平台的支付结果通知, 需要调用ClearingGateway访问外网, 可能是某个网段被覆盖了, 访问不了外网, 此时联系运维同事排查

* 情况3:拉模式, pay-single-order-query-job抓取三方支付平台的支付结果通知, 需要调用ClearingGateway访问外网, 可能是某个网段被覆盖了, 访问不了外网, 此时联系运维同事排查

* 情况4:pay_trade_notify_sale_handle表,同步支付结果给OMS, 有可能这个服务Job挂掉了(目前单点, **后续要扩到多点保证高可用**),到指定机器检查重启下10.254.65.141目录/data/tomcat_traderesultnotify   

  ```bash
  ps -ef | grep java | grep traderesultnotify
  ```

  如果没启动需要立即启动

  ```bash
  export JAVA_HOME=/usr/java/jdk1.7.0_80 && /data/tomcat_traderesultnotify/bin/startup.sh
  ```

* 情况5:用户在第三方支付平台收银台停留时间过长, 导致支付成功, 春播订单系统已经取消

  **在支付申请的时候把我们禁止提交支付的时间戳带给第三方支付平台**, 一般支付平台都会带有这个字段

#### 逆向

```sql
#订单退款流水表，根据订单号查询退款流水refund_id
SELECT * from payinterdb.pay_refund_flow_sale where order_id = 173786068;
#订单退款流水明细表，按money_type划分，1为现金，其余为非现金（余额、劵、礼品卡...），找到明细的#refund_id
SELECT * from payinterdb.pay_refund_flow_item_sale where parent_refund_id in ('1300000001202304032176143021');
##现金退款流水表
SELECT * from payinterdb.pay_cash_refund_flow_sale where refund_id in ('1300000001202304032176143029');
##如果需要财务审核financial_cash_fefund_flow_sale支付系统同步财务
##financial_cash_refund_sync_handle财务系统回传审核状态到支付系统
##回改pay_cash_refund_flow_sale.refund_status状态，如果不需要审核为6或审核通过为2后改为6
###销售订单现金自动退款检查事件表
SELECT * from payeventdb.pay_cash_auto_refund_check_handle where source_id in (719135);
####销售订单现金自动退款流水表，与payinterdb.pay_cash_refund_flow_sale.org_pay_no相关联
SELECT * from payinterdb.pay_cash_auto_refund_flow_sale where org_pay_no in ('6176142749');
####销售订单现金自动退款流水表，与payinterdb.pay_cash_refund_flow_sale.refund_batch_id相关联。调####用订单所属的支付渠道申请退款
SELECT * FROM payeventdb.pay_cash_auto_refund_apply_handle where source_id in ('202304031130000326176142749');
#####申请成功后，需要查询退款的结果
SELECT * from payeventdb.pay_cash_auto_refund_query_handle where id > 600000 and source_id in ('202304031130000326176142749');
######查询出退款结果后，插入退款结果处理表。退款结果为成功将######pay_cash_refund_flow_sale.refund_status=3，失败修改为4，实退修改为5
SELECT * from payeventdb.pay_cash_auto_refund_deal_handle where source_id in ('202304031130000326176142749');
#######退款成功
#######通知oms退款成功
SELECT * from payeventdb.pay_refund_result_check_handle where source_id in ('1300000001202304032176143029');
#######实退
SELECT * from paycoredb.pay_actual_refund_sale where refund_id in ('1300000001202304032176143029');
#######实退同步财务
SELECT * from payeventdb.pay_actual_refund_sync_handle where source_id in (4935077);
########退款状态同步财务
SELECT * from payeventdb.pay_cash_auto_refund_status_sync_handle where source_id in ('719135');
#########退款流程日志表
SELECT * from paylogdb.pay_cash_auto_refund_flow_log where refund_batch_id in ('202304031130000326176142749');
```

**现金退款围绕pay_cash_refund_flow_sale表refund_status字段状态驱动，如果出现现金退款失败问题，可根据状态排查具体哪个节点出现问题。**

- 0：未推送财务
- 1：已推送财务
- 2：财务审核可以退款
- 6：自助退款申请中
- 3：退款成功，未生成实退
- 4：退款失败
- 5：退款成功，生成实退

##### 支付通知配置表

现金支付成功、退款结果回调通知OMS正逆向

```sql
SELECT * FROM payconfigdb.pay_notify_config
```

## jekins上没有找到 Tradegateway 环境

很多都没配置jenkins，直接手动扔包

## pay-no-cash-deduct-job工程 uat、prod和本地master代码不一致

直接手动改线上机器

## PAY组jenkins的配置中心机器ip是多少

10.254.8.208

## 用户在三方平台支付后

- 三方支付平台回调我们提供的url通知支付结果
- 我们主动定时抓取pay-single-order-query-job工程

## 春播卡扣除

场景：春播卡金额退回后，顾客又反悔了，例如：

```
账号：13695674701，ID：4687813，卡号：9077590248644314，之前因为疫情原因给客户退款，现在又收到了，麻烦从春播卡中扣除238元
```

扣除前需要进行校验。通过卡号或订单号查询。一般客服发的有卡号或订单号，或者两者都有；有时候给的订单号是子订单号。

- 扣除验证：

通过卡号查询：

```mysql
-- 1、根据卡号查询订单，可能有多个订单。使用
select * from payinterdb.pay_no_cash_deduct_flow_sale where card_code = '1085-4201-7468-2114' order by creation_date desc;

-- 2、根据order_id查询相应的退款流水
select * from payinterdb.pay_refund_flow_sale where order_id = '171572130';

-- 3、查询相应的非现金退款流水明细
select * from payinterdb.pay_refund_flow_item_sale where parent_refund_id = '1300000001202203142124502703' and money_type = 3 and refund_status = 2;

-- 4、根据上一步查到的refund_id查询相应的非现金退款流水，检查card_code、total_amount是否与客服相符
select * from payinterdb.pay_no_cash_refund_flow_sale where refund_id = '1300000001202203142124502709' and money_type = 3 and refund_status = 1;

-- 5、用第1步查到的trade_id查询accountdb.acct_change_log扣减记录
select * from accountdb.acct_change_log where trade_id = '1300000003202203141124432469' order by creation_date desc;

-- 6、查看卡余额是否够扣除
select card_code, active_buyer_id, remain_value from accountdb.gift_card where card_code = '1085-4201-7468-2114'
```

- 扣除sql示例：

```mysql
UPDATE accountdb.gift_card SET remain_value = remain_value - 65.90 WHERE card_code = '7951-2518-9389-2062';
INSERT INTO `accountdb`.`acct_change_log` (`acct_id`, `buyer_id`, `change_type`, `money_type`, `card_code`, `change_amount`, `from_amount`, `to_amount`, `trade_id`, `change_desc`, `change_reason`, `extend_param`, `creation_date`, `changed_by`, `changed_date`) VALUES ('1000686235', 686235, 2, 3, '7951-2518-9389-2062', 65.9, NULL, NULL, '171577322', '销售订单春播卡扣减', 1, NULL, NOW(), 'songbingbing', NOW());
```

## 支付平台券问题

### 券正向

顾客使用三方支付平台支付时的用券信息写入以下数据库表：

```
微信APP支付、微信小程序支付：channel_notify_discount_wxcoupon
广州银联网络：channel_notify_discount_normal
工商银行H5支付：channel_notify_discount_icbc
支付宝小程序支付：channel_notify_discount_alipay
```

> 一张券对应一条记录，sum(amount)就是订单用券总金额

### 券逆向

退款时，顾客银行卡中的钱和券一般会原路退回、按比例分摊。

但是券退回时，微信不给顾客提醒，导致顾客以为只退了一部分，从而引起客诉。

三方支付平台券退回信息未写入数据库。

正向如果用了券，逆向一般会按比例退。看现金退款流水退款金额（是总金额，包括券的）、看正向是否用了券，然后计算比例。

也可以通过查日志或让财务帮忙查，看是否退了券：

1. 方式一：查日志：用pay_no查ClearingGateway工程的access日志，看coupon_refund_fee标签，单位为【分】

2. 方式二：提供pay_no让财务（董敬丹）用微信商户后台帮忙查

## 现金退款失败问题

协助财务（董敬丹）处理现金退款失败问题。财务会给一个pay_no，让帮忙查下退款失败原因，退款失败原因写入了paylogdb.pay_cash_auto_refund_flow_log表

- 先用pay_no查pay_cash_auto_refund_flow_sale拿到refund_batch_id（可能有条记录），再用查到refund_batch_id查paylogdb.pay_cash_auto_refund_flow_log，看error_msg

大部分是招行一网通的退款失败，基本都是招行系统的问题。

典型退款失败原因及解决：

- 微信渠道：退款申请失败#频率限制，1个月之前的订单申请退款请降低频率再重试。
  - 解决：微信的问题，让财务重新发送银行即可
- 招行一网通：Can't do refund for this order: DL4007.直连退款失败.WWT0502 - 无此定单 [DJ113939]
  - 招行系统的问题，支付这边退款检查很严格，不会存在没正向订单而发起退款的问题。
  - 先让财务用商户后台查下招行的账单确认是否退了，如果没有让财务重新发送银行看是否能退，如果还是无法退款，那就选择其他退款方式。
- 招行一网通：Can't do refund for this order: DL4007.直连退款失败.PTNM1GF ― 退款额度不足 [DJ113939]
  - 用pay_no查pay_cash_auto_refund_flow_sale，看之前是否已发起过退款，是否是系统问题导致的重复退款。
  - 如果都不是，那就是招行的问题，先让财务重新发送银行，如果还是不行，选择其他方式退款。
- 招行一网通：Can't do refund for this order: DL4010.退款状态未知.WWT0599 -  退款状态未知 [DJ113939]
  - 有可能是已经退了，先让财务用商户后台查下招行的账单

