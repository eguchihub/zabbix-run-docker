#!/bin/bash

RDB="run-mysql.sh"
JGW="run-zabbix-java-gateway.sh"
ZBX="run-zabbix-server.sh"
WEB="run-nginx.sh"
AGT="run-zabbix-agent.sh"

for i in $RDB $JGW $ZBX $WEB $AGT
do

sh $i
sleep 1

done

docker ps
