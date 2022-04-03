#!/bin/bash
set -m
./run_setup.sh &
sleep 30
tinyproxy &
qbittorrent-nox