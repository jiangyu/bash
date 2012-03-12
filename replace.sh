#! /bin/bash
while read line
do
if grep "sessionTimeOut = conf.getInt(\"zookeeper.session.timeout\", 180000);" $line
then
echo $line match
sed 's/sessionTimeOut = conf.getInt("zookeeper.session.timeout", 180000);/caonidaye/' $line > tmp
cp tmp $line
fi
done< <(find . -name '*.java')
rm -rf rmp
