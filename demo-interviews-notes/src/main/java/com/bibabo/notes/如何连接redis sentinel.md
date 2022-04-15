

1.首先连接sentinel

redis-cli -h redis.uat.chunbo.com -p 26380

2.查询master 机器ip port

SENTINEL get-master-addr-by-name  mymaster

3.退出sentinel

4.redis-cli -h 10.254.128.133 -p 6380

5.选择库

SELECT 8



线上

redis-cli -h bredis.chunbo.com:26380 -p 26380  master :mymaster

10.254.64.112:6380   w

10.254.64.111:6380   r

线上的用跳板机连不了 

本地装redis 用户端直接连就可以



连接druid

ip + 端口 + druid/login.html

admin

123456

![1591603507391](C:\Users\fukuixiang\AppData\Roaming\Typora\typora-user-images\1591603507391.png)



修改线上数据

{"dbUrl":"jdbc:mysql://wmswdb.prod.chunbo.com:3309/","dbName":"wmscoredb","sql":"select count(1) from warehouse","passport":"DbToolsPara","passportToken":"111111","dbPassword":"c@VGUVcA","dbUserName":"wms"}

com/chunbo/wms/service/dubbo/dbtools/impl/DbToolsServiceImpl.java#executeSql





#### OMS线上redis

sentinel： bredis.prod.chunbo.com:26381

master 

10.254.64.112    6381   

db3







## 连接Zookeeper

