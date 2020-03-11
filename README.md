# Hadoop cluster for experiments

Easy way to setup the hadoop in cluster mode and playwith the different tools
over the hadoop ecosystem.

Currently docker based cluster setup is added.


## Start hadoop cluster

Launch 3 node hadoop cluster with two datanode and one namenode. The Resource
manager will be running on nodemanager docker container itself. And the node
manager will be running on all the datanode containers.

Bellow shell script make use of the docker commands to start and manage the
configurations of hadoop cluster.

```bash
./bin/start-hadoop.sh
```

Once the command finishes its setup, you should see output like below,

```text

=> Started Hadoop cluster !!
Using default tag: latest
latest: Pulling from haridasn/hadoop-cli
Digest: sha256:690e0f17af0aa7b98202ad22c4f79faedc9dae3c7a83b4e066924115e06cdeb0
Status: Image is up to date for haridasn/hadoop-cli:latest
953ddc8b6aa6b436dfee96f600ccf25e9013e603bc1f9e384c958bae07c525ae
=> Started a hadoop-cli docker container and configured it with hadoop cluster

953ddc8b6aa6        haridasn/hadoop-cli                                   "/bin/bash"              3 seconds ago       Up Less than a second                                                                                            hadoop-cli
512fec8628c6        haridasn/hadoop-2.8.5                                 "bash /start-hadoop.…"   9 seconds ago       Up 5 seconds            0.0.0.0:8043->8042/tcp, 0.0.0.0:8037->8047/tcp, 0.0.0.0:8049->8048/tcp                   datanode2
a88a6c7912e9        haridasn/hadoop-2.8.5                                 "bash /start-hadoop.…"   11 seconds ago      Up 8 seconds            0.0.0.0:8042->8042/tcp, 0.0.0.0:8047-8048->8047-8048/tcp                                 datanode1
c1a4fee04c87        haridasn/hadoop-2.8.5                                 "bash /start-hadoop.…"   13 seconds ago      Up 10 seconds           0.0.0.0:8088->8088/tcp, 0.0.0.0:50070->50070/tcp                                         namenode
=> All cluster services are started !.


Hadoop cluster started with one namenode, and two datanodes. Also added a
hadoop client container to interact with the cluster.

=> Try these commands to ensure cluster is up

$ docker exec hadoop-cli yarn node -list
$ docker exec hadoop-cli hdfs dfsadmin -report

```


## Start spark with Yarn

```bash
./bin/start-spark.sh
```

## Cleanup entire cluster.

Once you are done with the testing on the cluster, just destroy it by running
this command.

```bash
bash ./bin/clean-all.sh
```

This command will clean all the containers started along with the hadoop cluster
and also other hadoop related servicse like spark, drill etc.
