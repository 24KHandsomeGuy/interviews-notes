CentOS7+

# 虚拟机或云服务器ECS（Elastic Compute Service）弹性计算服务IaaS（Infrastructure as a Service）

安装zip unzip

```bash
yum install zip
yum install unzip
```

安装rz(读) sz(写)

```bash
yun install lrzsz
```

查看tcp端口

```bash
netstat -ntlp
```

安装wget
```bash
yum -y install wget
```
wget https 地址后需要跟--no-check-certificate

#CentOS异常情况总结
###1.阿里云镜像yun失效
"Could not resolve host: mirrors.cloud.aliyuncs.com; Unknown error"
已经安装了wget 但还是报错，一般是原来的wget初始化有文件损坏造成的。
yum remove wget卸载掉重新安装

# 安装mysql

密码123456

登录mysql   ./mysql -u root -p   *#bin目录下*

启动mysql   service mysql start

# 安装OpenJDK

yum查找jdk

```bash
yum search java|grep jdk
```

### 安装jdk运行环境

```bash
yum install java-1.8.0-openjdk
```

查找安装路径

```bash
which java
ls -lrt /usr/bin/java
```

查看java版本

```bash
java -version
```

查看java是否可用

```
javac
-bash: javac: command not found
```

错误原因：默认安装完只有运行环境，java安装目录下只有jre文件夹

### 安装开发环境

```bash
yum install java-1.8.0-openjdk-devel.x86_64
```

安装后

```bash
ls -lrt /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.322.b06-1.el7_9.x86_64/
```

再次输入javac说明安装成功

```bash
javac
```

### 设置环境变量

vim /etc/profile

```properties
###set java environment
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.322.b06-1.el7_9.x86_64
JRE_HOME=$JAVA_HOME/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH
```

```bash
source /etc/profile
echo $JAVA_HOME
```



# 安装maven

### 到maven官网下载页面

<https://maven.apache.org/download.cgi>

复制下载链接linux下载

https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz

注意要换成http

```bash
wget http://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
```

### 解压缩

```bash
tar -zxvf apache-maven-3.8.5-bin.tar.gz
```

### 配置环境变量

```bash
vim /etc/profile
```

```properties
###set maven environment
export MAVEN_HOME=/data/apache-maven-3.8.5
export PATH=$MAVEN_HOME/bin:$PATH 
```

刷新环境变量

```bash
source /etc/profile
```

### 检查版本

```bash
mvn -v
```



# 安装Rocket

java相关的软件都可以到官网上有详细指导安装，这里我们说下可能出现的问题

### 启动nameserver

```bash
nohup sh bin/mqnamesrv &
tail -f ~/logs/rocketmqlogs/namesrv.log
```

### 启动broker

```bash
nohup sh bin/mqbroker -n localhost:9876 &
tail -f ~/logs/rocketmqlogs/broker.log 
```

### 内存不足导致无法启动

shell脚本mqnamesrv中无jvm内存配置，但发现最后一行

```shell
sh ${ROCKETMQ_HOME}/bin/runserver.sh org.apache.rocketmq.namesrv.NamesrvStartup $@
```

最终会运行runserver.sh。修改jvm配置

```shell
JAVA_OPT="${JAVA_OPT} -server -Xms128m -Xmx128m -Xmn64m -XX:MetaspaceSize=8m -XX:MaxMetaspaceSize=16m"
```

broker也同样

```
sh ${ROCKETMQ_HOME}/bin/runbroker.sh org.apache.rocketmq.broker.BrokerStartup $@
```

最终会运行runserver.sh。修改jvm配置

```shell
JAVA_OPT="${JAVA_OPT} -server -Xms128m -Xmx128m -Xmn64m"
```

tools.sh也修改下

### 阿里云ECS服务器，nameserver返回的broker地址为私网地址无法供外部访问

```bash
vim broker.conf
```

```properties
namesrvAddr=172.17.24.252:9876 // 私网ip
brokerIP1=39.107.156.177 // broker外网ip
```

启动broker指定配置文件

```bash
nohup sh mqbroker -n localhost:9876  autoCreateTopicEnable=true -c ../conf/broker.conf &
```

### 安装可视化控制台

github搜rocketmq-externals项目

https://github.com/apache/rocketmq-dashboard

#### 下载master代码

```bash
https://github.com/apache/rocketmq-dashboard/archive/refs/heads/master.zip
```

#### 更改镜像

```xml
<mirrors>
    <mirror>
          <id>alimaven</id>
          <name>aliyun maven</name>
          <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
          <mirrorOf>central</mirrorOf>        
    </mirror>
</mirrors>
```

#### 启动控制台

```bash
mvn spring-boot:run
```

或者

```bash
mvn clean package -Dmaven.test.skip=true
nohup java -jar -Xms128m -Xmx128m  target/rocketmq-dashboard-1.0.1-SNAPSHOT.jar &
```

[http://39.107.156.177:8090](http://39.107.156.177:8090/)

# 安装redis

## 安装包方式

### gcc

由于 redis 是用 C 语言开发，安装之前必先确认是否安装 gcc 环境（gcc -v），如果没有安装，执行以下命令进行安装

```bash
yum install -y gcc
```

### 到官网复制安装包下载链接

```bash
wget https://download.redis.io/releases/redis-5.0.14.tar.gz
```

解压缩

```bash
tar -zxvf redis-5.0.14.tar.gz
```

### cd切换到redis解压目录下，执行编译

```bash
make
```

redis6.x会报错，找不到包，需要将gcc升级为5.3以上

```bash
gcc -v
4.8.5-44
```

此处我把redis降为5.x

### 安装并指定安装目录

```bash
make install PREFIX=/usr/local/redis
```

### 启动

前台启动

```bash
cd /usr/local/redis/bin/
./redis-server
```

守护进程后台启动

```
cp /usr/local/redis/redis.conf /usr/local/redis/bin/
```

修改 redis.conf 文件，把 daemonize no 改为 daemonize yes

修改comment掉 bind 127.0.0.1，否则除本机无法通信

### 启用aof事务写入

设置aof持久化：appendonly修改为yes

### 启动密码

设置连接密码：去掉*#requirepass 后面的字符串则为密码*

redis-cli登录

```redis
auth 123456
```

### 通过Sentinel 找到master地址
```redis
redis-cli -h  redis.uat.chunbo.com -p  26381
SENTINEL get-master-addr-by-name
```




# SpringBoot使用脚本启动、关闭

## linux上创建脚本：touch start.sh、touch stop.sh

chmod 777 整个项目文件夹

#### 1.编写启动脚本vim start.sh

可以本地编写好复制，参考nacos的启动脚本

```shell

r_exit ()
{
    echo "ERROR: $1 !!"
    exit 1
}

[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=$HOME/jdk/java
[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/usr/java
[ ! -e "$JAVA_HOME/bin/java" ] && error_exit "Please set the JAVA_HOME variable in your environment, We need java(x64)!"

export JAVA_HOME
export JAVA="$JAVA_HOME/bin/java"

JAVA_OPT="${JAVA_OPT} -server -Xms128m -Xmx128m -Xmn43M -Xss512k -XX:PermSize64m -XX:MaxPermSize64m"
JAVA_OPT="${JAVA_OPT} -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -XX:CMSInitiatingOccupancyFraction=70 -XX:+CMSParallelRemarkEnabled -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+CMSClassUnloadingEnabled -XX:SurvivorRatio=8  -XX:-UseParNewGC"
JAVA_OPT="${JAVA_OPT} -XX:+PrintGCDateStamps -XX:+PrintGCDetails -Xloggc:/data/bibabo-sms/gclogs/bibabo-sms-gc.log"
JAVA_OPT="${JAVA_OPT} -XX:-HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/data/bibabo-sms/javadump/bibabo-sms-jvmdump.hprof"

nohup $JAVA -jar /data/bibabo-sms/bibabo-sms-0.0.1-SNAPSHOT.jar ${JAVA_OPT} &
tail -f nohup.out
```

启动

```bash
sh start.sh
```

startup.log查看是否启动成功

#### 2.编写关闭脚本vim stop.sh

```shell
#过滤掉grep进程，找到第二个，也就是pid
PID=$(ps -ef | grep bibabo-sms | grep -v grep | awk '{ print $2 }')
if [ -z "$PID" ]
then
    echo Application is already stopped
else
    echo kill $PID
    kill $PID
    echo stop $PID successfully
fi
```

关闭

```bash
sh stop.sh
```

# Sentinel控制台

### github上有控制台安装教程

[https://github.com/alibaba/Sentinel/wiki/%E6%8E%A7%E5%88%B6%E5%8F%B0](https://github.com/alibaba/Sentinel/wiki/控制台)

### 下载jar

```bash
wget https://github.com/alibaba/Sentinel/releases/download/1.8.4/sentinel-dashboard-1.8.4.jar
```

sentinel控制台直接通过jar包启动，每次都需要配置端口和jvm参数，打成shell脚本启动

```bash
touch start.sh
```

```shell
r_exit ()
{
    echo "ERROR: $1 !!"
    exit 1
}

[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=$HOME/jdk/java
[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/usr/java
[ ! -e "$JAVA_HOME/bin/java" ] && error_exit "Please set the JAVA_HOME variable in your environment, We need java(x64)!"

export JAVA_HOME
export JAVA="$JAVA_HOME/bin/java"

JAVA_SERVER_OPT="${JAVA_SERVER_OPT} -Dserver.port=9090 -Dcsp.sentinel.dashboard.server=localhost:9090 -Dproject.name=sentinel-dashboard"
JAVA_OPT="${JAVA_OPT} -server -Xms128m -Xmx128m -Xmn43M -Xss512k -XX:PermSize64m -XX:MaxPermSize64m"
JAVA_OPT="${JAVA_OPT} -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -XX:CMSInitiatingOccupancyFraction=70 -XX:+CMSParallelRemarkEnabled -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+CMSClassUnloadingEnabled -XX:SurvivorRatio=8  -XX:-UseParNewGC"
JAVA_OPT="${JAVA_OPT} -XX:+PrintGCDateStamps -XX:+PrintGCDetails -Xloggc:/data/sentinel-dashboard-1.8.4/gclogs/sentinel-dashboard-gc.log"
JAVA_OPT="${JAVA_OPT} -XX:-HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/data/sentinel-dashboard-1.8.4/javadump/sentinel-dashboard-1.8.4-jvmdump.hprof"

nohup $JAVA $JAVA_SERVER_OPT -jar /data/sentinel-dashboard-1.8.4/sentinel-dashboard-1.8.4.jar ${JAVA_OPT} &
tail -f nohup.out
```

```bash
touch shutdown.sh
```

```shell
#过滤掉grep进程，找到第二个，也就是pid
PID=$(ps -ef | grep sentinel | grep -v grep | awk '{ print $2 }')
if [ -z "$PID" ]
then
    echo Application is already stopped
else
    echo kill $PID
    kill $PID
    echo stop $PID successfully
fi
```

端口9090 sentinel sentinel



# Nacos

sh startup.sh -m standalone


# Seata

### 下载Seata-Server

```bash
wget https://github.com/seata/seata/releases/download/v1.3.0/seata-server-1.3.0.tar.gz --no-check-certificate
```

### 调整shell脚本的JVM启动参数

找到bin目录下的seata-server.sh，修改JVM启动参数，调小内存分配

```shell
$JAVA_OPTS -server -Xmx256m -Xms256m -Xmn128m -Xss512k -XX:SurvivorRatio=10 -XX:MetaspaceSize=32m -XX:MaxMetaspaceSize=64m -XX:MaxDirectMemorySize=64m
```

### Server配置

#### 初始化Seata所需表

https://github.com/seata/seata/blob/develop/script/server/db/mysql.sql

#### 修改server端的配置文件

通过registry.conf寻找配置中心、注册中心

默认使用本地磁盘file.conf

更改配置中心、注册中心为nacos

```conf
registry {
  type = "nacos"
  nacos {
    application = "seata-server"
    serverAddr = "127.0.0.1:8848"
    group = "BIBABO_SEATA_GROUP"
    namespace = ""
    cluster = "default"
    username = "nacos"
    password = "nacos"
  }
}

config {
  type = "nacos"
  nacos {
    serverAddr = "127.0.0.1:8848"
    namespace = ""
    group = "BIBABO_SEATA_GROUP"
    username = "nacos"
    password = "nacos"
  }
}
```

#### 把Seata客户端服务端所需配置通过脚本注册到nacos上

在server的服务器seata目录下操作

https://github.com/seata/seata/blob/develop/script/config-center/config.txt

https://github.com/seata/seata/blob/develop/script/config-center/nacos/nacos-config.sh

将config.txt放到seata目录下，将nacos-config.sh放到seata/bin目录下

执行注册配置脚本

```shell
sh nacos-config.sh -h 127.0.0.1 -p 8848 -g BIBABO_SEATA_GROUP -u nacos -w nacos
```

#### 修改服务端所需配置

##### 把server端所需存储放到mysql上

建库bibabo_seata

建表https://github.com/seata/seata/blob/develop/script/server/db/mysql.sql

##### 到nacos修改store相关配置

修改store.mode=db;

修改store.db.url、username、password...

#### 启动Seata-Server

```bash
nohup ./seata-server.sh > seata.log 2>&1 &
```

默认端口8091



### Client配置

AT模式下所需的undo_log表

https://github.com/seata/seata/blob/develop/script/client/at/db/mysql.sql

下为使用注册中心查找seata-server地址，不需要配置service.bibabo.grouplist
```yaml
###seata
seata:
  registry:
    type: nacos
    nacos:
      cluster: default
      server-addr: 114.116.44.130:8848
      group: BIBABO_SEATA_GROUP
      username: nacos
      password: nacos
      application: seata-server
```

# Canal

### MySQL配置

#### 开启binlog

进入mysql查看是否启动binlog

```sql
SHOW VARIABLES LIKE '%log_bin%';
```

| Variable_name | Value |
| :------------ | ----- |
| log_bin       | OFF   |

OFF说明目前是关闭状态的，需要修改mysql配置文件启动log_bin

linux在/etc/my.cnf

```cnf
[mysqld]
log-bin=mysql-bin # 开启 binlog
binlog-format=ROW # 选择 ROW 模式
server_id=1 # 配置 MySQL replaction 需要定义，不要和 canal 的 slaveId 重复
```

重启mysql service mysql restart

#### 创建canal账号

登录mysql   ./mysql -u root -p   *#bin目录下*

授权 canal 链接 MySQL 账号具有作为 MySQL slave 的权限, 如果已有账户可直接 grant

```sql
CREATE USER canal IDENTIFIED BY 'canal';  
GRANT SELECT, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'canal'@'%';
-- GRANT ALL PRIVILEGES ON *.* TO 'canal'@'%' ;
FLUSH PRIVILEGES;
```

### 安装canal

- 下载 canal, 访问 [release 页面](https://github.com/alibaba/canal/releases) , 选择需要的包下载, 如以 1.1.4 版本为例

  ```bash
  wget https://github.com/alibaba/canal/releases/download/canal-1.1.4/canal.deployer-1.1.4.tar.gz
  ```

- 解压缩

  ```
  mkdir /data/canal-1.1.4
  tar -zxvf canal.deployer-1.1.4.tar.gz  -C /data/canal-1.1.4
  ```

  - 解压完成后，进入 /data/canal 目录，可以看到如下结构

    ```
    drwxr-xr-x 2 jianghang jianghang  136 2013-02-05 21:51 bin
    drwxr-xr-x 4 jianghang jianghang  160 2013-02-05 21:51 conf
    drwxr-xr-x 2 jianghang jianghang 1.3K 2013-02-05 21:51 lib
    drwxr-xr-x 2 jianghang jianghang   48 2013-02-05 21:29 logs
    ```

- 配置修改

  ```
  vi conf/example/instance.properties
  ```

  ```
  ## mysql serverId
  canal.instance.mysql.slaveId = 1234
  #position info，需要改成自己的数据库信息
  canal.instance.master.address = 127.0.0.1:3306 
  canal.instance.master.journal.name = 
  canal.instance.master.position = 
  canal.instance.master.timestamp = 
  #canal.instance.standby.address = 
  #canal.instance.standby.journal.name =
  #canal.instance.standby.position = 
  #canal.instance.standby.timestamp = 
  #username/password，需要改成自己的数据库信息
  canal.instance.dbUsername = canal  
  canal.instance.dbPassword = canal
  canal.instance.defaultDatabaseName =
  canal.instance.connectionCharset = UTF-8
  #table regex
  canal.instance.filter.regex = .\*\\\\..\*
  ```

  - canal.instance.connectionCharset 代表数据库的编码方式对应到 java 中的编码类型，比如 UTF-8，GBK , ISO-8859-1
  - 如果系统是1个 cpu，需要将 canal.instance.parser.parallel 设置为 false (conf/canal.properties)

- 启动

  ```
  sh bin/startup.sh
  ```

- 查看 server 日志

  ```
  vi logs/canal/canal.log</pre>
  ```

  ```
  2013-02-05 22:45:27.967 [main] INFO  com.alibaba.otter.canal.deployer.CanalLauncher - ## start the canal server.
  2013-02-05 22:45:28.113 [main] INFO  com.alibaba.otter.canal.deployer.CanalController - ## start the canal server[10.1.29.120:11111]
  2013-02-05 22:45:28.210 [main] INFO  com.alibaba.otter.canal.deployer.CanalLauncher - ## the canal server is running now ......
  ```

- 查看 instance 的日志

  ```
  vi logs/example/example.log
  ```

  ```
  2013-02-05 22:50:45.636 [main] INFO  c.a.o.c.i.spring.support.PropertyPlaceholderConfigurer - Loading properties file from class path resource [canal.properties]
  2013-02-05 22:50:45.641 [main] INFO  c.a.o.c.i.spring.support.PropertyPlaceholderConfigurer - Loading properties file from class path resource [example/instance.properties]
  2013-02-05 22:50:45.803 [main] INFO  c.a.otter.canal.instance.spring.CanalInstanceWithSpring - start CannalInstance for 1-example 
  2013-02-05 22:50:45.810 [main] INFO  c.a.otter.canal.instance.spring.CanalInstanceWithSpring - start successful....
  ```

  **一开始启动不了，报各种CPU 内存的错误，怀疑内存不足造成的，修改startup.sh脚本**

- 关闭

  ```
  sh bin/stop.sh
  ```

### 客户端使用
```xml
<dependency>
    <groupId>com.alibaba.otter</groupId>
    <artifactId>canal.client</artifactId>
    <version>1.1.4</version>
</dependency>
```
或者采用Github上的第三方客户端
```xml
<dependency>
    <groupId>com.xpand</groupId>
    <artifactId>starter-canal</artifactId>
    <version>0.0.1-SNAPSHOT</version>
</dependency>
```

### Bibabo项目中的实际应用
```text
保证Redis与Mysql的数据一致性，本项目演示两种示例

示例1：强一致，只要Mysql修改了，就一定要读到最新的值。库存场景可以这样做，为减少提交订单占库存失败的场景
      stock服务查询库存，先删除Redis缓存，再更新数据库。在删除缓存和更新数据库的临界点存在并发问题，会导致数据不一致，需要加分布式读写锁。
示例2：最终一致，允许极短时间内读到的是未更新的数据，但是一段时间后需要完全一致。比如一些不影响业务结果，只会影响用户体验的操作
      order服务读取订单的收货人信息，Redis中读取，如果修改了收货人信息，先更新数据库，再删除Redis。
      那如果Mysql更新成功，Redis删除失败，可以使事务回滚，但如此的话业务的侵入性就变的很大。
      这里采用Canal伪装成Mysql的Slave节点同步binlog，拿到DML语句做增量同步Redis的最终一致性处理
```


# Elasticsearch

安装前需要root权限初始化一下内核参数和系统配置：

```bash
if [ `ulimit -n` -lt 65535 ];then ulimit -n 65535;echo -e "* soft nofile 65535\n* hard nofile 65535" >>/etc/security/limits.conf;fi
echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
sysctl -p
```

# 单机部署

下载LINUX X86_64格式的安装包，解压即可用了。

```bash
tar -zxf elasticsearch-7.2.1-linux-x86_64.tar.gz
useradd es
chown -R es:es elasticsearch-7.2.1*
#切换到es用户，es需要使用非root用户才能启动
su es
cd elasticsearch-7.2.1
bin/elasticsearch-certutil ca
bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12
mv elastic-* config/
```

编辑elasticsearch.yml

> 注意network.host参数，如果es只允许本机访问，则不需要配置；如果需要其他主机访问则配置为当前主机ip。

```bash
#vim config/elasticsearch.yml
network.host: 192.168.0.12
discovery.type: single-node

xpack.security.enabled: true
xpack.security.transport.ssl.enabled: true
xpack.security.transport.ssl.verification_mode: certificate
xpack.security.transport.ssl.keystore.path: elastic-certificates.p12
xpack.security.transport.ssl.truststore.path: elastic-certificates.p12
```

创建keystore

```undefined
bin/elasticsearch-keystore create
```

启动es:

```bash
#deaminzie启动
bin/elasticsearch  -d
#前台启动
bin/elasticsearch

#推荐第一次使用前台启动，便于发现问题，如果前台启动直接报错:Killed 无其它日志，则应该是你服务器内存不足了，es默认堆栈为1g，在config/jvm.properties  ## -Xms4g  -Xmx4g 调整一下即可。
```

接下来给es设置密码：

```bash
#手动或自动设置密码，二选一
bin/elasticsearch-setup-passwords interactive

bin/elasticsearch-setup-passwords auto
```

测试es是否正常工作：

```cpp
curl http://elastic:your_password@your_ip:9200
```

**所有ES相关操作需要使用es用户，先配置密码，再修改config/elasticsearch.yml#network.host:0.0.0.0**


# Kibana
*和Es放到同一台机器就无法使用，而且会把Es直接搞挂掉，很奇怪*

### 解压
```bash
tar -zxf kibana-7.2.1-linux-x86_64.tar.gz
useradd es
chown -R es:es kibana-7.2.1*
#切换到es用户，kibana需要使用非root用户才能启动
su es
```

### 配置
vim config/kibana.yml
```yaml
server.port: 5601
server.host: "0.0.0.0" ##对外暴露ip，因为云服务器，0.0.0.0会自动暴露公网ip
elasticsearch.hosts: ["http://39.107.156.177:9200"] ## Es地址
kibana.index: ".kibana" ## index Kibana在Es上的索引
elasticsearch.username: "elastic"
elasticsearch.password: "123456"
```
vim /bin/kibana 修改nodejs的堆内存大小为200M
```shell
NODE_OPTIONS="$NODE_OPTIONS --max-old-space-size=200" 
NODE_ENV=production BROWSERSLIST_IGNORE_OLD_DATA=true exec "${NODE}" --no-warnings --max-http-header-size=65536 $NODE_OPTIONS "${DIR}/src/cli" ${@}
```

### 启动
```bash
nohup ./kibana &
```

### 访问
http://114.116.44.130:5601
账号访问Kibana: elastic  123456

#Zipkin
链路追踪
下载jar包
```bash
wget https://search.maven.org/remote_content?g=io.zipkin&a=zipkin-server&v=LATEST&c=exec
nohup java -jar -Xms128m -Xmx128m -Xmn43M -XX:MetaspaceSize32m -XX:MaxMetaspaceSize32m zipkin.jar &
```
使用ES做持久化存储
```bash
java -jar -Xms64m -Xmx64m -Xmn32M zipkin-server-2.23.16-exec.jar --STORAGE_TYPE=elasticsearch --ES_HOSTS=localhost:9200 --ES_USERNAME=elastic --ES_PASSWORD=123456  -java.tmp.dir=/data/zipkin/temp >/dev/null >zipkin.log 2>&1 & echo $! > pidfile.txt
```

#Git
密钥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

