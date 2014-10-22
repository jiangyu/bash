#!/bin/bash
cd /usr/local/
rsync 10.39.2.121::shellResult/call* ./
tar -zxf calligraphus.tgz
tar -zxf calligraphus_conf.tgz
rm -rf call*.tgz
rm -rf calligraphus.conf
mkdir /service/calligraphus
cd /service/calligraphus
rsync 10.39.2.121::shellResult/run ./
chmod u+x run
mkdir /data2/calligraphusdata
chown -R scribe:scribe /data2/calligraphusdata
cd /usr/local && ln -s calligraphus calligraphus-release
svc -u /service/calligraphus
