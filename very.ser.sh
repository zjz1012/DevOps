#!/bin/bash
read -p "请输入你的服务名:" service
if [ $service != 'crond' -a $service != 'httpd' -a $service != 'sshd' -a $service != 'mysqld' -a $service != 'vsftpd' ];then
echo "只能够检查'vsftpd,httpd,crond,mysqld,sshd"
exit 5
fi
service $service status &> /dev/null

if [ $? -eq 0 ];thhen
echo "服务在线"
else
service $service start
fi
