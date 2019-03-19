#
# Run drill and configure it with hadoop-conf
docker pull haridasn/drill-1.15
docker run -it -d  --name drill --network hadoop-nw haridasn/drill-1.15

#
# Prepare the drill to work with yarn.
docker exec drill tar -czvf /home/drill/drill.tar.gz /opt/drill
docker cp /tmp/etc/hadoop drill:/opt/drill/hadoop-conf


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

