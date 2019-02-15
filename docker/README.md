# Hadoop cluster on docker

Setup hadoop in docker and easily play around different clustering
configurations quickly on a same box or multiple machines.

The services are run as per the bellow setup

1. Namenode + resource manager ( One container )
2. Number of datanodes + node manager ( N number of containers )

# Prerequisites

1. Docker
2. Tested only in Debian/Ubuntu machines.

# Build Docker image

```bash
cd docker
docker build -t hadoop .
```

# Start the hadoop cluster
The main components of the hadoop cluster are
1. Namenode
2. Datanode
3. Resource Manager
4. Node Manager


Yarn - Yet another resource negotiator, the framework which fecisilitate the
compute over the stored data in hdfs. resource manager and node manager are part
of yarn framework. Namenode and Datanode are part of Hadoop distributed file system.

These are the bare minimum components required to start with, all other hadoop
tools are sit on top of this, eg; hive, pig etc.

Here we are setting hadoop in cluster mode with the help of dockerized hadoop
binary. Cluster mode means, we will run the namenode, resource-manager on one
docker container and we can have multiple datanode and node-manager containers
which actually does the storage and compute part for the hadoop cluster.


## Start Namenode and Resource Manager

Run bellow command to start a docker container with namenode and resource
manager setup.

```bash
docker run -it -d  \
    -p 9000:9000
    -p 8030-8033:8030-8033 \
    -p 8088:8088
    --name master \
    hadoop:latest namenode
```

## Start Datanode and Node Manager

```bash
docker run -it -d \
    -p 50020:50020 \
    -p 8040-8042:8040:8042 \
    -p 50010:50010  \
    -p 50075:50075 \
    --name worker1 \
    hadoop:latest datanode <namenode-ip>
```
`namenode-ip` You will get this namenode after you start the namenode, which
will be printed on the console.

Now you can start multiple workers which will be automatically joined to the
master node.

## Verify the cluster is Ready

./bin/yarn node -list
./bin/yarn application -list

## Service Ports

### NameNode / Resource Manager ports
```
172.18.0.2:9000  - HDFS main port
0.0.0.0:50070    - DFS Namenode Web UI
172.18.0.2:8088  - RM's web interface port and address.
172.18.0.2:8030  - Resource manager's (scheduers) interface port.
172.18.0.2:8031  - 
172.18.0.2:8032  - RM's application manager's interface.
172.18.0.2:8033  - RM's Admin interface.
```

### Datanode / Node Manager ports

```
0.0.0.0:50020   - Datanode's IPC server address and port.
0.0.0.0:8040    - Nodemanager IPC port and address.
0.0.0.0:8042    - Nodemanager HTTP Address
0.0.0.0:50010   - Datanode's server address and port for data transfer.
0.0.0.0:50075   - Datanode's HTTP server address and port.
0.0.0.0:45257   -
0.0.0.0:13562   -
```
