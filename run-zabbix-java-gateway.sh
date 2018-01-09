#!/bin/bash

CNAME="zabbix-java-gateway"
if  docker ps | grep $CNAME  ; then
	echo "docker container $CNAME is running. "
	echo "Please run 'docker rm $CNAME' if you should do that."
	exit
fi

docker run -v /tmp:/tmp --name zabbix-java-gateway -t \
      -d zabbix/zabbix-java-gateway:latest

