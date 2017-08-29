# Dockerfile
FROM ubuntu:16.04

RUN apt-get clean && apt-get update && apt-get install -y wget

RUN mkdir /qtum

RUN cd /qtum

RUN wget https://github.com/qtumproject/qtum/releases/download/testnet-skynet-v1.1/qtum-0.14.0-x86_64-linux-gnu.tar.gz

RUN tar --strip 1 -xf qtum-0.14.0-x86_64-linux-gnu.tar.gz

RUN bin/qtumd
