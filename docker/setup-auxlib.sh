service ssh start
$HADOOP_HOME/sbin/start-dfs.sh
sleep 30s

# copy aux libs for hiveserver2 & hbase:
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /hive/auxlib 
$HADOOP_HOME/bin/hdfs dfs -put /opt/hive/auxlib/* /hive/auxlib
$HADOOP_HOME/bin/hdfs dfs -chown -R root:root /hive/auxlib/