
docker run -it -d  --name spark --network hadoop-nw haridasn/spark-2.4.0
docker cp /tmp/etc/hadoop spark:/opt/spark/hadoop-conf


# Create a staging location for spark on hdfs.
#
docker exec hadoop-cli hdfs dfs -mkdir -p /user/spark
docker exec hadoop-cli hdfs dfs -chown spark:spark /user/spark

