#!/bin/bash

sed -i "s%port=39316%port=${PORT}%g" ${MYSQL_HOME}/my.cnf
sed -i "s%socket=.*%socket=${MYSQL_HOME}\/mysqld-${PORT}.sock%g" ${MYSQL_HOME}/my.cnf
sed -i "s%datadir=.*%datadir=${MYSQL_HOME}\/data%g" ${MYSQL_HOME}/my.cnf
sed -i "s%basedir=.*%basedir=${MYSQL_HOME}%g" ${MYSQL_HOME}/my.cnf
sed -i "s%log-bin=.*%log-bin=${MYSQL_HOME}\/mylog%g" ${MYSQL_HOME}/my.cnf
sed -i "s%pid-file=.*%pid-file=${MYSQL_HOME}\/mysql-${PORT}.pid%g" ${MYSQL_HOME}/my.cnf
sed -i "s%log-error=.*%log-error=${MYSQL_HOME}\/mysql-${PORT}.err%g" ${MYSQL_HOME}/my.cnf

${MYSQL_HOME}/bin/mysqld_safe --defaults-file=${MYSQL_HOME}/my.cnf --user=mysql &

doSql=true
while(true); do
  sleep 10s
  if $doSql; then
     ${MYSQL_HOME}/bin/mysqladmin password 123456 -u root --socket=${MYSQL_HOME}/mysqld-${PORT}.sock
     ${MYSQL_HOME}/bin/mysql -h localhost -u root -p123456 --socket=${MYSQL_HOME}/mysqld-${PORT}.sock<${MYSQL_HOME}/createDB.sql
     ${MYSQL_HOME}/bin/mysql -h localhost -u root -p123456 --socket=${MYSQL_HOME}/mysqld-${PORT}.sock<${MYSQL_HOME}/service_backend.sql
     ${MYSQL_HOME}/bin/mysql -h localhost -u root -p123456 --socket=${MYSQL_HOME}/mysqld-${PORT}.sock<${MYSQL_HOME}/portal_backend.sql
     ${MYSQL_HOME}/bin/mysql -h localhost -u root -p123456 --socket=${MYSQL_HOME}/mysqld-${PORT}.sock<${MYSQL_HOME}/portal_web.sql
     doSql=false
  fi
done

