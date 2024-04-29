# Wireguard PIA and qbittorrent 
# TODO: Tiny Proxy
# TODO: K8s manifest
FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Stockholm

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

RUN apt-get update \
    && apt-get -y install \ 
    software-properties-common \
    git \
    jq \
    wireguard-tools \
    resolvconf \
    iproute2 \
    tinyproxy \
    curl \
    && add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable \
    && apt-get -y update \
    && apt-get -y install qbittorrent-nox \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pia-foss/manual-connections.git
WORKDIR /manual-connections
COPY wrapper.sh .
RUN chmod +x wrapper.sh
COPY qBittorrent.conf /root/.config/qBittorrent/qBittorrent.conf
COPY tinyproxy.conf ./tinyproxy.conf
RUN mkdir /var/log/tinyproxy \
    && chown -R tinyproxy:tinyproxy /var/log/tinyproxy

ENTRYPOINT ./wrapper.sh
