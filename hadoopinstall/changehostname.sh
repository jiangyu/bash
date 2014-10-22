#!/bin/bash
#get hostname (with domain and without domain)
hostname_l=`ifconfig  | grep "inet addr" | grep -v "inet addr:127.0.0.1" | sed -e 's=inet addr:\([^ ]*\)\( .*\)*=\1=' | sed -e 's=\([^.]*\)\.\([^.]*\)\.\([^.]*\)\.\([^.]*\)=mis\3\4.hadoop.data.sina.com.cn=' | head -1`
hostname_s=`echo $hostname_l | sed -e 's=\([^.]*\)\.\(.*\)=\1='` 

#change hostname file
sed -i 's/\(HOSTNAME=\)\(.*\)/\1'"$hostname_l"'/' /etc/sysconfig/network
hostname "$hostname_l"

