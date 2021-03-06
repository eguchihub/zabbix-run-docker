#!/bin/bash

CNAME="mysql-server"
if  docker ps | grep $CNAME  ; then
	echo "docker container $CNAME is running. "
	echo "Please run 'docker rm $CNAME' if you should do that."
	exit
fi

docker run -v /tmp:/tmp --name mysql-server -t \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="zabbix" \
      -e MYSQL_PASSWORD="zabbix" \
      -e MYSQL_ROOT_PASSWORD="zabbix" \
      -d mysql:5.7 \
      --character-set-server=utf8 --collation-server=utf8_bin
