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
