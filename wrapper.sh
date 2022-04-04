#!/bin/bash
set -m
./run_setup.sh > log.txt &
sleep 30
export PORT=$(tail log.txt | grep Forwarded | grep -o '.....$')
tinyproxy &
qbittorrent-nox