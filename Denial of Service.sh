#!/bin/bash
web_log=/application/access.log

awk '{i[$1]++}END{for (IP in i) print IP,i[IP]}' $web_log|awk '$2>1000 {print $1,$2}'|column -t|sort -rnk2 >/tmp/web_log.txt

IP=$(awk '{i[$1]++}END{for (IP in i) print IP,i[IP]}' $web_log |awk '$2>1000{print $1}')

 echo "超过并发连接数IP"

 cat /tmp/web_log.txt

for i in $IP

  do

 iptables -I INPUT -s $i -j DROP

done
