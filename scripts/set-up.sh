#!/bin/bash

curl -L http://www-eu.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz -o apache-flume-1.6.0-bin.tar.gz
curl -L https://www.apache.org/dist/flume/KEYS -o KEYS
curl -L https://www.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz.asc -o apache-flume-1.6.0-bin.tar.gz.asc
curl -L https://www.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz.md5 -o apache-flume-1.6.0-bin.tar.gz.md5

mv apache-flume-1.6.0-bin.tar.gz ../flume/files/
mv KEYS ../flume/files/
mv apache-flume-1.6.0-bin.tar.gz.asc ../flume/files/
mv apache-flume-1.6.0-bin.tar.gz.md5 ../flume/files/