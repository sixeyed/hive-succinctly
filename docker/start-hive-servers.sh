#Hadoop
service ssh start
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

#Hive web interface
#$HIVE_HOME/bin/hive --service hwi > /dev/null 2> /dev/null &

# HiverServer2 - JDBC
$HIVE_HOME/bin/hive --service hiveserver2 &

# HCatalog
#TODO $HIVE_HOME/hcatalog/sbin/hcat_server.sh

# Templeton
$HIVE_HOME/hcatalog/sbin/webhcat_server.sh foreground