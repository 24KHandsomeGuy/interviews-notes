
可以在项目中配置，也可以使用maven setting文件全局配置
```xml

    <repositories>
        <repository>
            <id>central</id>
            <name>central-mirror</name>
            <url>http://nexus.chunbo.com/nexus/content/groups/public/</url>
        </repository>
    </repositories>

```

deploy发布到哪里
```xml
<distributionManagement>
        <repository>
            <id>releases</id>
            <url>http://nexus.chunbo.com/nexus/content/repositories/releases/</url>
        </repository>
        <snapshotRepository>
            <id>snapshots</id>
            <url>http://nexus.chunbo.com/nexus/content/repositories/snapshots/</url>
        </snapshotRepository>
    </distributionManagement>
```