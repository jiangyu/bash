#!/bin/bash
declare BASE='/usr/home/jiangyu2'
declare NN='10.39.1.111'
declare JT='10.39.1.112'

mkdir $BASE/hadoop
rsync 10.39.1.61::testResult/hadoop-1.0.0.tar.gz $BASE/hadoop/
cd $BASE/hadoop
tar -zxf hadoop-1.0.0.tar.gz
rsync -r 10.39.1.61::testResult/conf $BASE/hadoop/hadoop-1.0.0/
mkdir -p $BASE/runtime/name
mkdir $BASE/runtime/data
mkdir $BASE/runtime/logs
mkdir $BASE/runtime/mapred
chown -R jiangyu2:jiangyu2 $BASE/hadoop
chown -R jiangyu2:jiangyu2 $BASE/runtime

#IP=`su - jiangyu2 -c 'ifconfig eth1|grep Bcast|cut -d":" -f2|cut -d" " -f1'`
#if [ "$IP" = "$NN" ];then
#   su - jiangyu2 -c "$BASE/hadoop/hadoop-1.0.0/bin/hadoop namenode -format"
#   sleep 1
#   su - jiangyu2 -c "$BASE/hadoop/hadoop-1.0.0/bin/hadoop-daemon.sh start namenode"
#elif [ "$IP" = "$JT" ];then
#   su - jiangyu2 -c "$BASE/hadoop/hadoop-1.0.0/bin/hadoop-daemon.sh start jobtracker"
#else
#   sleep 2
#   su -jiangyu2 -c "$BASE/hadoop/hadoop-1.0.0./bin/hadoop-daemon.sh start datanode"
#   su -jiangyu2 -c "$BASE/hadoop/hadoop-1.0.0./bin/hadoop-daemon.sh start tasktracker"
#fi

