#只检查服务vsftpd httpd sshd crond、mysql中任意一个服务的状态
#如果不是这5个中的服务，就提示用户能够检查的服务名并退出脚本
#如果服务是运行着的就输出 "服务名 is running"
#如果服务没有运行就启动服务
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
