# shadowsocks
#
# VERSION 0.0.3

FROM ubuntu:14.04.3
MAINTAINER Dariel Dato-on <oddrationale@gmail.com>

RUN apt-get update && \
    apt-get install -y python-pip
RUN pip install shadowsocks==2.8.2

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/ssserver"]

RUN -d -p 1984:1984 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 1984 -k Ss123456 -m aes-256-cfb
