在idea tomcat 中server的配置里，
有个on frame deactivation，选择update classes and resources。
　　这是由于服务器添加的Artifact类型问题，一般一个module对应两种类型的Artifact，一种是war，一种是war explored。
　　war就是已war包形式发布，当前项目是这种形式，在这种形式下on frame deactivation配置没有update classes and resources选项。war explored是发布文件目录，选择这 种形式，on frame deactivation中就出现update classes and resources选项了。