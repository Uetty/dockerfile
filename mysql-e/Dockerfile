FROM ubuntu:16.04

RUN \
    apt-get update && \
    # 默认密码
    echo mysql-server-5.7 mysql-server/root_password password 123456 | debconf-set-selections && \
    echo mysql-server-5.7 mysql-server/root_password_again password 123456 | debconf-set-selections && \
    apt-get install -y mysql-server && \
    apt-get install -y vim && \

    # 清理垃圾
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

ENV LANG C.UTF-8

CMD ["bash"]
