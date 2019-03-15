#
# Starts a hadoop cluster in docker container with a hadoop docker
echo "=> Starting a hadoop cluster with 1 namenode and 2 datanode"

# Create network, don't fail
docker network create hadoop-nw &> /dev/null || true

# Start namenode
docker run -it --rm -d --name namenode -p 8088:8088  --network hadoop-nw haridasn/hadoop-2.8.5 namenode
namenodeIp=`docker exec namenode ifconfig | grep eth0 -A 1 | grep inet | awk {' print $2 '}`

echo "Namenode IP: $namenodeIp"

# Start two datanodes
docker run -it --rm -d --name datanode1 --memory 3g --cpus 2 --network hadoop-nw haridasn/hadoop-2.8.5 datanode $namenodeIp
docker run -it --rm -d --name datanode2 --memory 3g --cpus 2 --network hadoop-nw haridasn/hadoop-2.8.5 datanode $namenodeIp

echo 
echo "=> Started Hadoop cluster !!"

# Start the docker container.
docker run -it --rm -d --name hadoop-cli --network hadoop-nw haridasn/hadoop-cli
rm -rf /tmp/etc
docker cp namenode:/opt/hadoop/etc /tmp/etc
docker cp /tmp/etc hadoop-cli:/opt/hadoop/

echo "=> Started a hadoop-cli docker container and configured it with hadoop cluster"
echo

docker ps | grep hadoop

echo "=> All cluster services are started !."


echo
echo "
Hadoop cluster started with one namenode, and two datanodes. Also added a
hadoop client container to interact with the cluster.

=> Try these commands to ensure cluster is up

$ docker exec hadoop-cli /opt/hadoop/bin/yarn node -list
$ docker exec hadoop-cli /opt/hadoop/bin/hdfs dfsadmin -report
"
echo
