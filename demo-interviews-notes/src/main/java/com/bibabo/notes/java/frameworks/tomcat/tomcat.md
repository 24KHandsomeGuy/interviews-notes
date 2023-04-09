配置jmx监控
CATALINA_PID=/data/tomcat-order-ws-8081/CATALINA_PID

CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote=true -Djava.rmi.server.hostname=10.254.128.106 -Dcom.sun.management.jmxremote.port=18888 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"