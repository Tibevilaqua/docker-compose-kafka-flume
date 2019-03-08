#!/bin/bash

curl -L http://www-eu.apache.org/dist/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz -o apache-flume-1.9.0-bin.tar.gz
curl -L https://www.apache.org/dist/flume/KEYS -o KEYS

cp apache-flume-1.9.0-bin.tar.gz ../flume/files/
cp KEYS ../flume/files/

mv apache-flume-1.9.0-bin.tar.gz ../flume_second_agent/files/
mv KEYS ../flume_second_agent/files/