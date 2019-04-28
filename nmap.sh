#!/bin/sh
#
[ -f /etc/init.d/functions ] && . /etc/init.d/functions
function IP_count(){
  for n in 10.0.0.{0..255}
   do
    IP_check=`nmap -sP $n|grep "Host is up"|wc -l`
    if [ ${IP_check} -eq 1 ];then
      action "$n" /bin/true
      let i+=1
    fi
  done
}
function main(){
  IP_count
  echo "The total number of online IP Addresses is " $i
}
main
