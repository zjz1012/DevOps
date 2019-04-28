#!/bin/bash
mysqldump -uusername -ppassword DatabaseName | gzip > /home/dbback/DatabaseName_$(date +%Y%m%d_%H%M%S).sql.gz
#把 username 替换为实际的用户名； 
#把 password 替换为实际的密码； 
#把 DatabaseName 替换为实际的数据库名；
