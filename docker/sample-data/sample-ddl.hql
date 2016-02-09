
create table dual (col string);
insert into dual(col) values('');

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

CREATE EXTERNAL TABLE hbase_table(rowkey STRING, cf1_data STRING) 
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' 
WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key,cf1:data') 
TBLPROPERTIES ('hbase.table.name' = 'hbase-table');

create index ix_hbase_table_cf1_data on table hbase_table (cf1_data) as 'COMPACT' with deferred rebuild;

CREATE EXTERNAL TABLE device_events(rowkey STRING, eventName STRING, receivedAt STRING, payload STRING, metadata MAP<string, string>)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key,e:n,e:t,e:p,m:')
TBLPROPERTIES ('hbase.table.name' = 'device-events');


CREATE VIEW device_events_period(rowkey, deviceId, period, eventname, receivedat) AS
SELECT rowkey, split(rowkey, '\\|')[0], split(ROWKEY, '\\|')[1], eventname, receivedat FROM device_events;


create index ix_device_events_period on table device_events (split(ROWKEY, '\\|')[1]) as 'BITMAP' with deferred rebuild;

create table syslogs(loggedat timestamp, host string, process string, pid int, message string) stored as ORC;

create table syslog_summaries(processedat timestamp, host string, entries int) stored as ORC;

create temporary table etl_progress(status string, stage string, processedat timestamp, rowcount bigint);

ALTER VIEW device_events_period AS SELECT split(rowkey, '\\|')[0] deviceid, split(ROWKEY, '\\|')[1] period, eventname, receivedat FROM device_events WHERE split(ROWKEY, '\\|')[1] is not null;

create table syslogs_acid (host string, loggedat timestamp, process string, pid int, message string, hotspot boolean) clustered by(host) into 4 buckets stored as ORC tblproperties ("transactional" = "true");


#syslogs variants

create table syslogs_flat (entry string);

create table syslogs_no_partitions(period string, host string, loggedat timestamp, process string, pid int, message string) stored as ORC;

create table syslogs_with_partitions(loggedat timestamp, process string, pid int, message string) partitioned by (period string, host string) stored as ORC;

#servers- collection ite,s
create external table servers
(name string, ipAddresses array<string>, hardware struct<cores:int, ram:int, disk:int>, site map<string, string>)
row format delimited
fields terminated by ','
collection items terminated by ':'
map keys terminated by '='
lines terminated by '\n'
stored as textfile
location '/servers';


add jar /tmp/json-serde-1.3.7-jar-with-dependencies.jar

create external table devices
(device struct<deviceClass:string, codeName:string, 
firmwareVersions: array<string>, cpu:struct<speed:int, cores:int>>)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
location '/devices';