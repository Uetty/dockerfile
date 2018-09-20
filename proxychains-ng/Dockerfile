FROM ubuntu:18.04

COPY proxychains-ng.tar /data/proxychains-ng.tar

RUN \
    apt-get update && \
    apt-get install -y python-pip && \
    apt-get install -y shadowsocks

COPY config.json /etc/shadowsocks.json

ENTRYPOINT sslocal -c /etc/shadowsocks.json -d start && /bin/bash
