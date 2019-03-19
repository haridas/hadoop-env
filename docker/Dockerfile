FROM ubuntu:19.04

RUN apt-get update && \
    apt-get install -y wget openjdk-8-jdk openjdk-8-jre

RUN mkdir /opt/hadoop && \
    wget -q -O- http://mirrors.estointernet.in/apache/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz \
    | tar -xzv -C /opt/hadoop --strip 1

RUN apt-get update && apt-get install -y supervisor telnet net-tools gettext

ENV HADOOP_HOME=/opt/hadoop \
    JAVA_HOME=/usr \
    HDFS_PORT=9000


# Docker managed volume, to persist the data on corresponding nodes.
#VOLUME ["/hadoop"]

COPY conf/hadoop /opt/hadoop/conf-template
COPY conf/supervisord /root/supervisord
COPY start-hadoop.sh /start-hadoop.sh


WORKDIR /opt/hadoop
ENTRYPOINT ["bash", "/start-hadoop.sh"]
