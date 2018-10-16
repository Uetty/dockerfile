FROM ubuntu:16.04

RUN \
    apt-get update && \
    apt-get install -y vim && \
    # 清理垃圾
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/mysql"]

ENV LANG C.UTF-8

CMD ["bash"]
