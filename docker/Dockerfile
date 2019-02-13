FROM debian:latest

ENV HADOOP_HOME=/opt/hadoop \
    JAVA_HOME=/usr \
    NAMENODE_IP=\
    NAMENODE_PORT=\
    NODEMGR_IP=\
    NODEMGR_IP=\


RUN apt-get update && \
    apt-get install -y wget openjdk-8-jdk openjdk-8-jre

RUN wget -q -O- https://www-eu.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz \
    | tar -xzv -C /opt/hadoop --strip 1
