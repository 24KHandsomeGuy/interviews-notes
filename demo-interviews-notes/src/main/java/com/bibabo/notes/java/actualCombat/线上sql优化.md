

#### 2020.07.17  15

(1) 结算单号计算时，通过当前订单的父单号去查询除此单以外的其他单，因为order_header表的parent_order_id没有索引导致全表扫描，执行过慢

又因为以parent_order_id作为查询条件的sql很少，所以不为此字段建立索引

in_wms_date有索引，但是并没有执行计划并有没用到这个索引，故用FORCE INDEX(order_headerI7)强制执行该索引

order_extend_info这张表有很多无用的记录，此表主要用于，存储悦团订单的信息和结算单号相关的信息，但是如果即没有悦团单号，又不存在结算单号，此表不需要产生记录

查询的时候，最好只查需要用到的字段，像这种情况，该表只需要查5个字段，但是却查询o.* 40多个字段，效率明显下降

```sql
##第一次优化order_headerI1,order_headerI7，索引不确定
EXPLAIN SELECT o.*,e.id AS e_id,e.order_id AS e_order_id,e.ware_id AS e_ware_id,
    e.create_date AS e_create_date,e.promise_date AS e_promise_date,e.settlement_number AS e_settlement_number
    FROM order_header o  
INNER JOIN order_extend_info e ON o.order_id = e.order_id 
    WHERE o.parent_order_id = '166072699'
    AND o.from_loc_id = '1'
  AND o.order_id != '166080762'
    and o.in_wms_date > '2020-07-10 00:00:00';
##优化后#####
EXPLAIN SELECT o.order_id,o.parent_order_id,o.ship_to_province,o.ship_to_city,o.ship_to_district,o.ship_to_addr,o.in_wms_date,e.id AS e_id,e.order_id AS e_order_id,e.ware_id AS e_ware_id,
    e.create_date AS e_create_date,e.promise_date AS e_promise_date,e.settlement_number AS e_settlement_number
    FROM order_header o  FORCE INDEX(order_headerI7)
left outerJOIN order_extend_info e ON o.order_id = e.order_id 
    WHERE o.parent_order_id = '166072699'
    AND o.from_loc_id = '1'
  AND o.order_id != '166080762'
    and o.in_wms_date > '2020-07-05 00:00:00';
##慢
SELECT o.*,e.id AS e_id,e.order_id AS e_order_id,e.ware_id AS e_ware_id,
    e.create_date AS e_create_date,e.promise_date AS e_promise_date,e.settlement_number AS e_settlement_number
    FROM order_header o
INNER JOIN order_extend_info e ON o.order_id = e.order_id 
    WHERE o.parent_order_id = '166072699'
    AND o.from_loc_id = '1'
  AND o.order_id != '166080762';
##查询除此单以外的父订单下还有其他单的sql
SELECT * from order_header o where o.order_id <> o.parent_order_id 
and (SELECT count(1) from order_header a where a.parent_order_id = o.parent_order_id) > 1
order by o.in_wms_date desc limit 1
```

#### 2020.07.17  17

上面那种方式最终还是没有采用，因为拿in_wms_date做查询条件过滤的话，业务上会有逻辑漏洞，还是采用了在parent_order_id上建索引

```
EXPLAIN SELECT o.order_id,o.parent_order_id,o.ship_to_province,o.ship_to_city,o.ship_to_district,o.ship_to_addr,o.in_wms_date,
    e.id AS e_id,e.order_id AS e_order_id,e.ware_id AS e_ware_id,
    e.create_date AS e_create_date,e.promise_date AS e_promise_date,e.settlement_number AS e_settlement_number
    FROM order_header o
    INNER JOIN order_extend_info e ON e.order_id = o.order_id
    WHERE o.parent_order_id = 166090732
    AND o.from_loc_id = 1
    AND o.order_id != 166090732

```









### 极速达订单发放超时补偿劵

旧逻辑

```sql
##极速达订单超时补偿劵发放 旧的逻辑
SELECT a.book_date,a.shipment_end_time,b.finish_date,a.order_id AS orderId, a.cust_id AS custId,a.cust_name AS custName,a.cust_mobile AS custMobile,a.ware_id AS wareId
        FROM oms_db.oms_order_main a
        INNER JOIN oms_db.oms_order_status b ON a.order_id  = b.order_id
        WHERE
        a.payment_date > DATE_SUB(NOW(),INTERVAL 2 DAY)
        AND a.book_Date = CURRENT_DATE
        AND a.shipment_end_time < NOW()
        AND (b.finish_date > a.shipment_end_time OR b.finish_date = '1970-01-01 08:00:01')
        AND a.shipment_type = 5
```

新逻辑

```sql
##极速达订单超时补偿劵发放
SELECT a.*
FROM oms_db.oms_order_main a
WHERE
a.payment_date > DATE_SUB(NOW(),INTERVAL 2 DAY)
AND a.book_Date = CURRENT_DATE
AND a.shipment_end_time < NOW()
AND a.shipment_type = 5
#把没超时的过滤掉 超时的：1.operate无status = 4007记录 2.有status = 4007但超时了
AND NOT EXISTS (SELECT 1 FROM oms_db.oms_order_operate b WHERE a.order_id = b.order_id AND STATUS = 4007 AND b.op_date < a.shipment_end_time)
#拉回中、已完成拉回的、取消的 过滤掉
AND order_type NOT IN (40,41,100)
#当前的order_id不能是别的订单的direct_parent_id
AND 1 >= (SELECT COUNT(1) FROM oms_db.oms_order_main c WHERE a.order_id = c.direct_parent_id)
```



#### 2022.01.20

销售人员查询自己的销售计划时会出现查询过慢的情况

首先oms_sale_plan表是没有创建人字段的，需要关联oms_sale_plan_operation表（操作流水日志表），oms_sale_plan全表扫，并且exist相关子查询oms_sale_plan_operation

oms_sale_plan新增create_name字段逻辑等同于ospo.operation_code = '1001' and ospo.operator = 'machuang'。并且为该字段建立索引。**后续数据量积攒够多的时候可以使用该字段。**

统计销售人员销售计划总数，慢sql如下  20.561s

```sql
select count(DISTINCT a.plan_order_id) 
from omsex1.oms_sale_plan a 
LEFT JOIN omsex1.oms_customer c on a.customer_id = c.id 
where 1=1 and  a.status = 5 and (a.sale_user_id = 97 or exists( select 1 from omsex1.oms_sale_plan_operation as ospo where a.plan_order_id = ospo.plan_order_id and ospo.operation_code = '1001' and ospo.operator = 'machuang' ) )
```

执行计划，显示相关子查询

![1643341944342](E:\ChunBo相关\笔记\1643341944342.png)

优化后 1.073s

```sql
SELECT COUNT(DISTINCT c.plan_order_id) from 
(
	select a.plan_order_id
	from omsex1.oms_sale_plan a 
	LEFT JOIN omsex1.oms_customer c on a.customer_id = c.id 
	where 1=1 and a.status = 5 and a.sale_user_id = 97
	UNION all
	SELECT plan_order_id from omsex1.oms_sale_plan_operation ospo where plan_order_id in (select a.plan_order_id
	from omsex1.oms_sale_plan a 
	LEFT JOIN omsex1.oms_customer c on a.customer_id = c.id 
	where 1=1 and a.status = 5
	) and ospo.operation_code = '1001' and ospo.operator = 'machuang'
) c

```

执行计划 包含覆盖索引

![1643342267590](E:\ChunBo相关\笔记\1643342267590.png)



#### 2022.01.21

接上。limit优化

oms_sale_plan新增的create_name字段存在索引

销售计划表那么我想查create_name为'machuang' 的第100w开始的后20行数据

```sql
select * 
from omsex1.oms_sale_plan a 
LEFT JOIN omsex1.oms_customer c on a.customer_id = c.id 
where 1=1 and a.status = 5 and a.create_name = 'machuang'
limit 1300000,20
```

优化，现在临时表使用覆盖索引查询出plan_order_id，在使用plan_order_id做主键查询

```
select * 
from omsex1.oms_sale_plan a 
LEFT JOIN omsex1.oms_customer c on a.customer_id = c.id 
inner join (SELECT plan_order_id from omsex1.oms_sale_plan where  create_name = 'machuang' limit 1300000,20) d on a.plan_order_id = d.plan_order_id
where 1=1 and a.status = 5 
```

