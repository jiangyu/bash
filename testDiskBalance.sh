#!/bin/bash
su - hadoop -c "hadoop-daemon.sh stop datanode"
sleep 2
dest=`du /data1/hadoop/dfs/data/current/sub* |sort -n -k1 |head -n1|cut -f2`
src=`find  /data0/hadoop/dfs/data/current/subdir* -type f |tr "\/" " "|cut -d " " -f7|uniq|xargs -I folder du /data0/hadoop/dfs/data/current/folder|sort -r -n|head -n1 |cut -f2`
echo "destnation folder is $dest"
echo "source folder is $src"
find $src -type f |xargs -I file cp file $dest
find $src -type f |xargs rm -rf 
chown -R hadoop:hadoop dest
su - hadoop -c "hadoop-daemon.sh start datanode"
