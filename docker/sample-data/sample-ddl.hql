
--create server_logs over HDFS, correct format:
create external table server_logs (
serverid string, loggedat bigint,
loglevel string, message string)
row format delimited
fields terminated by ','
stored as textfile
location '/server-logs';

--create server_logs over HDFS, bad format:
create external table server_logs_orc (
serverid string, loggedat bigint,
loglevel string, message string)
stored as ORC
location '/server-logs';

create external table server_logs_compressed (
serverid string, loggedat bigint,
loglevel string, message string)
row format delimited
fields terminated by ','
stored as textfile
location '/server-logs-compressed';

create table temp(v1 string, v2 string, v3 string)
row format delimited
fields terminated by '.'
escaped by '~'
lines terminated by '\n'
stored as textfile;

create external table server_metrics(serverId string, recordedAt timestamp, cpuPc decimal(3,1), memoryPc decimal(3,1), storagePc decimal(3,1))
row format delimited
fields terminated by '\011'
escaped by '~'
lines terminated by '\n'
stored as textfile
location '/server-metrics';


CREATE EXTERNAL TABLE hbase_table(rowkey STRING)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key')
TBLPROPERTIES ('hbase.table.name' = 'hbase-table');


CREATE EXTERNAL TABLE hbase_table(rowkey STRING, cf1_data STRING) STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key,cf1:data') TBLPROPERTIES ('hbase.table.name' = 'hbase-table');