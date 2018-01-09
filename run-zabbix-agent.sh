#!/bin/bash

CNAME="zabbix-agent"
if  docker ps | grep $CNAME  ; then
	echo "docker container $CNAME is running. "
	echo "Please run 'docker rm $CNAME' if you should do that."
	exit
fi

docker run --name zabbix-agent \
           --link zabbix-server-mysql:zabbix-server \
           -d zabbix/zabbix-agent:latest
