#!/bin/bash

service ssh start
$HADOOP_HOME/etc/hadoop/hadoop-env.sh
$HADOOP_HOME/sbin/start-dfs.sh

# copy aux libs for hiveserver2 & hbase:
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /hive/auxlib 
$HADOOP_HOME/bin/hdfs dfs -put /opt/hive/auxlib/* /hive/auxlib
$HADOOP_HOME/bin/hdfs dfs -chown -R root:root /hive/auxlib/

$HADOOP_HOME/sbin/stop-dfs.sh