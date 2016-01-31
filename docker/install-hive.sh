#! /bin/bash

#hadoop pre-reqs
apt-get update
apt-get install -y ssh rsync

#hadoop 2.7.1
wget --quiet http://mirrors.ukfast.co.uk/sites/ftp.apache.org/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz
tar xzf hadoop-2.7.1.tar.gz -C /opt/
ln -s /opt/hadoop-2.7.1 /opt/hadoop
rm hadoop-2.7.1.tar.gz

#hive 
wget --quiet http://mirrors.ukfast.co.uk/sites/ftp.apache.org/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz
tar xzf apache-hive-1.2.1-bin.tar.gz -C /opt/
ln -s /opt/apache-hive-1.2.1-bin /opt/hive
rm apache-hive-1.2.1-bin.tar.gz

#setup hive folders
/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hive/warehouse
/opt/hadoop/bin/hdfs dfs -chmod g+w /tmp
/opt/hadoop/bin/hdfs dfs -chmod g+w /user/hive/warehouse