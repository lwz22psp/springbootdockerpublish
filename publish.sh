#!/bin/sh
#切换路径
cd /root/github/springbootdemo/
#拉取最新代码
echo "git pull start"

git pull

echo "git pull finish"

#停用旧容器

echo "stop old docker"

docker stop springbootdocker

echo "remove old docker"

docker rm springbootdocker

echo "remove old image"
#删除旧镜像
docker image rm springboot/springbootdocker

echo "build new image"
#编译镜像
mvn package docker:build -DskipTests

echo "run new docker"
#挂载镜像到新容器中
docker run -d -p 8080:8080 --name springbootdocker  --network host springboot/springbootdocker 