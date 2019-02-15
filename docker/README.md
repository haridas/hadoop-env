Hadoop cluster on docker
=========================

Setup hadoop in docker and easily play around different clustering
configurations quickly on a same box.


The services are run as per the bellow setup

1. Namenode + resource manager ( One container )
2. Number of datanodes + node manager ( N number of containers )


./bin/yarn node -list
./bin/yarn application -list


### NameNode / Resource Manager ports
172.18.0.2:9000  - HDFS main port
0.0.0.0:50070    - DFS Namenode Web UI
172.18.0.2:8088  - 
172.18.0.2:8030  -
172.18.0.2:8031  -
172.18.0.2:8032  -
172.18.0.2:8033  -

### Datanode / Node Manager ports

0.0.0.0:50020   -
0.0.0.0:8040    -
0.0.0.0:45257   -
0.0.0.0:8042    -
0.0.0.0:13562   -
0.0.0.0:50010   -
0.0.0.0:50075   -
127.0.0.1:45761 -
