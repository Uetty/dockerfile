FROM ubuntu:16.04

RUN \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:linuxuprising/java && \
    apt-get update && \
# 默认同意证书
    echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get install -y oracle-java10-installer && \
    apt-get remove -y software-properties-common && \
    rm -rf /var/cache/oracle-jdk10-installer && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get autoremove

ENV JAVA_HOME /usr/lib/jvm/java-10-oracle
ENV LANG C.UTF-8

CMD ["/bin/bash"]
