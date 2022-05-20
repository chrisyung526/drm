## 初始化代码
数据库执行sql脚本： init/tcc_drm_dev.sql
## drm-admin-service(数字资源管理 MMIS|HKMP)
> /admin前缀为后台管理端接口(B端)

> /client-api前缀为用户门户端接口(C端)

> /open-api前缀为开放接口

## 分环境打包
### local
> mvn clean package -P local -DskipTests
### dev
> mvn clean package -P dev -DskipTests
### test
> mvn clean package -P test -DskipTests
### prod
> mvn clean package -P prod -DskipTests

#MySQL 数据删除标识
>is_delete=1 正常数据
>is_delete=0 删除数据

# jdk17启动要添加一下两个参数
--add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/sun.net.util=ALL-UNNAMED

# 代码相关
接口需要编写junit测试