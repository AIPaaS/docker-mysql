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

ENV MYSQL_HOME /Percona-Server-5.6.24
ENV PORT 39316

WORKDIR $MYSQL_HOME

RUN cd $MYSQL_HOME \
    && chown -Rf mysql:mysql $MYSQL_HOME \
    && scripts/mysql_install_db --basedir=$MYSQL_HOME --datadir=$MYSQL_HOME/data --user=mysql 

COPY createDB.sql $MYSQL_HOME/createDB.sql
COPY service_backend.sql $MYSQL_HOME/service_backend.sql
COPY portal_backend.sql $MYSQL_HOME/portal_backend.sql
COPY portal_web.sql $MYSQL_HOME/portal_web.sql
COPY my.cnf $MYSQL_HOME/my.cnf
COPY mysql_start.sh /mysql_start.sh
RUN chmod 755 $MYSQL_HOME/*.sql /mysql_start.sh $MYSQL_HOME/my.cnf

VOLUME ["/aifs01/mysqldata"]

EXPOSE $PORT

CMD ["/mysql_start.sh"]
