# VMWare

官网https://www.vmware.com/cn.html

https://www.vmware.com/cn/products/workstation-pro.html

登录后，账号密码

下载15以上版本，不然会有兼容问题，导致虚拟机黑屏并且无法关闭wmware提示centos繁忙

# CentOS

#### centos8开启网络

ip add 

如果没有网络，ens32 没有inet

需要配置

```
cd /etc/sysconfig/network-scripts
ifcfg-ens33这里是你的网卡的名字
vi ifcfg-ens33
按A键进入编辑模式，把onboot=no改为onboot = yes ，按Esc键退出编辑模式，输入:wq保存并退出；
如果不是root用户 切换为sudo su
```

重启后ip add如下

![1619265589786](D:\AboutIT\笔记\1619265589786.png)

##### CentoOS8.Netmanager自动关闭

```bash
启动：systemctl start NetworkManger
关闭：systemctl stop NetworkManager
开机启动：systemctl enable NetworkManager
查看是否开机启动：systemctl is-enabled NetworkManager
禁用开机启动：systemctl disable NetworkManager
```

先查到失效网卡，如ens33

```bash
nmcli c up ens33
```

出现错误：

```bash
Connection 'ens33' is not available on device ens33 because device is strictly unmanaged
```

有一种临时方案 ：

```bash
dhclient ens33
```

执行后可以上网，可以远程连接，但是重启系统后失效，依旧无法使用网络。原因是由于 NM托管未开启导致的。
查看托管状态：

```bash
nmcli n
```

如果显示为disable则为不可用；如果为enable则表示可用。笔者的则为disable，所以出现了前面的错误。
使用下面的命令启用：

```bash
nmcli n on
```

启用后重启系统就会可以使用网络了。图形界面也有网络连接了

#### yum失败

在2022年1月31日，CentOS团队终于从官方镜像中移除CentOS 8的所有包。

yum命令报错找不到镜像

```bash
Error: Failed to download metadata for repo 'appstream': Cannot prepare internal mirrorlist: No URLs in mirrorlist
```

更改为阿里镜像

1、将源文件备份

cd /etc/yum.repos.d/ && mkdir backup && mv *repo backup/ 
2、下载阿里源文件

curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo
3、更新源里面的地址

sed -i -e "s|mirrors.cloud.aliyuncs.com|mirrors.aliyun.com|g " /etc/yum.repos.d/CentOS-*
sed -i -e "s|releasever|releasever-stream|g" /etc/yum.repos.d/CentOS-*
4、生成缓存

yum clean all && yum makecache

#### 安装rz、sz

yum -y install lrzsz

#### 同步yum

yum install rsync -y 

虚拟机或云服务器ECS（Elastic Compute Service）弹性计算服务IaaS（Infrastructure as a Service）

#### 安装zip unzip

```bash
yum install zip
yum install unzip
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

shell远程同步

```text
rsync -av /data/zipkin/ 82.156.216.254:/data/zipkin
```

#CentOS异常情况总结
###1.阿里云镜像yum失效
"Could not resolve host: mirrors.cloud.aliyuncs.com; Unknown error"
已经安装了wget 但还是报错，一般是原来的wget初始化有文件损坏造成的。
yum remove wget卸载掉重新安装

# 软件安装与启动

本地虚拟机安装目录

/soft

## Mysql

1.先到官网下载到本地，再通过Xftp传输到linux上/soft目录下（需要root用户）

下载地址：https://dev.mysql.com/downloads/mysql/5.7.html#downloads

Linux -Generic

Linux -Generic(glibc 2.12)(x86, 64bit)

**Compressed TAR Archive**

2.到soft目录下解压（soft目录目的是为了统一存放软件安装包）root用户解压

```shell
tar -zxvf mysql-5.7.34-linux-glibc2.12-x86_64.tar.gz
```

3.解压好的mysql 移动并重命名一下

```shell
mv mysql-5.7.34-linux-glibc2.12-x86_64 /usr/local/mysql
```

4.创建mysql用户组和用户并修改权限

```shell
groupadd mysql
useradd -r -g mysql mysql
```

5.创建数据目录并赋予权限

```bash
mkdir -p  /data/mysql              #创建目录
chown mysql:mysql -R /data/mysql   #赋予权限
```

6.配置my.cnf

```shell
vim /etc/my.cnf
```

内容如下

```shell
[mysqld]
bind-address=0.0.0.0
port=3306
user=mysql
basedir=/usr/local/mysql
datadir=/data/mysql
socket=/tmp/mysql.sock
log-error=/data/mysql/mysql.err
pid-file=/data/mysql/mysql.pid
#character config
character_set_server=utf8mb4
symbolic-links=0
explicit_defaults_for_timestamp=true
```

7.初始化数据库

进入mysql的bin目录

```shell
cd /usr/local/mysql/bin/
```

初始化

```shell
./mysqld --defaults-file=/etc/my.cnf --basedir=/usr/local/mysql/ --datadir=/data/mysql/ --user=mysql --initialize
```

 查看密码

```shell
cat /data/mysql/mysql.err
```

![1619321797630](D:\AboutIT\笔记\1619321797630.png)

8.启动mysql，并更改root 密码

先将mysql.server放置到/etc/init.d/mysql中

```shell
cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql
```

启动

```shell
service mysql start
ps -ef|grep mysql
```

安装完成

9.登录mysql

```shell
./mysql -u root -p   #bin目录下
#密码是刚刚随机生成的
```

可能会报错

```error
./mysql: error while loading shared libraries: libncurses.so.5: cannot open shared object file: No such file or directory
```

解决：

```shell
yum install libncurses*
```

再执行下面三步操作，然后重新登录

```bash
SET PASSWORD = PASSWORD('123456');
ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
FLUSH PRIVILEGES;   
```

 10.这时候你如果使用远程连接……你会发现你无法连接

再次登录mysql后修改

```bash
use mysql                                            #访问mysql库
update user set host = '%' where user = 'root';      #使root能再任何host访问
FLUSH PRIVILEGES;    								 #刷新
```

11.如果不希望每次都到bin目录下使用mysql命令则执行以下命令

```shell
ln -s  /usr/local/mysql/bin/mysql    /usr/bin
```

12.开机后启动

service mysql start

13.非本机可能还连不上

永久关闭防火墙

systemctl disable firewalld

chkconfig iptables off

14.密码及登录

密码123456

登录mysql   ./mysql -u root -p   *#bin目录下*

## Java

1.查看yum库中都有哪些jdk版本

```bash
yum search java|grep jdk
```

2.安装1.8

```bash
yum install java-1.8.0-openjdk
```

3.查找安装路径

```bash
which java
ls -lrt /usr/bin/java
```

4.安装jdk运行环境

```
javac
-bash: javac: command not found
```

错误原因：默认安装完只有运行环境，java安装目录下只有jre文件夹

安装开发环境

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

5.进入安装目录

```bash
cd /usr/lib/jvm
```

![1619450771315](D:\AboutIT\笔记\1619450771315.png)

java-1.8.0-openjdk-1.8.0.292.b10-0.el8_3.x86_64

6.设置环境变量

```
vim /etc/profile
```

```properties
#set java environment
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-0.el8_3.x86_64
JRE_HOME=$JAVA_HOME/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH
```

```shell
source /etc/profile
echo $JAVA_HOME
```

```shell
java -version
```

![1619451015083](D:\AboutIT\笔记\1619451015083.png)

## RocketMQ

1.安装Rocket

java相关的软件都可以到官网上有详细指导安装，这里我们说下可能出现的问题

2.启动nameserver

```bash
nohup sh bin/mqnamesrv &
tail -f ~/logs/rocketmqlogs/namesrv.log
```

3.启动broker

```bash
nohup sh bin/mqbroker -n localhost:9876 &
tail -f ~/logs/rocketmqlogs/broker.log 
```

4.内存不足导致无法启动

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

5.阿里云ECS服务器，nameserver返回的broker地址为私网地址无法供外部访问

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

6.安装可视化控制台

github搜rocketmq-externals项目

https://github.com/apache/rocketmq-dashboard

下载master代码

```bash
https://github.com/apache/rocketmq-dashboard/archive/refs/heads/master.zip
```

更改镜像

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

启动控制台

```bash
mvn spring-boot:run
```

或者

```bash
mvn clean package -Dmaven.test.skip=true
nohup java -jar -Xms128m -Xmx128m  target/rocketmq-dashboard-1.0.1-SNAPSHOT.jar &
```

[http://39.107.156.177:8090](http://39.107.156.177:8090/)

## Zookeeper

https://www.apache.org/dyn/closer.lua/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2.tar.gz

```
wget https://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2.tar.gz 不可用
wget https://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz
带有bin名称的包才是我们想要的下载可以直接使用的里面有编译后的二进制的包，而之前的普通的tar.gz的包里面是只是源码的包无法直接使用
```

```
tar -zxvf apache-zookeeper-3.6.2.tar.gz
```

```
cd /data/apache-zookeeper-3.6.2/conf
```

```
cp zoo_sample.cfg  zoo.cfg
```

编辑并配置 日志存储目录，如无指定目录需要创建 否则启动报错

```
vim zoo.cfg  
dataDir=/tmp/zookeeper
dataLogDir=/tmp/zookeeper/log
```

配置环境变量并使其生效

```
vim /etc/profile
添加
export ZOOKEEPER=/usr/local/zookeeper
export PATH=$PATH:$ZOOKEEPER/bin
使新配置的环境变量生效
source /etc/profile
```

配置了环境变量，所以在任意目录下都可以运行以下启动命令启动Zookeeper

```
./zkServer.sh start-foreground
```

```shell
nohup sh zkServer.sh start  >zookeeper.out &
```

**调优JVM**

zkServer.sh脚本

```shell
if [ -e "$ZOOBIN/../libexec/zkEnv.sh" ]; then
  . "$ZOOBINDIR"/../libexec/zkEnv.sh
else
  . "$ZOOBINDIR"/zkEnv.sh
fi
```

zkEnv.sh脚本

```shell
if [ -f "$ZOOCFGDIR/java.env" ]
then
    . "$ZOOCFGDIR/java.env"
fi
```

conf/java.env

```
# heap size MUST be modified according to cluster environment
export JVMFLAGS="-Xms256m -Xmx256m -Xmn42m $JVMFLAGS"
```

### zookeeper迁移

1.判断连接数

netstat -an | grep 33| awk -F ':' '{print $8}'|sort -n |uniq -c|sort -nr

2.zookeeper迁移

1. 复制zookeeper server目录到新机器： 目的(zoo.cfg配置同原始机器)

   rsync -vzrtopg --progress jenkins@10.254.64.193:/data/zookeeper-server /data

2. 复制zookeeper data目录到新机器： 目的(保证myid同原始机器)
   rsync -vzrtopg --progress jenkins@10.254.64.193:/data/zookeeper-data /data

3. 关掉要迁移的zookeeper： zkServer stop

4. 检查另外两台机器是否能正常工作： zkServer status

5. 切换域名：提前给运维同事，保证切换过程要快

   

6. 启动新机器，并检查状态：
   zkServer start
   zkServer status

## Maven

1.到maven官网下载页面

<https://maven.apache.org/download.cgi>

复制下载链接linux下载

https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz

注意要换成http

```bash
wget http://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
```

2.解压缩

```bash
tar -zxvf apache-maven-3.8.5-bin.tar.gz
```

3.配置环境变量

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

4.检查版本

```bash
mvn -v
```



```
yum -y install wget         常规的安装wget的操作命令
```

![1619451694973](D:\AboutIT\笔记\1619451694973.png)

## Nacos

```
wget https://github.com/alibaba/nacos/releases/download/1.4.1/nacos-server-1.4.1.tar.gz
```

从github虚拟机下载太慢了，也没找到镜像，直接本地下载再Xftp扔到虚拟机上

```
tar -zxvf nacos-server-1.4.1.tar.gz
```

```
mv nacos /data/
```

```
cd /data/nacos/bin
```

修改jvm参数大小

```
vim startup.sh
由于我们是单机，只修改单机模式即可
if [[ "${MODE}" == "standalone" ]]; then
    JAVA_OPT="${JAVA_OPT} -Xms256m -Xmx256m -Xmn42m"
```

```
启动命令(standalone代表着单机模式运行，非集群模式):
sh startup.sh -m standalone
```

```
ps -ef | grep nacos
```

```
控制台地址
http://82.156.216.254:8848/nacos/
```

账号：nacos

密码：nacos

## Sentinel Dashboard

1.github上有控制台安装教程

[https://github.com/alibaba/Sentinel/wiki/%E6%8E%A7%E5%88%B6%E5%8F%B0](https://github.com/alibaba/Sentinel/wiki/控制台)

2.下载jar

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

账号密码：sentinel  sentinel

## Redis

1.gcc

由于 redis 是用 C 语言开发，安装之前必先确认是否安装 gcc 环境（gcc -v），如果没有安装，执行以下命令进行安装

```bash
yum install -y gcc
```

2.到官网复制安装包下载链接

```bash
wget https://download.redis.io/releases/redis-5.0.14.tar.gz
```

解压缩

```bash
tar -zxvf redis-5.0.14.tar.gz
```

3.cd切换到redis解压目录下，执行编译

```bash
make
```

redis6.x会报错，找不到包，需要将gcc升级为5.3以上

```bash
gcc -v
4.8.5-44
```

此处我把redis降为5.x

4.安装并指定安装目录

```bash
make install PREFIX=/usr/local/redis
```

5.启动

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

6.启用aof事务写入

设置aof持久化：appendonly修改为yes

7.启动密码

设置连接密码：去掉*#requirepass 后面的字符串则为密码*

redis-cli登录

```redis
auth 123456
```

8.通过Sentinel 找到master地址

```redis
redis-cli -h  redis.uat.chunbo.com -p  26381
SENTINEL get-master-addr-by-name
```

**如果出现下面错误**

```redis
(error) NOAUTH Authentication required.
```

需要输入密码

```redis
auth 123456
```

### 线上通过Sentinel找到master

.\redis-cli.exe -h bredis.prod.chunbo.com -p 26381

SENTINEL get-master-addr-by-name mymaster

1) "10.254.64.112"
2) "6381"

 .\redis-cli.exe -h 10.254.64.112 -p 6381

### Redis Bloomfilter

1.github选最新版本下载RedisBloom源码到Linux

```shell
wget https://github.com/RedisBloom/RedisBloom/archive/refs/tags/v2.4.2.tar.gz
```

2.解压

```bash
unzip 
```

3.生成redisbloom.so扩展库

文件夹中会自带一个Makefile文件，执行编译命令 make

编译完之后就会生成redisbloom.so扩展库

**出现问题**

3.1make

```shell
$ make
Makefile:20: deps/readies/mk/main: No such file or directory
Makefile:197: /defs: No such file or directory
Makefile:224: /rules: No such file or directory
make: No rule to make target '/rules'.  Stop.
```

到github上找到deps/readies下载下来依赖的文件

```shell
wget https://github.com/RedisLabsModules/readies/archive/refs/heads/master.zip
```

解压替换为readies

3.2再次make

```shell
wget https://github.com/RedisBloom/t-digest-c/archive/refs/heads/master.zip
```

```
Building /data/RedisBloom-2.4.2/bin/linux-x64-release/t-digest-c/src/libtdigest_static.a ...
make[1]: *** No rule to make target '/data/RedisBloom-2.4.2/deps/t-digest-c/CMakeLists.txt', needed by '/data/RedisBloom-2.4.2/bin/linux-x64-release/t-digest-c/Makefile'.  Stop.
make: *** [Makefile:238: /data/RedisBloom-2.4.2/bin/linux-x64-release/t-digest-c/src/libtdigest_static.a] Error 2
```

解压替换为t-digest-c

https://github.com/RedisBloom/t-digest-c

3.3再次make

```shell
# 再次执行命令，查看对应位置代码，发现我们make版本太低，至少为4，好吧，老老实实安装linux版本make4.4版本吧，windows没找到
$ make
deps/readies/mk/main:6: *** GNU Make version is too old. Aborting..  Stop.
```

```shell
make -v
wget http://ftp.gnu.org/gnu/make/make-4.4.tar.gz
tar -zxvf make-4.4.tar.gz
cd make-4.4
./configure
make install
which make
/usr/local/bin/make -v
cd /usr/bin
mv make make3.8
ln -s /usr/local/bin/make ./make
make -v
[root@iZuf6fjdhecwn46n83l0hqZ bin]# make -v
GNU Make 4.4
Built for x86_64-pc-linux-gnu
Copyright (C) 1988-2022 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

3.4centos7安装gcc

```shell
yum -y install gcc gcc-c++ autoconf pcre pcre-devel make automake
```

3.5再make

```
/usr/bin/bash: cmake: command not found
make[1]: *** [Makefile:99: /data/RedisBloom-2.4.2/bin/linux-x64-release/t-digest-c/Makefile] Error 127
make: *** [Makefile:238: /data/RedisBloom-2.4.2/bin/linux-x64-release/t-digest-c/src/libtdigest_static.a] Error 2
```

3.6安装cmake

CMake 官方下载网址： https://cmake.org/download/

```shell
wget https://github.com/Kitware/CMake/releases/download/v3.25.1/cmake-3.25.1-linux-x86_64.tar.gz
```

```shell
vim /etc/profile
加环境变量
###set cmake enviroment
export PATH=$PATH:/data/cmake/bin
```

3.7继续make

继续报错

```
/data/RedisBloom-2.4.2/deps/t-digest-c/src/tdigest.c:59:5: error: ‘for’ loop initial declarations are only allowed in C99 mode
     for (unsigned int j = start; j < end; j++) {
```

linux系统下的c编程与windows有所不同，如果你在用gcc编译代码的时候提示‘for’ loop initial declarations are only allowed in C99 mode，可能就是因为你在loop循环比如for中使用未预先定义的变量，比如：
这是因为在gcc中不支持直接在for循环中初始化变量：

```c
for(int i=0; i<len; i++) {
}
```

下面这种写法在vc里是没有错的，而在gcc就会提示错误，要求遵守c89标准，c89标准是不支持上述写法的，必须先定义i变量：

```c
int i;
for(i=0;i<len;i++){
}
```

**把cd deps/t-digest-c/src/tdigest.c这个C文件全部循环声明提前**

3.8继续make

```shell
Compiling deps/bloom/bloom.c...
deps/bloom/bloom.c:24:25: fatal error: murmurhash2.h: No such file or directory
#include "murmurhash2.h"
```

## Seata

1.下载Seata-Server

```bash
wget https://github.com/seata/seata/releases/download/v1.3.0/seata-server-1.3.0.tar.gz --no-check-certificate
```

2.调整shell脚本的JVM启动参数

找到bin目录下的seata-server.sh，修改JVM启动参数，调小内存分配

```shell
$JAVA_OPTS -server -Xmx256m -Xms256m -Xmn128m -Xss512k -XX:SurvivorRatio=10 -XX:MetaspaceSize=32m -XX:MaxMetaspaceSize=64m -XX:MaxDirectMemorySize=64m
```

### Server配置

1.初始化Seata所需表

https://github.com/seata/seata/blob/develop/script/server/db/mysql.sql

2.修改server端的配置文件

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

3.把Seata客户端服务端所需配置通过脚本注册到nacos上

在server的服务器seata目录下操作

https://github.com/seata/seata/blob/develop/script/config-center/config.txt

https://github.com/seata/seata/blob/develop/script/config-center/nacos/nacos-config.sh

将config.txt放到seata目录下，将nacos-config.sh放到seata/bin目录下

执行注册配置脚本

```shell
sh nacos-config.sh -h 127.0.0.1 -p 8848 -g BIBABO_SEATA_GROUP -u nacos -w nacos
```

4.修改服务端所需配置

4.1.把server端所需存储放到mysql上

建库bibabo_seata

建表https://github.com/seata/seata/blob/develop/script/server/db/mysql.sql

4.2.到nacos修改store相关配置

修改store.mode=db;

修改store.db.url、username、password...

5.启动Seata-Server

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

## Canal

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

## Elasticsearch

安装前需要root权限初始化一下内核参数和系统配置：

```bash
if [ `ulimit -n` -lt 65535 ];then ulimit -n 65535;echo -e "* soft nofile 65535\n* hard nofile 65535" >>/etc/security/limits.conf;fi
echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
sysctl -p
```

1.单机部署

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

## Kibana

*和Es放到同一台机器就无法使用，而且会把Es直接搞挂掉，很奇怪*

1.解压

```bash
tar -zxf kibana-7.2.1-linux-x86_64.tar.gz
useradd es
chown -R es:es kibana-7.2.1*
#切换到es用户，kibana需要使用非root用户才能启动
su es
```

2.配置

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

3.启动

```bash
nohup ./kibana &
```

4.访问

http://114.116.44.130:5601
账号访问Kibana: elastic  123456

#Zipkin
链路追踪
下载jar包

```bash
wget https://search.maven.org/remote_content?g=io.zipkin&a=zipkin-server&v=LATEST&c=exec
nohup java -jar -Xms128m -Xmx128m -Xmn43M -XX:PermSize=16m -XX:MaxPermSize=32m zipkin-server-2.23.16-exec.jar &
```

使用ES做持久化存储

```bash
java -jar -Xms64m -Xmx64m -Xmn32M zipkin-server-2.23.16-exec.jar --STORAGE_TYPE=elasticsearch --ES_HOSTS=localhost:9200 --ES_USERNAME=elastic --ES_PASSWORD=123456  -java.tmp.dir=/data/zipkin/temp >/dev/null >zipkin.log 2>&1 & echo $! > pidfile.txt
```

http://39.107.156.177:9411

## Tidb

## Hadoop

```text
1B=8bit
1KB=1024B
1MB=1024KB
1GB=1024MB
1TB=1024GB
1PB=1024TB
1EB=1024PB
1ZB=1024EB
1YB=1024ZB
```

## Hive

## Hbase

## Spark

## Git

密钥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

  



## Docker

1.Docker及系统版本

Docker从17.03版本之后分为CE（Community Edition: 社区版）和EE（Enterprise Edition: 企业版）。相对于社区版本，企业版本强调安全性，但需付费使用。这里我们使用社区版本即可。

Docker支持64位版本的CentOS 7和CentOS 8及更高版本，它要求Linux内核版本不低于3.10。

查看Linux版本的命令这里推荐两种：`lsb_release -a`或`cat /etc/redhat-release`。

`lsb_release -a`查看效果：

```
[ ~]$ lsb_release -a
LSB Version: :core-4.1-amd64:core-4.1-noarch
Distributor ID: CentOS
Description: CentOS Linux release 7.6.1810 (Core)
Release: 7.6.1810
Codename: Core
```

`cat /etc/redhat-release`查看版本效果：

```
[~]$ cat /etc/redhat-release
CentOS Linux release 7.6.1810 (Core)
```

显然，当前Linux系统为CentOS7。再查一下内核版本是否不低于3.10。

查看内核版本有三种方式：

- cat /proc/version
- uname -a
- uname -r

三种形式都可以查看到内容版本，比如：

```
[ ~]$ uname -r
3.10.0-1160.45.1.el7.x86_64
```

可以看到，当前Linux内核版本满足Docker的需要。

2.Docker的自动化安装

Docker官方和国内daocloud都提供了一键安装的脚本，使得Docker的安装更加便捷。

官方的一键安装方式：

```
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```

国内 daocloud一键安装命令：

```
curl -sSL https://get.daocloud.io/docker | sh
```

执行上述任一条命令，耐心等待即可完成Docker的安装。

3.Docker手动安装

手动安装Docker分三步：卸载、设置仓库、安装。

卸载Docker（可选）

**第一步，卸载历史版本**。这一步是可选的，如果之前安装过旧版本的Docker，可以使用如下命令进行卸载：

```
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine \
                  docker-ce

```

3.1.设置源仓库

**第二步，设置仓库**。新主机上首次安装Docker Engine-Community之前，需要设置Docker仓库。此后可从仓库安装和更新Docker。

在设置仓库之前，需先按照所需的软件包。yum-utils提供了yum-config-manager，并且device mapper存储驱动程序需要device-mapper-persistent-data和lvm2。

```
$ sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

```

执行上述命令，安装完毕即可进行仓库的设置。使用官方源地址设置命令如下：

```
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

```

通常，官方的源地址比较慢，可将上述的源地址替换为国内比较快的地址：

- 阿里云：http:**//**mirrors.aliyun.com**/**docker-ce**/**linux**/**centos**/**docker-ce.repo
- 清华大学源：https:**//**mirrors.tuna.tsinghua.edu.cn**/**docker-ce**/**linux**/**centos**/**docker-ce.repo

仓库设置完毕，即可进行Docker的安装。

3.2.Docker安装

执行一下命令，安装最新版本的 Docker Engine-Community 和 containerd。

```
sudo yum install -y docker-ce docker-ce-cli containerd.io

```

docker-ce为社区免费版本。稍等片刻，docker即可安装成功。但安装完成之后的默认是未启动的，需要进行启动操作。

如果不需要docker-ce-cli或containerd.io可直接执行如下命令：

```
yum install -y docker-ce

```

至此，完成Docker安装。

3.3.Docker启动

启动Docker的命令：

```
sudo systemctl start docker

```

通过运行hello-world镜像来验证是否正确安装了Docker Engine-Community。

```
// 拉取镜像
sudo docker pull hello-world
// 执行hello-world
sudo docker run hello-world

```

如果执行之后，控制台显示如下信息，则说明Docker安装和启动成功：

```
[root@iZ8vb8pfb2awsz4qy7vm7qZ ~]# docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.
……

```

除了启动Docker，一些其他启动相关的命令：

- 守护进程重启：systemctl daemon-reload
- 重启Docker服务：systemctl restart docker / service docker restart
- 关闭Docker服务：docker service docker stop / docker systemctl stop docker

3.4.删除Docker

删除安装包：

```
yum remove docker-ce
```

删除镜像、容器、配置文件等内容：

```
rm -rf /var/lib/docker
```

4.Docker其他常见命令

安装完成Docker之后，这里汇总列一下常见的Docker操作命令：

- 搜索仓库镜像：docker search 镜像名
- 拉取镜像：docker pull 镜像名
- 查看正在运行的容器：docker ps
- 查看所有容器：docker ps -a
- 删除容器：docker rm container_id
- 查看镜像：docker images
- 删除镜像：docker rmi image_id
- 启动（停止的）容器：docker start 容器ID
- 停止容器：docker stop  容器ID
- 重启容器：docker restart 容器ID
- 启动（新）容器：docker run -it ubuntu /bin/bash
- 进入容器：`docker attach 容器ID`或`docker exec -it 容器ID /bin/bash`，推荐使用后者。

更多的命令可以通过`docker help`命令来查看。

5.小结

本篇文章带大家从头到尾在Linux操作系统上安装了Docker，以及介绍了如何启动、验证及常见的命令。后面如果有机会话，再大家了解一下如何制作Docker镜像，用于CI/CD发布当中。

## SpringBoot使用脚本启动、关闭

### linux上创建脚本：touch start.sh、touch stop.sh

chmod 777 整个项目文件夹

1.编写启动脚本vim start.sh

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

2.编写关闭脚本vim stop.sh

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