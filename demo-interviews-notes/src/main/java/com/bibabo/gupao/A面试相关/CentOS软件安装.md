CentOs7+

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





