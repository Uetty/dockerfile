FROM ubuntu:16.04

RUN \
    apt-get update && \
    # 默认密码
    echo mysql-server-5.7 mysql-server/root_password password 123456 | debconf-set-selections && \
    echo mysql-server-5.7 mysql-server/root_password_again password 123456 | debconf-set-selections && \
    apt-get install -y mysql-server && \
    apt-get install -y vim && \
    tar -cf /mysql-initialize-data.tar /var/lib/mysql && \

    echo '#!/bin/bash' >> /initialize.sh && \
    echo 'if [[ "`ls /var/lib/mysql`" = "" ]]; then' >> /initialize.sh && \
    echo 'echo "copy default data"' >> /initialize.sh && \
    echo 'tar -xf /mysql-initialize-data.tar;' >> /initialize.sh && \
    echo 'else' >> /initialize.sh && \
    echo 'echo "data exist"' >> /initialize.sh && \
    echo 'fi' >> /initialize.sh && \
    echo 'chmod -R 777 /mysql-initialize-data.tar;' >> /initialize.sh && \
    echo 'chmod -R 777 /var/lib/mysql' >> /initialize.sh && \
    echo 'rm -rf /mysql-initialize-data.tar;' >> initialize.sh && \

    chmod +x /initialize.sh && \

    # 清理垃圾
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

ENV LANG C.UTF-8

ENTRYPOINT chmod 644 /etc/mysql/mysql.conf.d/mysqld.cnf && cd / && ./initialize.sh && service mysql start && /bin/bash
