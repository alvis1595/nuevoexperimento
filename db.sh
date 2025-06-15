docker exec -it mysql-slave mysql -uroot -prootpass -e "STOP SLAVE;"
docker exec -it mysql-slave mysql -uroot -prootpass -e "DROP DATABASE testdb;"
docker exec -it mysql-slave mysql -uroot -prootpass -e "CREATE DATABASE testdb;"
docker exec mysql-master \
  mysqldump -uroot -prootpass testdb --master-data=2 > testdb_backup.sql
docker cp testdb_backup.sql mysql-slave:/testdb_backup.sql
docker exec -it mysql-slave \
  mysql -uroot -prootpass testdb < /testdb_backup.sql

Extraer log y posición
Del archivo testdb_backup.sql, busca:

[root@dbcontainer awx]# grep -- "CHANGE MASTER TO MASTER_LOG_FILE=" testdb_backup.sql
-- CHANGE MASTER TO MASTER_LOG_FILE='mysql-bin.000003', MASTER_LOG_POS=983192;

docker exec -it mysql-slave mysql -uroot -prootpass
CHANGE MASTER TO
  MASTER_HOST='mysql-master',
  MASTER_USER='replicador',
  MASTER_PASSWORD='replica123',
  MASTER_LOG_FILE='mysql-bin.000003',
  MASTER_LOG_POS=154;
  
START SLAVE;


SHOW SLAVE STATUS\G
