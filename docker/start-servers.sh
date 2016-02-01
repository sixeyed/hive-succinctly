# Hadoop
service ssh start
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
sleep 30s

# HiverServer2 - JDBC
$HIVE_HOME/bin/hive --service hiveserver2 &

# HCatalog
#TODO $HIVE_HOME/hcatalog/sbin/hcat_server.sh

# Templeton
$HIVE_HOME/hcatalog/sbin/webhcat_server.sh foreground

