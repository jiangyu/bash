#!/bin/bash
for ((i=111;i<131;i++))
do
    printf "10.39.1.$i\ttest$i\n">>/etc/hosts
done
