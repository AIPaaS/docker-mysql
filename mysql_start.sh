#!/bin/bash

doSql=true

/Percona-Server-5.6.24/bin/mysqld_safe --defaults-file=/Percona-Server-5.6.24/my.cnf --log-error=/Percona-Server-5.6.24/mysql-39316.err &

while(true); do
  sleep 10s
  if $doSql; then
	/Percona-Server-5.6.24/bin/mysqladmin password 123456 -u root --socket=/Percona-Server-5.6.24/mysqld-39316.sock
	/Percona-Server-5.6.24/bin/mysql -h localhost -u root -p123456 --socket=/Percona-Server-5.6.24/mysqld-39316.sock</Percona-Server-5.6.24/createDB.sql
	/Percona-Server-5.6.24/bin/mysql -h localhost -u root -p123456 --socket=/Percona-Server-5.6.24/mysqld-39316.sock</Percona-Server-5.6.24/service_backend.sql
	/Percona-Server-5.6.24/bin/mysql -h localhost -u root -p123456 --socket=/Percona-Server-5.6.24/mysqld-39316.sock</Percona-Server-5.6.24/portal_backend.sql
	/Percona-Server-5.6.24/bin/mysql -h localhost -u root -p123456 --socket=/Percona-Server-5.6.24/mysqld-39316.sock</Percona-Server-5.6.24/portal_web.sql
	doSql=false
  fi
done

