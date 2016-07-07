!/bin/bash
cd /Percona-Server-5.6.24
./bin/mysqld_safe --defaults-file=/Percona-Server-5.6.24/my.cnf

# create user and databases
./bin/mysql -u root --socket=/Percona-Server-5.6.24/mysqld-39316.sock < ./createDB.sql
./bin/mysql -h localhost -u root --socket=/Percona-Server-5.6.24/mysqld-39316.sock < ./service_backend.sql
./bin/mysql -h localhost -u root --socket=/Percona-Server-5.6.24/mysqld-39316.sock < ./portal_backend.sql
./bin/mysql -h localhost -u root --socket=/Percona-Server-5.6.24/mysqld-39316.sock < ./portal_web.sql
