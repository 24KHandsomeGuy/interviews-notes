

#### 查看磁盘剩余空间

```shell
df -h
du -h *
```

#### 查看文件夹磁盘空间

```shell
du -h
```

#### 大文件拆解

先做文件拆解

```shell
cat java_pid10675.hprof  | split -b 500M - java_pid10675-.hprof
```

#### 压缩文件

```shell
yum install zip
zip z.zip java_pid10675.hprof 
```

```shell
tar -cvf java_pid10675.hprof.tar java_pid10675.hprof 
```

```shell
gzip -c b.txt > b.txt.gz
```

tar是打包、zip、gzip是压缩



#### tomcat成功启动，但无法监听端口

先排查catalina日志

查看端口

```
netstat -ntlp
netstat -anp | grep 8085
```

```
tcp        1      0 ::ffff:10.254.128.108:8085  ::ffff:10.254.128.113:81    CLOSE_WAIT  3156/java           
tcp        1      0 ::ffff:10.254.128.108:8085  ::ffff:10.254.128.113:80    CLOSE_WAIT  3156/java
```

8085端口已经被3156占用

查看端口所属进程id

```
sudo lsof -i:8085
```

重启3156java进程，让出8085端口



### Java

java -version

source /etc/profile

jmap -heap 10675 查看堆内存情况



### 新建一台机器

登录目标服务器
1.添加用户：useradd jenkins 设置密码：passwd jenkins  密码：jenkins
2.创建路径用于接收jenkins211服务器发送过来的编译好的新版本jar包
  用户cd /home/jenkins 创建mkdir chunbo-cs-dubbo
  修改目录所属用户，群组  chown -R jenkins:jenkins chunbo-cs-dubbo 说明 chown(改变所属） -R(递归) 所属用户：所属群组目录
3.用于将2移动到此路径下
  创建 projects目录 mkdir /projects
  chown -R jenkins:jenkins projects
4.将配置好tomcat rz到目标服务器/data目录
  rz
5.会将3软链至/data/cs-dubbo-10880/webapps
  所以需要将cs-dubbo-10880文件授权读写权限
  chmod -R 777 cs-dubbo-10880

登录10.254.8.211
1.cd /data
  mkdir chunbo-cs-dubbo
  chown -R jenkins:jenkins chunbo-cs-dubbo
  切换到 jenkins用户 su - jenkins
  拷贝 ssh-copy-id jenkins@10.254.128.127 
  测试是否免密码登录： ssh  10.254.128.127 看是否需要输入密码
   如果部署失败，授权失败，则修改 root密码
   uat  root密码：   Chunb0@2o14
   prod  root密码： Chunb0@2o15888
2.复制一台jenkins，所需配置文件所需目录
  cd /var/lib/jenkins/workspace/
  mkdir -vp chunbo-cs-dubbo-prod-deploy/chunbo-cs-dubbo/src/main/resources/system-config
  chown -R jenkins:jenkins chunbo-cs-dubbo-prod-deploy