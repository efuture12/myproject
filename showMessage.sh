#!/bin/bash
OUTPUT=/usr/local/test/show.csv
echo $(/sbin/ifconfig eth0  | sed -n '/inet addr:/s/inet addr://pg' | awk -F " " '{print $1}';echo ',';/sbin/ifconfig eth0  | sed -n '/HWaddr/s/^.*HWaddr *//pg';echo ',';netstat -an |grep ":23" |grep "ESTABLISHED"| grep -cv "grep";echo ',';date) >$OUTPUT 
#/sbin/ifconfig eth0  | sed -n '/inet addr:/ s/inet addr://pg' | awk -F" " '{print $1}' > $OUTPUT   
#/sbin/ifconfig eth0  | sed -n '/HWaddr/ s/^.*HWaddr *//pg' >> $OUTPUT
#netstat -an |grep ":23" |grep "ESTABLISHED" | grep -cv "grep" >> $OUTPUT 
#date >>  $OUTPUT
#scp -r   root@172.17.9.190:/usr/local/test.img  .
