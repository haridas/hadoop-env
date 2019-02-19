# hadoop cluster setup multinode

Hadoop cluster setup using multiple physical machines.
## Node preprations

1. set hostnames correctly.

All the nodes place the same set of values.

```bash
cat /etc/hosts 
master  <ip-address>
node1 
node2
node3
..
..
```

2. Set the hostname of the machine to match this address.

edit `/etc/hostname`
edit `/etc/hosts` and replace any occurrence of old hostname with new one.

3. Update and check hostname changed correctly

```bash
sudo hostname <hostname>
hostname
```
Cross check all the machines have correct set of hostnames before going to next
step.

## Get the docker hadoop image

Docker image is packed with following items for homogenious environment.

1. java 1.8
2. hadoop 2.8.5
3. Required configurations.


### Build the docker image locally

### Get the docker image from repo or fileserver.

The image can be shipped via docker image repository  or 

## Start cluster services

### Start the namenode and resourcemanager

### Start datanode and nodemanager

# Test the cluster health

### Check hdfs

### Check Resource manager works fine

./bin/yarn jar `pwd`/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar
pi 1 1

./bin/yarn jar `pwd`/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar
wordcount /logs/* /out/

## Other Bigdata tools on hadoop environment

## load pig

http://mirrors.estointernet.in/apache/pig/pig-0.17.0/pig-0.17.0.tar.gz


## Test hive

http://mirrors.estointernet.in/apache/hive/hive-3.1.1/apache-hive-3.1.1-bin.tar.gz
