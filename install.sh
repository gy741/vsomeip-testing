#!/bin/bash

apt update
apt install -y aptitude git libboost-system1.65-dev libboost-thread1.65-dev libboost-log1.65-dev cmake protobuf-compiler
apt install -y gcc-5 g++-5 g++ asciidoc source-highlight doxygen graphviz net-tools iputils-ping
aptitude search boost

apt install -y afl-clang

git clone https://github.com/GENIVI/vsomeip.git
