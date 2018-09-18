FROM ubuntu:16.04

RUN \
    apt-get update && \
    # 默认密码
    echo mysql-server-5.7 mysql-server/root_password password 123456 | debconf-set-selections && \
    echo mysql-server-5.7 mysql-server/root_password_again password 123456 | debconf-set-selections && \
    apt-get install -y mysql-server && \
    apt-get install -y vim && \
    # 兼容ubuntu 16.04 宿主机
    chown -R mysql:mysql /var/lib/mysql/mysql && \
    chmod -R 755 /var/lib/mysql/mysql && \
    chown -R mysql:mysql /var/lib/mysql/performance_schema && \
    chmod -R 755 /var/lib/mysql/performance_schema && \
    chown -R mysql:mysql /var/lib/mysql/sys && \
    chmod -R 755 /var/lib/mysql/sys && \
    # 清理垃圾
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/mysql/ib_logfile0 && \
    rm -rf /var/lib/mysql/ib_logfile1

COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

VOLUME ["/data/"]

ENV LANG C.UTF-8

# chmod -R 777 /var/lib/mysql/mysql 调用，兼容ubuntu 16.04 宿主机，可能是有触发器存在，只能在容器启动后执行才会达到目的
ENTRYPOINT chmod -R 777 /var/lib/mysql/mysql && service mysql start && /bin/bash
