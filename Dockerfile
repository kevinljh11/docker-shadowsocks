# shadowsocks
#
# VERSION 0.0.3

#FROM ubuntu:14.04.3
#MAINTAINER Dariel Dato-on <oddrationale@gmail.com>

#RUN apt-get update && \
#    apt-get install -y python-pip
#RUN pip install shadowsocks==2.8.2

# Configure container to run as an executable
#ENTRYPOINT ["/usr/local/bin/ssserver"]

# About shadowsocks of Docker
# 
# Version:1.0.1

FROM ubuntu:14.04
MAINTAINER Dubu Qingfeng <1135326346@qq.com>

ENV REFRESHED_AT 2015-06-05

RUN apt-get -qq update && \
    apt-get install -q -y wget build-essential python-pip python-m2crypto && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip install shadowsocks

ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 38388
ENV SS_PASSWORD Ss123456
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

#add chacha20
#RUN wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz && \
#    tar zxf LATEST.tar.gz && \
#    cd libsodium* && \
#    ./configure && make -j2 && make install && \
#    ldconfig

ADD shadowsocks.json /etc/
ADD start.sh /usr/local/bin/start.sh
RUN chmod 755 /usr/local/bin/start.sh

EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "start.sh"]
