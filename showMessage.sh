#!/bin/bash

ipadd=$(/sbin/ifconfig eth0  | sed -n '/inet addr:/ s/inet addr://pg' | awk -F" " '{print $1}')
mac=$(/sbin/ifconfig eth0  | sed -n '/HWaddr/ s/^.*HWaddr *//pg') 
num=$(netstat -an |grep ":23" |grep "ESTABLISHED" | grep -cv "grep") 
date=$(date)

curl -d '[{"ipadd":"'"$ipadd"'", "mac": "'"$mac"'","num":"'"$num"'","date":"'"$date"'"}]' -H 'Content-Type: application/json'  http://127.0.0.1:5000/RouteMessage


