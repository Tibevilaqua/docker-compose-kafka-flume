Docker-compose Flume + Kafka Zookeeper
======================
Docker image for flume & Kafka message broker including Zookeeper

How to get everything working
--------

1 - cd into the scripts directory `cd scripts` and run the set-up.sh script

2 - start the docker-compose (`docker-compose build` & `docker-compose up`)

3 - use the `accessKafka.sh` script to get into the Kafka container

4 - run the `/opt/kafka_2.12-2.1.0/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test` command to start listening to the kafka topic "test"

5 - send http requests to flume `curl -X POST -H 'Content-Type: application/json; charset=UTF-8' -d '[{"headers":{"header.key":"header.value"}, "body":"hello world"}]' http://localhost:1234`

6 - Look at the terminal you opened during the 4th step.


## Sequence

![Sequence](doco/app_sec_pipeline.png?raw=true)