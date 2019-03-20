#
# Run drill and configure it with hadoop-conf
docker pull haridasn/drill-1.15
docker run -it -d  --name drill --network hadoop-nw haridasn/drill-1.15

# Starting zookeepr for Drill cluster
docker ps | grep zk &> /dev/null
if [[ $? == 1 ]]
then
    echo
    echo "starting zk server"
    docker pull haridasn/zk-3.4.13
    docker run -it -d  --name zk --network hadoop-nw haridasn/zk-3.4.13
fi

#
# Prepare the drill to work with yarn.
echo 
echo "Initializing drill..."
docker exec drill tar -czf /home/drill/drill.tar.gz -C /opt drill
docker cp /tmp/etc/hadoop drill:/opt/drill/hadoop-conf

# Create site dir.
docker exec drill mkdir /home/drill/site
docker exec drill cp /opt/drill/conf/drill-on-yarn.conf /home/drill/site/
docker exec drill cp /opt/drill/conf/drill-env.sh /home/drill/site/
docker exec drill cp /opt/drill/conf/drill-override.conf /home/drill/site/
docker exec drill cp /opt/drill/conf/* /home/drill/site/
docker exec drill cp /opt/drill/hadoop-conf/core-site.xml /home/drill/site/
docker exec drill cp /opt/drill/hadoop-conf/hdfs-site.xml /home/drill/site/

# Create a staging location for drill on hdfs.
#
docker exec hadoop-cli hdfs dfs -mkdir -p /user/drill
docker exec hadoop-cli hdfs dfs -mkdir -p /user/drill/site
docker exec hadoop-cli hdfs dfs -chown drill:drill /user/drill

echo 

echo "=> Drill Container is ready to go !!!

Attach to the container and fire commands.

$ docker exec -it drill bash

"

