create database service_backend;
create database portal_backend;
create database portal_web;

GRANT ALL PRIVILEGES ON service_backend.* TO root@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON portal_backend.* TO root@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON portal_web.* TO root@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;

FLUSH PRIVILEGES;

create user dbsuser01 identified by 'dbsuser01';
GRANT ALL PRIVILEGES ON service_backend.* TO dbsuser01@'%.%.%.%' IDENTIFIED BY 'dbsuser01' WITH GRANT OPTION;

create user dbsuser02 identified by 'dbsuser02';
GRANT ALL PRIVILEGES ON portal_backend.* TO dbsuser02@'%.%.%.%' IDENTIFIED BY 'dbsuser02' WITH GRANT OPTION;

create user dbsuser03 identified by 'dbsuser03';
GRANT ALL PRIVILEGES ON portal_web.* TO dbsuser03@'%.%.%.%' IDENTIFIED BY 'dbsuser03' WITH GRANT OPTION;

FLUSH PRIVILEGES;
