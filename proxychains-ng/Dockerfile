FROM ubuntu:18.04

COPY proxychains-ng.tar /data/proxychains-ng.tar

RUN \
    apt-get update && \
    apt-get install -y python-pip && \
    apt-get install -y shadowsocks && \
    apt-get install -y vim && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

COPY config.json /etc/shadowsocks.json
COPY readme.en_US.md /data/readme.en_US.md
COPY readme.zh_CN.md /data/readme.zh_CN.md

ENV LANG C.UTF-8

# sslocal -c /etc/shadowsocks.json -d start && /bin/bash
CMD ["/bin/bash"]
