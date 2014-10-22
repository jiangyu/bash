#!/bin/bash
/bin/mkdir -p /data0/hadoop/dfs/name
/bin/mkdir -p /data0/hadoop/log
/bin/mkdir -p /data0/hadoop/local
/bin/mkdir -p /data0/hadoop/pid
/bin/mkdir -p /data0/hadoop/metrics
/bin/mkdir -p /data0/hadoop/dfs/data /data1/hadoop/dfs/data /data2/hadoop/dfs/data /data3/hadoop/dfs/data /data4/hadoop/dfs/data /data5/hadoop/dfs/data /data6/hadoop/dfs/data /data7/hadoop/dfs/data /data8/hadoop/dfs/data /data9/hadoop/dfs/data /data10/hadoop/dfs/data /data11/hadoop/dfs/data
/bin/mkdir -p /data0/hadoop/local /data1/hadoop/local /data2/hadoop/local /data3/hadoop/local /data4/hadoop/local /data5/hadoop/local /data6/hadoop/local /data7/hadoop/local /data8/hadoop/local /data9/hadoop/local /data10/hadoop/local /data11/hadoop/local
/bin/chown -R hadoop:hadoop /data*/hadoop
/bin/chown -R hadoop:hadoop /usr/local/hadoop*
