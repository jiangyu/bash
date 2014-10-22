#!/bin/bash
# 202.106.184.253 219.142.118.199 219.142.78.199
# author:jiangyu housong
# usage:just type the static password and dynamic password and the machine name

declare STATIC
STATIC=jiang19841955
declare DYNAMIC
declare MACHINE

# the gateway IP
declare IP 
IP=202.106.182.212

# your name please
declare USER 
USER=jiangyu2
declare COMMAND="1"
#USER=fengchao
# please paste the password the mail told u
declare PASSWORD  
PASSWORD=xOefbK44bpYfI4TK8A5Vy4Qqe5oQEnmv1NzfLhBHdiiU3iivRnh7eQxGdZ6SEWkHT
#PASSWORD=6im4+Rba0PBk+sZD/XzN35tSDiZ8954+qzgqR0k2rnG869oSPprBGUJksV3boctqo
function tiao {
    echo $COMMAND
    aliasName=`cat /etc/hosts |grep "$MACHINE$" |cut -f1`
    if [ "$aliasName" != "" ];then
       MACHINE=$aliasName
    fi
    expect -c "
      set timeout 10
      spawn ssh "$USER@$IP"
      expect {
         (yes/no)? {
         send yes\r
         exp_continue
         } *assword: {
         send $PASSWORD\r
         exp_continue
         } PASSCODE: {
         send $STATIC$DYNAMIC\r
         exp_continue
         } Enter* {
	 send $COMMAND\r
	 exp_continue
	 } exit* {
         send $MACHINE\r
         interact
         } eof {
         exit
         }
    }"
}


function get_pass {
   stty -echo
   #read -p "Enter the static password:" STATIC
   #printf "\n"
   read -p "Enter the dynamic password:" DYNAMIC
   stty echo   
   printf "\n"
   read -p "Enter the machine name(IP):" MACHINE
   printf "\n"
   tiao
}

get_pass
