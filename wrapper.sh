#!/bin/bash
set -m
./run_setup.sh > pia_log.txt &
sleep 30
echo "Connection\PortRangeMin=$(tail pia_log.txt | grep Forwarded | grep -o '.....$')" >> /root/.config/qBittorrent/qBittorrent.conf
# tinyproxy &
qbittorrent-nox
