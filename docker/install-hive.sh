#! /bin/bash

#pre-reqs
apt-get update

#hive 
wget --quiet http://mirrors.ukfast.co.uk/sites/ftp.apache.org/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz
tar xzf apache-hive-1.2.1-bin.tar.gz -C /opt/
ln -s /opt/apache-hive-1.2.1-bin /opt/hive
rm apache-hive-1.2.1-bin.tar.gz

#setup hive folders
service ssh start
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/hive/warehouse
$HADOOP_HOME/bin/hdfs dfs -chmod g+w /user/hive/warehouse

