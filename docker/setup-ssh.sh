#passphrase-less ssh:
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/config

#mapreduce
service ssh start
/opt/hadoop/bin/hdfs namenode -format

$HADOOP_HOME/sbin/start-dfs.sh

/opt/hadoop/bin/hdfs dfs -mkdir -p /tmp
/opt/hadoop/bin/hdfs dfs -mkdir -p /user/root
/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hive/warehouse
/opt/hadoop/bin/hdfs dfs -chmod g+w /tmp
/opt/hadoop/bin/hdfs dfs -chmod g+w /user/root
/opt/hadoop/bin/hdfs dfs -chmod g+w /user/hive/warehouse