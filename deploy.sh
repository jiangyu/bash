#!/bin/bash
# author : jiangyu
# date : 2011,3,12
# mail : jiangyu1211@gmail.com
# deploy the hadoop in environment, the script must accompany with the ./conf directory
# the masters in ./conf/master point to the masters of the cluster,though not that exactly meaning in hdfs
# the slaves in ./conf/slave point to the slaves of the cluster
#
# the exit code of 0 if nothing error happend, otherwise non zero will return
#
# Usage:
#      init : deploy the entire cluster,including namenode and datanodes
#      remove : remove all the environment of the cluster
#      conf : redeploy the ./conf directory only
#      start-all : start the hdfs cluster
#      stop-all : stop the hdfs cluster

declare IP
declare HDFS_PATH=~/
declare HDFS_V=hadoop-0.20.2+320


usage_and_exit()
{
    usage
    exit 1
}

usage()
{
    echo "Usage:init|remove|conf|start-all|stop-all"
}

init()
{
    while read IP
    do
        scp $HDFS_V.tar.gz $IP:$HDFS_PATH
        ssh -n $IP tar -zxf $HDFS_PATH/$HDFS_V.tar.gz
        scp -r ./conf $IP:$HDFS_PATH/$HDFS_V
    done<./conf/masters
    while read IP
    do
        scp $HDFS_V.tar.gz $IP:$HDFS_PATH
        ssh -n $IP tar -zxf $HDFS_PATH/$HDFS_V.tar.gz
        scp -r ./conf $IP:$HDFS_PATH/$HDFS_V
    done<./conf/slaves
}

stopall(){
   while read IP
   do
       ssh -n $IP $HDFS_PATH/$HDFS_V/bin/stop-all.sh
   done<./conf/masters
}

startall(){
   while read IP
   do
       ssh -n $IP $HDFS_PATH/$HDFS_V/bin/start-all.sh
   done<./conf/masters
}

remove(){
    stopall
    while read IP
    do
        ssh -n $IP rm -rf $HDFS_PATH/$HDFS_V
        ssh -n $IP rm -rf $HDFS_PATH/$HDFS_V.tar.gz
    done<./conf/masters
    while read IP
    do
        ssh -n $IP rm -rf $HDFS_PATH/$HDFS_V
        ssh -n $IP rm -rf $HDFS_PATH/$HDFS_V.tar.gz
    done<./conf/slaves
}

conf(){
    while read IP
    do
        scp -r ./conf $IP:$HDFS_PATH/$HDFS_V
    done<./conf/masters
    while read IP
    do
        scp -r ./conf $IP:$HDFS_PATH/$HDFS_V
    done<./conf/slaves
}

if [ $# -lt 1 ];then
    usage_and_exit
elif [ "$1" = "init" ];then
    init
elif [ "$1" = "remove" ];then
    remove
elif [ "$1" = "conf" ];then
    conf
elif [ "$1" = "start-all" ];then
    startall
elif [ "$1" = "stop-all" ];then
    stopall 
else
   usage_and_exit
fi
