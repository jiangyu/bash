#!/bin/bash
in_old=`cat /proc/net/dev | grep eth1 |cut -d : -f2|awk '{print $1}'`
out_old=` cat /proc/net/dev | grep eth1 |cut -d : -f2|awk '{print $9}'`

while true
do
	sleep 1
	in=`cat /proc/net/dev | grep eth1 |cut -d : -f2|awk '{print $1}'`
	out=`cat /proc/net/dev | grep eth1 |cut -d : -f2|awk '{print $9}'`
	diff_in=$(($in-$in_old))
	diff_out=$(($out-$out_old))
	echo "IN MB/preS $(($diff_in/1024/1024))   OUT MB/perS $((diff_out/1024/1024))"
	in_old=$in
	out_old=$out
done
