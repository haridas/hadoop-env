
# Clean if the cluster already running.
docker ps | grep haridasn | cut -d " " -f1 | xargs docker rm -f

echo "=> Cleaned all the hadoop related dockers"
