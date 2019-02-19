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

### Get the client tools setup on your host
```bash

# copy a fresh copy of binaries into host machine, now you are ready to connect
# your hadoop cluster using the client tools.
docker cp datanode:/opt/hadoop .
export PATH=`pwd`/hadoop/bin:$PATH

```

### Check hdfs
```bash
hdfs dfs -ls /
sudo -E ./hadoop/bin/hdfs dfs -put /var/log/supervisor /logs
sudo -E ./hadoop/bin/hdfs dfs -put /etc/passwd /passwd
sudo -E ./hadoop/bin/hdfs dfs -cp /passwd /passwdr

```

### Check Resource manager works fine

```bash
yarn jar `pwd`/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar
pi 1 1

yarn jar `pwd`/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar
wordcount /logs/* /out/
```

## Other Bigdata tools on hadoop environment

## load pig

1. Download and extract it

```
wget http://mirrors.estointernet.in/apache/pig/pig-0.17.0/pig-0.17.0.tar.gz
```


2. Setup pig and configure it with hadoop cluster.


```bash
export PIG_HOME=<path-to-pig-home>
export PATH=$PATH:$PIG_HOME/bin
export PIG_CLASSPATH=<path-to-hadoop-conf-dir>

pig
```

3. Load test data for testing

```bash
sudo -E ./hadoop/bin/hdfs dfs -mkdir /pig
sudo -E ./hadoop/bin/hdfs dfs -put pig/tutorial/data /pig/data
```


4. Try pig commands

```bash
pig
# tutorials folder have set of commands try out each and see how it works.

```

Pig commands

```
raw = LOAD '/pig/data/excite-small.log' USING PigStorage('\t') AS (user, time,
query);

user = filter raw by $2=='powwow.com';

dump user

```


## Test hive

SQL interface over hadoop system.

http://mirrors.estointernet.in/apache/hive/hive-3.1.1/apache-hive-3.1.1-bin.tar.gz
