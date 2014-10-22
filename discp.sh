#!/bin/bash
while read line
do
  grep "MISSING">line
done <miss
cat line |
  while IFS=: read add env
  do
     echo $add 
     hadoop rm -rf $add
     hadoop distcp hftp://10.39.0.254:50070$add $add &
  done
