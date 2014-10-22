#!/bin/bash
installdir=`dirname "$0"`
installdir=`cd "$installdir"; pwd`
for file in `find ganglia/ -type f`
do 
	mkdir -p /etc/ganglia
	/bin/cp $file ${file#ganglia}
	echo "/bin/cp $file ${file#ganglia}"
done
cd /usr/lib64 && tar -zxvf ganglia.tar.gz
