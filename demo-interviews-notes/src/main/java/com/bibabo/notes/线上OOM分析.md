

### 2022.01.27下午1:47分

销售群里反馈，三方系统不可用

1.日志排查无结果，没有发现异常

2.查看pinpoint是否出现异常

![1643277118146](E:\ChunBo相关\笔记\1643277118146.png)

45s后发生OOM异常，导致程序执行FullGC，服务不可用

3.分析dump文件

找到setenv.sh或者cataout.sh配置的dump文件地址

```sh
CATALINA_PID=/data/thirdplatform-web-tomcat-8085/CATALINA_PID
#JAVA_OPTS="$JAVA_OPTS -Xms128m -Xmx1024m -XX:NewSize=32m -XX:MaxNewSize=128m -XX:SurvivorRatio=8 -XX:-HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/data/logs/javadump/supplier_ws_jvmdump.hprof"

CATALINA_OPTS="$CATALINA_OPTS -javaagent:/data/pinpointAgent/pinpoint-bootstrap-1.5.2.jar"
CATALINA_OPTS="$CATALINA_OPTS -Dpinpoint.agentId=third-web102546562"
CATALINA_OPTS="$CATALINA_OPTS -Dpinpoint.applicationName=third-web"
CATALINA_OPTS="$CATALINA_OPTS -Dpinpoint.applicationGroupName=oms"

JAVA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms2048m -Xmx2048m -XX:SurvivorRatio=8 -XX:PermSize=128m -XX:MaxPermSize=150m"
###Pls create oomdump directory under $TOMCAT_HOME/
JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$CATALINA_BASE/oomdump"
###Pls make sure the directory is exists
JAVA_OPTS="$JAVA_OPTS  -XX:+PrintGCDateStamps -XX:+PrintGCDetails -Xloggc:../gclog/gc.log "
```

4.把dump文件sz到本地

du -h * 3G

先压缩再sz

yum install zip

zip z.zip java_pid10675.hprof

sz z.zip

5.打开MAT

把MemoryAnalyzer.ini的-Xmx1024m改为8192m，否则打不开

把文件加载到MAT，会自动分析出报告

![1643278140617](E:\ChunBo相关\笔记\1643278140617.png)

内存2g，这个对象1.8g，就是他了，造成内存溢出

点击Leak suspects，排查泄漏嫌疑人

![1643279684781](E:\ChunBo相关\笔记\1643279684781.png)

点击查看树状图

![1643280178474](E:\ChunBo相关\笔记\1643280178474.png)

![1643280220975](E:\ChunBo相关\笔记\1643280220975.png)

1.9个G，char[]字符数组一共964707个，每个数组65552，60G

**See stacktrace**：查看堆栈跟踪

找到你认识的类 SalePlanController.java:1754，定位到这行代码

![1643279943182](E:\ChunBo相关\笔记\1643279943182.png)

![1643280071877](E:\ChunBo相关\笔记\1643280071877.png)

查看upload路径下，5400k，1.49分的excel肯定是可疑文件

![1643282992695](E:\ChunBo相关\笔记\1643282992695.png)

sz到本地，本地测试，仍旧出现OOM，但是这个excel具体有什么问题还真没看出来

总结：excel文件格式不规范，导入时创建百万大对象造成内存溢出