#!/bin/bash

CNAME="zabbix-server-mysql"
if  docker ps | grep $CNAME  ; then
	echo "docker container $CNAME is running. "
	echo "Please run 'docker rm $CNAME' if you should do that."
	exit
fi

docker run -v /tmp:/tmp --name zabbix-server-mysql -t \
      -e DB_SERVER_HOST="mysql-server" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="zabbix" \
      -e ZBX_JAVAGATEWAY="zabbix-java-gateway" \
      --link mysql-server:mysql \
      --link zabbix-java-gateway:zabbix-java-gateway \
      -p 10051:10051 \
      -d zabbix/zabbix-server-mysql:latest
