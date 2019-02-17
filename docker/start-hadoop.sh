#
# start hadoop services as bellow
# 1. namenode
# 2. datanode
# 3. resource manager
# 4. node manager
# 5. Set all the configurations.
#
#
#
# One docker node will start either as datanode / namenode with related 
# yarn/mapred components for that node.
#
#

nodeType=$1
nameNodeIP=$2

if [[ ! $nodeType || ! $nameNodeIP ]]
then
   echo "Missing command line arguments, 'nodeType' or 'namenode IP'"
   exit 1
fi

case $nodeType in
    namenode)

    # Start the namenode and resource manager on this same node.
    echo "starting namenode."

    # Docker IP, Use it with namenode.
    #IP=`ip address | grep eth0 | grep inet | awk {' print $2 '} | cut -d / -f1`

    export NAMENODE_HOST=$nameNodeIP
    export HDFS_HOST=$nameNodeIP

    #Setup configurations.
    envsubst < $HADOOP_HOME/conf-template/hdfs-site.xml > $HADOOP_HOME/etc/hadoop/hdfs-site.xml
    envsubst < $HADOOP_HOME/conf-template/core-site.xml > $HADOOP_HOME/etc/hadoop/core-site.xml
    envsubst < $HADOOP_HOME/conf-template/mapred-site.xml > $HADOOP_HOME/etc/hadoop/mapred-site.xml
    envsubst < $HADOOP_HOME/conf-template/yarn-site.xml > $HADOOP_HOME/etc/hadoop/yarn-site.xml

    # format the namenode first time, and skip if already formated the filesystem.
    $HADOOP_HOME/bin/hdfs namenode -format  -nonInteractive
    if [ $? -eq 0 ]
    then
        echo "Formatting the namenode first time"
    fi
    echo ">> Namenode started on host: $IP"

    envsubst < /root/supervisord/namenode.conf > /etc/supervisor/conf.d/namenode.conf
    shift;;
datanode)
    echo "Starting the Datanode and Node manager"
    echo "Node manager will be attached to resource manager"
    export NAMENODE_HOST=$nameNodeIP
    export HDFS_HOST=$nameNodeIP

    envsubst < /root/supervisord/datanode.conf > /etc/supervisor/conf.d/datanode.conf

    #Setup configurations.
    envsubst < $HADOOP_HOME/conf-template/hdfs-site.xml > $HADOOP_HOME/etc/hadoop/hdfs-site.xml
    envsubst < $HADOOP_HOME/conf-template/core-site.xml > $HADOOP_HOME/etc/hadoop/core-site.xml
    envsubst < $HADOOP_HOME/conf-template/mapred-site.xml > $HADOOP_HOME/etc/hadoop/mapred-site.xml
    envsubst < $HADOOP_HOME/conf-template/yarn-site.xml > $HADOOP_HOME/etc/hadoop/yarn-site.xml

    shift;;
*)
    echo "Unknown service name given to start the service"
    echo "Supported services are 'namenode' and 'datanode'"
    exit 1
esac


# Run the supervisord daemon in forground mode.
#
supervisord -n
