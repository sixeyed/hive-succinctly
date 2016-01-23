
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