FROM mysql:5.7.28
COPY config-file.cnf /etc/mysql/conf.d/config-file.cnf
COPY init.sql /docker-entrypoint-initdb.d/init.sql
RUN echo "Asia/Shanghai" > /etc/timezone