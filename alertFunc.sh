#! /bin/bash
alert(){
  #usage :alert $? Object
  if [ $1 -ne 0 ];then
     echo "waring $2 failed" >&2
     exit 1
  else 
     echo "$2 succeed" >&2
  fi
}

chmod 744 exp.sh
alert $? exp
