# 出库

### 接单

接收来订单系统OMS的订单数据

服务类：OrderSyncServiceImpl

方法：syncSalesOrder

涉及的表：order_header 订单表头

order_detail 订单明细

order_delivery 快递一些信息

order_profiles 订单纵表，记录订单额外的一些配置信息

order_split_queue 定时任务表-订单拆单使用

### 订单拆单

根据配送温区把一个订单拆成多个作业单

配送温区相对于快递来说的 tqa系统，

商品温区是对于商品来说，维度细一些

定时任务类：OrderSplitElasticJobServiceImpl

方法：processData

涉及的表： 

sales_order 作业单表 从order_header 拆出来 n:1

sales_detail 作业单明细表

order_alloc_inv_que 定时任务表，占用库存使用

### 订单占用库存

订单占用库存

定时任务类：OrderInvAllocateJobServiceImpl

涉及的表：

order_collect_task_queue 订单汇总表-临时表

prick_list_item 东西放在库房的哪个位置

wms_inv 库存表 sales_alloc_qty

on_hand_qty 在货位上一共有多少个

**如果发生缺货，不一定是真的缺货**

有可能是备货区有更老的批次，根据先进先出规则，不能占用新批次，导致缺货

 可以占备货区 查询控制

先进先出 占最老批次，最老批次排序放在第一位

残品占用 invType = 2 查询控制

后进先出 占最新批次，最新批次放在第一位

### 订单汇总

pick_list_header --拣选头 拣选id

拣选车-一次可以拣20个作业单

rf_task 生成一个拣选任务

pick_list_plan 拣选计划

### 拣货

手持拣货

rf_task

pick_list_progress

### 质检打包-最复杂

box_header 包裹头

box_detail 包裹明细

-- 两个 定时任务表

order_ship_queue

order_import_tms_queue 出库订单数据导入到tms

### 订单称重

order_hander_over_header

order_hander_over_detail

### 订单批次交接出库

order_hander_over_header

order_hander_over_detail

-- 两个 定时任务表

order_ship_queue 批次交接后会记录批次交接订单到这个表，进行订单库存出库

order_import_tms_queue 批次交接后会把订单记录到这个表，然后把数据导入到tms

# 调拨

## Tr调拨系统

### 下调拨申请单和调拨审核通过

类：TrOrderRequestAction

涉及的表：

tr_order_reques 调拨单申请表

tr_order_request_detail 调拨单申请表明细

tr_out_order 调出单主表

tr_out_detail 调出单明细

tr_out_issue_que 调出单下发队列表

### 调出单下发 job

类：TrOutOrderImportImpl

方法：importDataToWms

 

### 调入单生成接口

类：TransferInLoadServiceImpl

方法：addTransferInOrder

生成对应的调入信息，并记录 调出单对应的商品和批次信息，记录调出单的状态

涉及的表：

tr_in_order 调入单表头 tr_in_detail 调入单明细 tr_relations 调入单和调出单关联表

### 调拨入收货批次信息上传接口

类：TrInLotInvServiceImpl

方法：addTrInOrderDetail

涉及的表：

tr_in_lot_inv

## wms仓库系统

### 调出单下发库房-接口

类：TransferOutOrderSyncServiceImpl

方法：syncTransferOutOrder

涉及的表：

transfer_out_order 调出单表头

transfer_out_detail 调出单明细

tr_alloc_inv_que 调出单占用库存队列

 

### 库存占用-job

类：TrOutOrderInventoryOccupySimpleJob

```
TrOutOrderInventoryOccupyServiceImpl
```

方法：inventoryOccupy

涉及的表：

pick_list_item 拣选明细表

order_collect_task_queue 订单汇总表

### 调出单汇总

入口类：SalesOrderCollectAction

入口方法：orderCollect

类：TrOrderCollectServiceImpl

方法：billCollect

涉及的表：

pick_list_header 拣选表头

rf_tasks 拣选任务表

pick_list_plan 拣选计划表

pick_list_item 拣选明细表

### 调出单手持拣货

 

### 调出单质检

类：TransferOutQulityAction

涉及的表：

transfer_box_header 调出包裹表

transfer_box_detail 调出包裹明细

transfer_hand_over_header 调出批次交接表头

transfer_hand_over_detail 调出批次交接表明细

现在系统是默认给每个调出单生成调出批次交接信息，省去手持生成调出交接批次信息

### 调出单发出

类：TransferOutHandOverAction

方法：finishTransferHandOverHead

这里会对批次里的每个调出单调用调拨系统的接口，生成对应的调入单信息

 

涉及的表：

transfer_ship_que调出单库存流水处理表（ job） ransfer_upload_wms_que 调出批次上传目的仓队列（job）

### 调拨单出库流水job

类：TransferOutOrderShipJobServiceImpl

方法：execute

### 调出批次信息发送到目的仓job

类：TransferOutUploadWmsJobServiceImpl

方法：execute

调用wms 的调拨入接口，把调拨出批次交接信息传输到目的仓库

### 调出批次自动交接job

因为调出批次交接这个动作，库房有的时候会忘记，所以后台起一个job,做当天未交接批次 做交接

类：TransferOutBatchAutoHandOverSimbleJob

方法：execute

 

### 调拨入

### 调拨入数据导入-接口

类：TransferInOrderSyncServiceImpl

方法：TransferInOrder

涉及的表：

transfer_in_hand_over_header 调拨入批次交接表头

transfer_in_hand_over_detail 调拨入批次交接明细

transfer_in_order 调入单表头

transfer_in_detail 调入单明细

transfer_in_box_header 调入单包裹头

transfer_in_box_detail 调入单包裹明细

 

### 调入包裹状态确认

在手持上进行包裹状态确认

transfer_in_box_header 更新包裹上的box_status 0完好 1破损 2丢失

transfer_in_hand_over_detail 更新status 1已做包裹确认 2已做批次交接

### 调入批次交接

类：ReceiveHandOverAction

方法：boxBatchHandOver

更新transfer_in_hand_over_header 上statue 为1 标识已交接

更新transfer_in_hand_over_detail 上status 为2 标识已做批次交接

### 调入收货质检

类：TransferInQulityCheckAction

涉及的表：

transfer_recv_header 调入收货批次表头

transfer_recv_detail 调入收货批次表明细

### 调入单收货批次审核上架

类：QualityLotsManageAction

方法：auditWarehose

涉及的表：

wms_putaway_header 上架单表头

wms_putaway_detail 上架单明细 rf_tasks rf上架任务

 

### 调入单收货完成

类：TransferInManagerAction

方法：receivingOver

涉及的表：

transfer_in_up_inv

### 调拨入收货批次信息上传调拨系统 job

类：TrInUpInvJobServiceImpl

方法：execute