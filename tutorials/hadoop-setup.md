
# hadoop setup multinode docker based

Using multiple nodes and G
## Node preprations

1. set hostnames correctly.

All the nodes place the same set of values.

/etc/hosts 
master  <ip-address>
node1 
node2
node3
..
..

2. Set the hostname of the machine to match this address.


edit /etc/hostname

edit /etc/hosts and replace any occurrence of old hostname with new one.

3. Update and check hostname reflected by checking

sudo hostname <hostname>
hostname


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

### 


## Test few map-reduce tasks.

./bin/yarn jar `pwd`/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar
pi 1 1

./bin/yarn jar `pwd`/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar
wordcount /logs/* /out/


## Hdfs what else ?

