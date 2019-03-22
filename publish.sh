#!/bin/sh
#切换路径
cd /root/github/springbootdemo/
#拉取最新代码
git pull
#停用旧容器
docker stop springbootdocker
docker rm springbootdocker
#删除旧镜像
docker image rm springboot/springbootdocker
#编译镜像
mvn package docker:build
#挂载镜像到新容器中
docker run -d -p 8080:8080 --name springbootdocker springboot/springbootdocker