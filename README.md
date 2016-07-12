# docker-mysql

使用了 Percona-Server-5.6.24-rel72.2-Linux.x86_64 版本，构建docker镜像。

默认端口：39316, 默认MYSQL_HOME路径：/Percona-Server-5.6.24 。

运行命令：
docker run -d --net=host -p 39316:39316 -e "PORT=39316" -e "MYSQL_HOME=/Percona-Server-5.6.24" percona:5.6.24
