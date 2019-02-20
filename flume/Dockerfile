# Apache Flume Dockerfile
# https://github.com/bigcontainer/bigcont/flume
FROM centos:7

ARG FL_VERSION=1.6.0
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
COPY files/apache-flume-${FL_VERSION}-bin.tar.gz.asc /tmp/apache-flume-${FL_VERSION}-bin.tar.gz.asc
COPY files/apache-flume-${FL_VERSION}-bin.tar.gz.md5 /tmp/apache-flume-${FL_VERSION}-bin.tar.gz.md5

RUN \
# Fix wrong MD5 file...
  sed -i "s/$/  apache-flume-${FL_VERSION}-bin.tar.gz/" /tmp/apache-flume-${FL_VERSION}-bin.tar.gz.md5 && \
  cd /tmp && \
  md5sum -c --quiet apache-flume-${FL_VERSION}-bin.tar.gz.md5 && \
  cd - && \
  gpg --import /tmp/KEYS && \
  gpg --verify /tmp/apache-flume-${FL_VERSION}-bin.tar.gz.asc && \
# Install 
  tar xvzf /tmp/apache-flume-${FL_VERSION}-bin.tar.gz -C /opt && \
  mv /opt/apache-flume-${FL_VERSION}-bin /opt/flume && \
  rm -f /tmp/apache-flume-* && \
  rm -f /tmp/KEYS

ADD files/hello-world.conf /opt/flume/hello-world.conf

EXPOSE 1234

WORKDIR /opt/flume 

ENTRYPOINT ["bin/flume-ng", "agent"]
CMD ["-n", "agent", "-c", "conf", "-f", "hello-world.conf", "-Dflume.root.logger=INFO,console"]
