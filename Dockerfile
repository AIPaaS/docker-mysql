FROM centos:7

COPY Percona-Server-5.6.24-rel72.2-Linux.x86_64.tar /Percona-Server-5.6.24.tar
COPY libaio-0.3.107-10.el6.x86_64.rpm /libaio-0.3.107-10.el6.x86_64.rpm

RUN rpm -ivh libaio-0.3.107-10.el6.x86_64.rpm && cd / \
    && tar -xvf Percona-Server-5.6.24.tar && rm -rf Percona-Server-5.6.24.tar \
    && mv Percona-Server-5.6.24-rel72.2-Linux.x86_64 Percona-Server-5.6.24 \
    && chmod -Rf 755 Percona-Server-5.6.24 \
    && yum install perl -y \
    && yum install perl-Module-Install.noarch -y \
    && groupadd mysql \
    && useradd -r -g mysql -s /bin/bash mysql

RUN cd /Percona-Server-5.6.24 \
    && chown -Rf mysql:mysql /Percona-Server-5.6.24 \
    && scripts/mysql_install_db --basedir=/Percona-Server-5.6.24 --datadir=/Percona-Server-5.6.24/data --user=mysql 
COPY createDB.sql /Percona-Server-5.6.24/createDB.sql
COPY service_backend.sql /Percona-Server-5.6.24/service_backend.sql
COPY portal_backend.sql /Percona-Server-5.6.24/portal_backend.sql
COPY portal_web.sql /Percona-Server-5.6.24/portal_web.sql
COPY my.cnf /Percona-Server-5.6.24/my.cnf
COPY mysql_start.sh /mysql_start.sh
RUN chmod 755 /Percona-Server-5.6.24/*.sql /mysql_start.sh /Percona-Server-5.6.24/my.cnf

WORKDIR /Percona-Server-5.6.24

EXPOSE 39316

CMD ["/mysql_start.sh"]
