FROM ubuntu:18.04

RUN \
    apt-get update && \
    apt-get install -y python-pip && \
    apt-get install -y shadowsocks && \
    apt-get install -y vim && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8

COPY config.json /etc/shadowsocks.json
COPY readme.en_US.md /readme/readme.en_US.md
COPY readme.zh_CN.md /readme/readme.zh_CN.md

# ssserver -c /etc/shadowsocks.json -d start && /bin/bash
CMD ["/bin/bash"]
