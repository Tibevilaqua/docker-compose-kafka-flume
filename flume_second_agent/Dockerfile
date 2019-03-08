# Apache Flume Dockerfile
# https://github.com/bigcontainer/bigcont/flume
FROM centos:7

ARG FL_VERSION=1.9.0
ARG FL_MIRROR=http://www-eu.apache.org/dist/

LABEL name="flume" flume-version=$FL_VERSION

ENV JAVA_VERSION=1.8.0 JAVA_HOME=/usr/lib/jvm/jre

# Java installation
RUN \
# We are thinking about avoiding update and trust FROM is updated
# yum update -y && \
  yum install -y java-${JAVA_VERSION}-openjdk && \
  yum clean all

COPY files/apache-flume-${FL_VERSION}-bin.tar.gz /tmp/apache-flume-${FL_VERSION}-bin.tar.gz
COPY files/KEYS /tmp/KEYS

RUN \
# Install
  tar xvzf /tmp/apache-flume-${FL_VERSION}-bin.tar.gz -C /opt && \
  mv /opt/apache-flume-${FL_VERSION}-bin /opt/flume && \
  rm -f /tmp/apache-flume-* && \
  rm -f /tmp/KEYS

ADD files/second_flume_agent.conf /opt/flume/second_flume_agent.conf

EXPOSE 1234

WORKDIR /opt/flume 

ENTRYPOINT ["bin/flume-ng", "agent"]
CMD ["-n", "agent", "-c", "conf", "-f", "second_flume_agent.conf", "-Dflume.root.logger=INFO,console"]
