#!/bin/bash

fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile


rm /var/lib/apt/lists/lock
rm /var/cache/apt/archives/lock
rm /var/lib/dpkg/lock*
dpkg --configure -a 

apt update
apt install -y aptitude git libboost-system1.65-dev libboost-thread1.65-dev libboost-log1.65-dev cmake protobuf-compiler
apt install -y gcc-5 g++-5 g++ asciidoc source-highlight doxygen graphviz net-tools iputils-ping
aptitude search boost

apt install -y afl-clang

git clone https://github.com/GENIVI/vsomeip.git
cd /root/vsomeip
mkdir build
cd build/
CC=afl-clang-fast CXX=afl-clang-fast++ cmake -DENABLE_SIGNAL_HANDLING=1 -DENABLE_MULTIPLE_ROUTING_MANAGERS=1 ..
CC=afl-clang-fast CXX=afl-clang-fast++ make
