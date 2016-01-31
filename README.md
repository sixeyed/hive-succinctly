# hive-succinctly

docker run -d -p 9999:9999 -p 8080:8080--name hive -h hive sixeyed/hive-succinctly

docker exec -it hive beeline -u jdbc:hive2://127.0.0.1:10000 -n root --verbose
...
!quit

## or with hbase:

docker-compose up -d