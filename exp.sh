#!/bin/bash
# author:jiangyu
# usage:just type the username and password 
# in cluster you want to connect all
declare PASSWORD
declare USER

function exp {
   expect -c " 
     set timeout 10
     spawn $1 
     expect {
        (yes/no)?  {
        send yes\r
        exp_continue
        } *assword:  {
        send $PASSWORD\r 
        exp_continue
        } eof {
        exit
        }
    }"
}


function create_newkey {
   rm -rf /home/$USER/.ssh
   expect -c "
     set timeout 10
     spawn ssh-keygen -t rsa
     expect {
        id_rsa) {
         send \r
         exp_continue
        } passphrase) {
         send \r
         exp_continue
        } again: {
         send \r
         interact
        }
    }
   "
   touch /home/$USER/.ssh/authorized_keys
   chmod 600 /home/$USER/.ssh/authorized_keys
   cat /home/$USER/.ssh/id_rsa.pub>>~/.ssh/authorized_keys
}


function transfer {
   while read IP
   do
     exp "scp -r /home/$USER/.ssh $IP:~/" 
   done<machine
}

function get_pass {
   read -p "Enter the user:" USER
   stty -echo
   read -p "Enter the password:" PASSWORD
   printf "\n"
   read -p "Enter again:" PASSWORD1
   stty echo   
   printf "\n"
   if [ "$PASSWORD" != "$PASSWORD1" ];then
      echo "password inconsistent"
      exit 1
   else
      create_newkey
      transfer
      ssh-add /home/$USER/.ssh/id_rsa
   fi
}

get_pass
