# hive-succinctly

docker run -d --name hive -h hive sixeyed/hive-succinctly

docker exec -it hive beeline
!connect jdbc:hive2://127.0.0.1:10000
...
!quit
