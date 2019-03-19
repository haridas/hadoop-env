#
# Run drill and configure it with hadoop-conf
docker pull haridasn/drill-1.15
docker run -it -d  --name drill --network hadoop-nw haridasn/drill-2.4.0
docker cp /tmp/etc/hadoop drill:/opt/drill/hadoop-conf


# Create a staging location for drill on hdfs.
#
docker exec hadoop-cli hdfs dfs -mkdir -p /user/drill
docker exec hadoop-cli hdfs dfs -chown drill:drill /user/drill

