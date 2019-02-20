Flume Kafka
======================
Docker image for Flume

Test
----
Send messages to Flume source
```
curl -X POST -H 'Content-Type: application/json; charset=UTF-8' -d '[{"headers":{"header.key":"header.value"}, "body":"hello world"}]' http://localhost:1234 
```

Verify that messages have been received in the docker-compose console

```
flume_1  | 2019-02-20 03:37:26,109 (SinkRunner-PollingRunner-DefaultSinkProcessor) [INFO - org.apache.flume.sink.LoggerSink.process(LoggerSink.java:94)] Event: { headers:{header.key=header.value} body: 68 65 6C 6C 6F 20 77 6F 72 6C 64                hello world }
flume_1  | 2019-02-20 03:37:26,816 (SinkRunner-PollingRunner-DefaultSinkProcessor) [INFO - org.apache.flume.sink.LoggerSink.process(LoggerSink.java:94)] Event: { headers:{header.key=header.value} body: 68 65 6C 6C 6F 20 77 6F 72 6C 64                hello world }
flume_1  | 2019-02-20 03:37:27,255 (SinkRunner-PollingRunner-DefaultSinkProcessor) [INFO - org.apache.flume.sink.LoggerSink.process(LoggerSink.java:94)] Event: { headers:{header.key=header.value} body: 68 65 6C 6C 6F 20 77 6F 72 6C 64                hello world }
```

Credits
-------
Originally cloned and inspired by https://hub.docker.com/r/bigcontainer/flume
