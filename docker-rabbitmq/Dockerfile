FROM ubuntu:16.04

RUN \
    mkdir /etc/systemd/system/rabbitmq-server.service.d \
    && apt-get update -y \
    && apt-get install -y wget \
    && apt-key adv --keyserver "hkps.pool.sks-keyservers.net" --recv-keys "0x6B73A36E6026DFCA" \
    && wget -O - "https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc" | apt-key add - \
    && apt-get install -y apt-transport-https \
    && echo "# This repository provides Erlang packages \ndeb https://dl.bintray.com/rabbitmq-erlang/debian xenial erlang \n#This repository provides RabbitMQ packages \ndeb https://dl.bintray.com/rabbitmq/debian xenial main" > /etc/apt/sources.list.d/bintray.rabbitmq.list \
    && apt-get update -y \
    && apt-get install -y rabbitmq-server \
    && apt-get remove -y wget \
    && apt-get install -y curl \
    && apt-get install -y vim \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && echo "[Service]\nLimitNOFILE=64000" > /etc/systemd/system/rabbitmq-server.service.d/limits.conf

ENV LANG C.UTF-8

CMD ["bash"]
