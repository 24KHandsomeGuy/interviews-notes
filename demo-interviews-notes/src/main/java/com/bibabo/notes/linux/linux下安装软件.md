

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



# 软件安装与启动

本地虚拟机安装目录

/soft

## Mysql

1.先到官网下载到本地，再通过Xftp传输到linux上/soft目录下（需要root用户）

下载地址：https://dev.mysql.com/downloads/mysql/5.7.html#downloads

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

## Java

1.查看yum库中都有哪些jdk版本

```shell
yum search java|grep jdk
```

2.安装1.8

```
yum install java-1.8.0-openjdk
```

3.进入安装目录

```
cd /usr/lib/jvm
```

![1619450771315](D:\AboutIT\笔记\1619450771315.png)

java-1.8.0-openjdk-1.8.0.292.b10-0.el8_3.x86_64

4.设置环境变量

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
```

```shell
java -version
```

![1619451015083](D:\AboutIT\笔记\1619451015083.png)





## RocketMQ

```
cd /usr/local/rocketmq/rocketmq-all-4.4.0/distribution/target/apache-rocketmq/bin
```

```
nohup sh mqnamesrv &
```

```
nohup sh mqbroker -n localhost:9876 &
```

## Seata

```
cd /data/seata/bin
```

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

### zookeeper迁移

#### 判断连接数

netstat -an | grep 33| awk -F ':' '{print $8}'|sort -n |uniq -c|sort -nr

#### zookeeper迁移

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

```
yum -y install wget         常规的安装wget的操作命令
```

```
wget https://mirrors.bfsu.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
```

```
tar -zxvf apache-maven-3.6.3-bin.tar.gz
```

```
mv apache-maven-3.6.3 /data/
```

```shell
vim /etc/profile
```

```properties
export MAVEN_HOME=/data/apache-maven-3.6.3
export MAVEN_HOME
export PATH=$PATH:$MAVEN_HOME/bin
```

```shell
source /etc/profile
```

```
mvn -version
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

```
启动命令(standalone代表着单机模式运行，非集群模式):
sh startup.sh -m standalone
```

```
ps -ef | grep nacos
```

```
控制台地址
http://192.168.16.112:8848/nacos/
```

账号：nacos

密码：nacos

## Redis

安装到这个目录下 /usr/local/redis/

http://redis.io

```shell
wget http://download.redis.io/releases/redis-5.0.7.tar.gz
#会很慢，我本地下载然后扔到虚拟机上
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



## SpringBoot

nohup java -jar -Dserver.port=8088 gupao-demo-springboot-thread-0.0.1-SNAPSHOT.jar >all.log &

## Docker

### 背景

最近接手了几个项目，发现项目的部署基本上都是基于Docker的，幸亏在几年前已经熟悉的Docker的基本使用，没有抓瞎。这两年随着云原生的发展，Docker在云原生中的作用使得它也蓬勃发展起来。

今天这篇文章就带大家一起实现一下在Linux操作系统下Docker的部署过程，收藏起来，以备不时之需。当然，如果对Docker感兴趣的话，可以直接根据本文的步骤操作起来。终有一天你会享受到Docker的便利与魅力的。

### Docker及系统版本

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

### Docker的自动化安装

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

### Docker手动安装

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

#### 设置源仓库

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

#### Docker安装

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

#### Docker启动

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

#### 删除Docker

删除安装包：

```
yum remove docker-ce
```

删除镜像、容器、配置文件等内容：

```
rm -rf /var/lib/docker
```

### Docker其他常见命令

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

### 小结

本篇文章带大家从头到尾在Linux操作系统上安装了Docker，以及介绍了如何启动、验证及常见的命令。后面如果有机会话，再大家了解一下如何制作Docker镜像，用于CI/CD发布当中。







































# Java排查问题命令

启动死锁或cpu飙高的springboot项目

nohup java -jar -Dserver.port=8088 gupao-demo-springboot-thread-0.0.1-SNAPSHOT.jar >all.log &

top命令排查

jps 或 ps -efaux | grep java找到pid

## 1.线程排查死锁

http://192.168.1.8:8088/dead 模拟死锁

jstack pid

![1646535395010](D:\AboutIT\笔记\1646535395010.png)

## 2.cpu飙高

http://192.168.1.8:8088/loop 模拟cpu飙高

![1646535603745](D:\AboutIT\笔记\1646535603745.png)

找到pid，定位飙高的线程

top -H -p 32790

![1646535699982](D:\AboutIT\笔记\1646535699982.png)

32811为飙高线程，转换为16进制

printf "0x%x\n" 32811

0x802b

 jstack 32790| grep -A 30 0x802b

![1646535974833](D:\AboutIT\笔记\1646535974833.png)

## 3.dubbo服务无法访问

检查暴露的rest协议端口

netstat -anp | grep 8080

端口是开启的，并且可以Ping通

查看catalina.out日志发现leak memory导致开启容器时失败

调配JVM参数，缩减服务器所占内存。重启就可以了

## 4.vmstat

**vmstat命令是最常见的Linux/Unix监控工具,属于sysstat包**

procs -----------memory---------- ---swap-- -----io---- --system-- -----cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0   3172 150880 152876 1652272    0    0     0     0  577  934  0  0 100  0  0	
 0  0   3172 150880 152876 1652272    0    0     0     0  510  899  0  0 100  0  0	
 0  0   3172 150880 152876 1652272    0    0     0    44  591  963  0  0 100  0  0	
 0  0   3172 150740 152876 1652272    0    0     0     0 2598 2669  1  0 98  0  0	
 0  0   3172 150204 152876 1652296    0    0     0   120 2916 2889  2  0 98  0  0	
 0  0   3172 149940 152876 1652300    0    0     0     0 3148 3073  1  0 98  0  0	
 0  0   3172 150120 152876 1652308    0    0     0     0 4121 3293  3  1 96  0  0	
 0  0   3172 150060 152876 1652312    0    0     0    56 3276 3133  2  1 98  0  0	
 0  0   3172 149768 152876 1652316    0    0     0     0 3223 3093  2  0 98  0  0	
 0  0   3172 149440 152876 1652316    0    0     0    16 3163 3141  1  1 98  0  0	
 0  0   3172 149424 152876 1652344    0    0     0     0 3005 3312  2  1 98  0  0	
 0  0   3172 149572 152876 1652364    0    0     0     0 3054 3203  2  0 98  0  0	
 0  0   3172 149568 152876 1652368    0    0     0    24 3366 3534  2  1 98  0  0	
 0  0   3172 149816 152876 1652480    0    0     0     0 1444 1921  1  0 99  0  0	

![1669969123657](D:\AboutIT\笔记\1669969123657.png)

vmstat是Virtual Meomory Statistics（虚拟内存统计）的缩写，可对操作系统的虚拟内存、进程、IO读写、CPU活动等进行监视。它是对系统的整体情况进行统计，不足之处是无法对某个进程进行深入分析。

### 输出字段意义：

#### procs

##### r

The number of processes waiting for run time.

等待运行的进程数。如果等待运行的进程数越多，意味着CPU非常繁忙。另外，如果该参数长期大于和等于逻辑cpu个数，则CPU资源可能存在较大的瓶颈。

##### b

The number of processes in uninterruptible sleep. 

处在非中断睡眠状态的进程数。意味着进程被阻塞。主要是指被资源阻塞的进程对列数（比如IO资源、页面调度等），当这个值较大时，需要根据应用程序来进行分析，比如数据库产品，中间件应用等。

#### Memory

##### swpd

the amount of virtual memory used.

 已使用的虚拟内存大小。如果虚拟内存使用较多，可能系统的物理内存比较吃紧，需要采取合适的方式来减少物理内存的使用。swapd不为0，并不意味物理内存吃紧，如果swapd没变化，si、so的值长期为0,这也是没有问题的     

##### free

the amount of idle memory.

空闲的物理内存的大小

##### buff

the amount of memory used as buffers.

用来做buffer（缓存，主要用于块设备缓存）的内存数，单位：KB

##### cache

the amount of memory used as cache.

用来做cache（缓存，主要用于缓存文件）的内存，单位：KB

##### inact

the amount of inactive memory. (-a option)

inactive memory的总量

##### active

the amount of active memory. (-a option)

active memroy的总量

si: Amount of memory swapped in from disk (/s).

#### swap

##### si

Amount of memory swapped in from disk (/s).

从磁盘交换到**swap**虚拟内存的交换页数量，单位：KB/秒。如果这个值大于**0**，表示物理内存不够用或者内存泄露了  

##### so

Amount of memory swapped to disk (/s).

从**swap**虚拟内存交换到磁盘的交换页数量，单位：KB/秒，如果这个值大于**0**，表示物理内存不够用或者内存泄露了

**内存够用的时候，这2个值都是0，如果这2个值长期大于0时，系统性能会受到影响，磁盘IO和CPU资源都会被消耗。**
    当看到空闲内存（free）很少的或接近于0时，就认为内存不够用了，这个是不正确的。不能光看这一点，还要结合si和so，如果free很少，但是si和so也很少（大多时候是0），那么不用担心，系统性能这时不会受到影响的。
    当内存的需求大于RAM的数量，服务器启动了虚拟内存机制，通过虚拟内存，可以将RAM段移到SWAP DISK的特殊磁盘段上，这样会 出现虚拟内存的页导出和页导入现象，页导出并不能说明RAM瓶颈，虚拟内存系统经常会对内存段进行页导出，但页导入操作就表明了服务器需要更多的内存了， 页导入需要从SWAP DISK上将内存段复制回RAM，导致服务器速度变慢。

#### IO

##### bi

Blocks received from a block device (blocks/s).

每秒从块设备接收到的块数，单位：块/秒 也就是读块设备。

##### bo

Blocks sent to a block device (blocks/s).

每秒发送到块设备的块数，单位：块/秒  也就是写块设备。

#### system

##### in

The number of interrupts per second, including the clock.

每秒的中断数，包括时钟中断 

##### cs

The number of context switches per second. 

每秒的环境（上下文）切换次数。比如我们调用系统函数，就要进行上下文切换，而过多的上下文切换会浪费较多的cpu资源，这个数值应该越小越好。

#### CPU

These are percentages of total CPU time.

##### us

Time spent running non-kernel code. (user time, including nice time)

用户CPU时间(非内核进程占用时间)（单位为百分比）。 us的值比较高时，说明用户进程消耗的CPU时间多

##### sy

Time spent running kernel code. (system time)

系统使用的CPU时间（单位为百分比）。sy的值高时，说明系统内核消耗的CPU资源多，这并不是良性表现，我们应该检查原因。

##### id

Time spent idle. Prior to Linux 2.5.41, this includes IO-wait time.

空闲的CPU的时间(百分比)，在Linux 2.5.41之前，这部分包含IO等待时间。

##### wa

Time spent waiting for IO. Prior to Linux 2.5.41, shown as zero.

等待IO的CPU时间，在Linux 2.5.41之前，这个值为0 .这个指标意味着CPU在等待硬盘读写操作的时间，用百分比表示。wait越大则机器io性能就越差。说明IO等待比较严重，这可能由于磁盘大量作随机访问造成，也有可能磁盘出现瓶颈（块操作）。

##### st

Time stolen from a virtual machine. Prior to Linux 2.6.11, unknown.

### 使用示例：

1: 查看vmstat命令的帮助信息

man vmstat

2: 显示活动(active)与非活动(inactive)的内存

vmstat -a 2 10

3：不加任何参数，vmstat命令只输出一条记录，这个数据是自系统上次重启之后到现在的平均数值。

vmstat

4：显示各种事件计数器表和内存统计信息，这显示不重复。

vmstat -s

5：可以扩大字段长度，当内存较大时，默认长度不够完全展示内存时，会导致字段值偏移，导致查看不便

vmstat -w 2 5

6:显示磁盘分区数据（disk partition statistics ）

vmstat -p sdc5 2 10

## 5.pidstat

pidstat是sysstat工具的一个命令，用于监控全部或指定进程的cpu、内存、线程、设备IO等系统资源的占用情况。pidstat首次运行时显示自系统启动开始的各项统计信息，之后运行pidstat将显示自上次运行该命令以后的统计信息。用户可以通过指定统计的次数和时间来获得所需的统计信息。

04:48:45 PM       PID    %usr %system  %guest    %CPU   CPU  Command
04:48:45 PM      1629    0.00    0.00    0.00    0.00     4  crond
04:48:45 PM      2465    0.01    0.04    0.00    0.05     6  zabbix_agentd
04:48:45 PM      2466    0.00    0.01    0.00    0.02     2  zabbix_agentd
04:48:45 PM      2467    0.00    0.01    0.00    0.02     1  zabbix_agentd
04:48:45 PM      2468    0.00    0.01    0.00    0.02     2  zabbix_agentd
04:48:45 PM      2469    0.00    0.00    0.00    0.00     3  zabbix_agentd
04:48:45 PM      5317    0.00    0.00    0.00    0.00     6  java
04:48:45 PM     18423    0.00    0.00    0.00    0.01     5  java
04:48:45 PM     19530    0.00    0.00    0.00    0.00     0  pidstat
04:48:45 PM     33288    0.02    0.01    0.00    0.03     4  java

每隔1秒输出1组数据（需要 Ctrl+C 才结束）

## 6.Linux下环境变量误改错修复

1，在命令行中输入
export PATH=/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11R6/bin
这样可以保证命令行命令暂时可以使用。命令执行完之后先不要关闭终端
或者cd /usr/bin 下执行vi命令

2、恢复bash_profile文件
vi ~/.bash_profile

3、很有可能是你的PATH 环境变量设置错误，比如 $PATH 漏了

```
PATH=$PATH:$PATH1
```

4、 立即生效，source ~/.bash_profile

# 常用命令



## echo

rm -rf删除日志文件，但如果服务器不重启，这些空间不会释放掉

使用echo "" > xxx.log 可清空文件并释放空间，然后再rm -rf

也可以使用cat /dev/null > xxx.log

## crond

定时任务的使用场景非常广泛，比如定时发送邮件，定时清理日志等等，在持续集成中，可以定时的触发测试任务，比如希望在每天晚上下班时间执行自动化用例。本文通过介绍Linux cron定时来了解cron定时相关概念。



目录

- Linux Crontab 定时任务
  - [crond 服务](https://www.cnblogs.com/hiyong/p/15615536.html#crond-服务)
  - [crontab相关文件](https://www.cnblogs.com/hiyong/p/15615536.html#crontab相关文件)
  - [cron表达式](https://www.cnblogs.com/hiyong/p/15615536.html#cron表达式)
  - [crontab命令](https://www.cnblogs.com/hiyong/p/15615536.html#crontab命令)
  - [crontab定时示例](https://www.cnblogs.com/hiyong/p/15615536.html#crontab定时示例)
- Linux anacron 定时任务
  - [anacron命令](https://www.cnblogs.com/hiyong/p/15615536.html#anacron命令)
  - [anacron执行过程](https://www.cnblogs.com/hiyong/p/15615536.html#anacron执行过程)
- cron表达式应用
  - [Jenkins定时构建](https://www.cnblogs.com/hiyong/p/15615536.html#jenkins定时构建)



### Linux Crontab 定时任务

cron来源于希腊语chronos，意思是时间。在类Unix的操作系统中，可以使用cron 服务器来实现定时执行任务。crontab文件存放cron指令，执行周期命令的守护进程crond负责激活这些任务，定期检查是否有任务执行。

#### crond 服务

crond 服务是用来执行周期任务或等待处理某些事件的一个守护进程，crontab 命令需要 crond 服务支持。centos7中一般是默认安装的，可以使用 `rpm` 命令查看是否安装：

```bash
$ rpm -qa | grep crontab
crontabs-1.11-6.20121102git.el7.noarch
```

查看crond 服务状态：

```bash
# centos7
systemctl status crond.service 

# centos6
service crond status
```

启动crond 服务：

```bash
# centos7
systemctl start  crond.service

# centos6
service crond start
```

停止crond 服务：

```bash
# centos7
systemctl stop  crond.service

# centos6
service crond stop
```

重启crond 服务：

```bash
# centos7
systemctl restart  crond.service

# centos6
service crond restart
```

重载crond 服务：

```bash
# centos7
systemctl reload  crond.service

# centos6
service crond reload
```

#### crontab相关文件

cron 服务主要包括以下文件目录：

- `/var/spool/cron`：用户定义的crontab文件存放目录
- `/etc/cron.d`：存放要执行的crontab文件或脚本
- `/etc/crontab`：系统任务调度的配置文件
- `/etc/anacrontab`：anacron配置文件
- `/etc/cron.deny`：列出不允许使用crontab命令的用户
- `/etc/cron.daily`：每天执行一次的脚本
- `/etc/cron.hourly`：每小时执行一次的脚本
- `/etc/cron.monthly`：每月执行一次的脚本
- `/etc/cron.weekly`：每星期执行一次的脚本

`/etc/crontab`文件负责管理和维护任务：

```bash
$ cat /etc/crontab
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root

# For details see man 4 crontabs

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed
```

其中：

- `SHELL`变量指定系统使用的shell版本
- `PATH`指定系统执行命令的路径
- `MAILTO`指定邮件发送的用户，如果为root，邮件会发送到`/var/spool/mail/root`文件中

#### cron表达式

用户定义的crontab文件保存在 `/var/spool/cron` 目录中，每个crontab任务以创建者的名字命名。crontab文件中每一行都代表一项任务，每条命令包括6个字段，前5个代表时间，第6个字段是要执行的命令。

五颗星：`* * * * *`

- 第1颗星：分钟 minute，取值 0~59；
- 第2颗星：小时 hour，取值 0~23；
- 第3颗星：天 day，取值 1~31；
- 第4颗星：月 month，取值 1~12；
- 第5颗星：星期 week，取值 0~7，0 和 7 都表示星期天。

可以使用4种操作符：

- `*` ：当前代表的所有取值范围内的数字
- `/`：需要间隔的数字
- `-`：某个区间，比如1-3表示1, 2, 3
- `,`：分散的数字，可以不连续，比如1, 3, 5

下面举几个例子：

```sh
# 每5分钟构建一次
H/5 * * * *

# 每2小时构建一次
H H/2 * * *

# 每天8点到22点，每2小时构建一次
H 8-22/2 * * *

# 每天8点，22点各构建一次
H 8,22 * * *
```

#### crontab命令

crontab 命令用来配置定时任务，语法如下：

```bash
crontab [options] file
crontab [options]
```

常用options：

- `-u <user>` ：定义用户
- `-e`：编辑 crontab表
- `-l`： 列出用户crontab表
- `-r`：删除用户crontab表
- `-i`：删除提示
- `-n <hostname>` 设置用户crontab主机名
- `-c`：获取运行用户crontab的主机名
- `-s`：selinux 上下文
- `-x <mask>` ：开启调试

#### crontab定时示例

先写一个用于采集CPU性能信息的脚本（cpu_Perf.sh）：

```bash
#!/bin/bash
mpstat -P ALL 1 2 >> /var/cron/perf.log
```

下面来添加一个定时任务：

执行 命令`crontab -e` ，输入下面的cron表达式，每分钟执行一次CPU性能采集脚本：

```bash
* * * * * /var/cron/cpu_Perf.sh
```

保存。命令保存到了 `/var/spool/cron/` 目录下的root文件中(当前用户为root)：

```bash
$ cat /var/spool/cron/root 
* * * * * /var/cron/cpu_Perf.sh
$ crontab -l
* * * * * /var/cron/cpu_Perf.sh
```

保存成功后，每一分钟就会执行一次脚本。

### Linux anacron 定时任务

如果服务器关机或者无法运行任务，定时任务就不会执行，服务器恢复后，定时任务不会执行没有执行的定时任务。这种场景下可以使用anacron命令，它与crond功能相同，增加了执行被跳过任务的功能。一旦服务器启动，anacron就会检查配置的定时任务是否错过了上一次执行，如果有，将立即运行这个任务，且只运行一次(不管错过了多少个周期)。

也就是说， anacron 是用来保证由于系统原因导致错过的定时任务可以在系统正常后执行的服务。

#### anacron命令

可以使用 anacron 命令来管理 anacron 服务，语法格式如下：

```bash
anacron [options] [job] ...
anacron -T [-t anacrontab-file]
```

options选项：

- `-s`：串行调用任务
- `-f`：强制执行任务，忽略设置的周期
- `-n`：没有delay执行任务，隐含调用了`-s`参数
- `-d`：把信息输出到标准输出设备和系统日志中
- `-q`：禁止向标准输出发送消息，只能和-d选项配合使用。
- `-u`：更新时间戳但不执行任务
- `-V`：打印版本信息
- `-h`：打印帮助信息
- `-t <file>` ：使用指定的配置文件，忽略默认的/etc/anacrontab文件。
- `-T`：Anacrontab测试
- `-S <dir>`：指定存放timestamp文件的路径

`job` 是 `/etc/anacrontab` 文件中定义的工作名 job-identifier

#### anacron执行过程

下面来介绍一下anacron的执行过程：

1、根据脚本需要执行的频率，将脚本安装到`/etc/cron.[hourly|daily|weekly|monthly]` 目录中：

```bash
/etc/cron.hourly
/etc/cron.daily
/etc/cron.monthly
/etc/cron.weekly
```

2、crond 服务会执行`/etc/cron.d/0hourly` 中指定的cron 任务，

```bash
$ cat /etc/cron.d/0hourly
# Run the hourly jobs
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
01 * * * * root run-parts /etc/cron.hourly
```

每小时运行一次 **run-parts** 程序，而 **run-parts** 程序执行 `/etc/cron.hourly` 中的所有的shell脚本。

`/etc/cron.hourly` 目录中包含 `0anacron` 脚本：

```bash
$ ls /etc/cron.hourly
0anacron  mcelog.cron
```

3、 `0anacron` 脚本通过 `/etc/anacrontab` 配置文件来运行anacron程序。

```bash
$ cat /etc/anacrontab
# /etc/anacrontab: configuration file for anacron

# See anacron(8) and anacrontab(5) for details.

SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
# the maximal random delay added to the base delay of the jobs
RANDOM_DELAY=45
# the jobs will be started during the following hours only
START_HOURS_RANGE=3-22

#period in days   delay in minutes   job-identifier   command
1       5       cron.daily              nice run-parts /etc/cron.daily
7       25      cron.weekly             nice run-parts /etc/cron.weekly
@monthly 45     cron.monthly            nice run-parts /etc/cron.monthly
```

- `RANDOM_DELAY=45` ：表示最大随机延迟时间为45分钟。
- `START_HOURS_RANGE=3-22` : 执行的时间范围为03:00—22:00

`/etc/anacrontab` 配置文件执行`cron.[daily|weekly|monthly]` 目录中的可执行文件。

anacron的监测周期为每天、每周和每月，每天执行一次`/etc/cron.daily` 目录中的程序，每周执行一次 `/etc/cron.weekly` 中的程序，每月执行一次 `/etc/cron.monthly` 中的程序。

anacron不能在指定某个时间运行某个程序，它的设计目的是在特定的时间间隔运行某个程序，例如每天，每周日或者每月第一天的03:00运行某个程序。如果因为某种原因（关机或者服务器异常）没有执行，anacron会在服务器正常后运行一次错过的执行。

那么，anacron 是如何判断这些定时任务错过了执行呢？

其实是通过读取上次执行 anacron 的时间记录文件，通过两个时间的差值判断是否超过指定间隔时间（1天、1周和1月）。

`/var/spool/anacron/` 目录中的 `cron.[daily|weekly|monthly]` 文件记录了上一次执行 cron任务 的时间：

```bash
$ ls /var/spool/anacron/
cron.daily  cron.monthly  cron.weekly
$ cat /var/spool/anacron/cron.daily
20211123
```

### cron表达式应用

前面介绍了在Linux中通常用 crond 服务来实现任务定时执行，在很多场景都会用到定时任务，比如定时提醒，定时发送邮件等。比如python中可以使用[APScheduler](https://github.com/agronholm/apscheduler)库执行定时任务，Java可以使用Quartz框架实现，Go语言使用 [github.com/robfig/cron](https://github.com/robfig/cron) 包。

在持续测试平台Jenkins中经常会配置定时执行任务，下面简单介绍一下Jenkins定时构建配置方法。

### Jenkins定时构建

在配置Jenkins任务时，构建定时任务主要有两种形式：

- 一种是配置周期触发（Build periodically），在特定时间进行自动触发测试流程。
- 第二种是Poll SCM：定时检查源码变更，如果有更新就checkout新的代码下来，然后执行构建动作。

在【Build Triggers】中选择 Build periodically 或者 Poll SCM

![](D:\AboutIT\笔记\2229336-20211128161716417-325787681.png)

在Schedule中输入cron表达式来配置定时任务。

Jenkins也可以创建多个定时，比如在每个工作日的9:30和每周五22:30构建：

```sh
30 9 * * 1-5
30 22 * * 5
```

### Linux定时删除日志文件

编写删除文件的shell脚本

crontab -l

- l：显示当前用户所有的定时任务机

- e：使用vim编辑当前用户的定时任务，一行一个定时任务

- r：删除当前用户的定时任务

  使用crontab -e 进入编辑当前用户的定时任务编辑器