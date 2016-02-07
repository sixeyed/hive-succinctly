#! /bin/bash

service ssh start
$HADOOP_HOME/etc/hadoop/hadoop-env.sh
$HADOOP_HOME/sbin/start-dfs.sh

$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/hive/warehouse
$HADOOP_HOME/bin/hdfs dfs -chmod g+w /user/hive/warehouse

$HADOOP_HOME/sbin/stop-dfs.sh