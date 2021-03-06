#!/bin/bash
#set -x
CUR=$(cd `dirname 0`;pwd)
. $CUR/include/hadoop.sh
. $CUR/conf/log.conf
. $CUR/include/jdk.sh
. $CUR/include/hive.sh
. $CUR/include/spark.sh
. $CUR/include/hbase.sh
. $CUR/include/sqoop.sh
. $CUR/include/docker.sh
. $CUR/include/flume.sh
. $CUR/include/netcat.sh
. $CUR/include/heroku_cli.sh
. $CUR/include/flink.sh

HADOOP_VERSION=2.7.7
JDK_VERSION=1.8.0
HIVE_VERSION=2.3.7
SCALA_VERSION=2.11.12
SPARK_VERSION=2.4.6
HBASE_VERSION=1.2.6
DOCKER_VERSION=18.03.0
SQOOP_VERSION=1.4.7
INSTALL_PATH=/usr/local
NETCAT_VERSION=0.7.1
FLUME_VERSION=1.8.0
FLINK_VERSION=1.12.3
STACK=undistributed

usage()
{
    case $1 in
        "")
            echo "Usage: main.sh command [options]"
            echo "      main.sh jdk"
            echo "      main.sh hadoop"
            echo "      main.sh hive"
            echo "      main.sh scala"
            echo "      main.sh spark"
            echo "      main.sh hbase"
            echo "      main.sh netcat"
            echo "      main.sh flume"
            echo "      main.sh docker"
            echo "      main.sh sqoop"
            echo "      main.sh flink"
            echo ""
            ;;
    esac

}
# args for data_process.sh
args()
{
      if [ $# -ne 0 ]; then
            case $1 in
                  jdk)
                        install_jdk $JDK_VERSION $STACK
                        ;;
                  hadoop)
                        install_hadoop $HADOOP_VERSION $INSTALL_PATH $STACK
                        ;;
                  hive)
                        install_hive $HIVE_VERSION $INSTALL_PATH $STACK
                        ;;
                  scala)
                        install_scala $SCALA_VERSION $INSTALL_PATH
                        ;;
                  spark)
                        install_spark $SPARK_VERSION $INSTALL_PATH $STACK
                        ;;
                  hbase)
                        install_hbase $HBASE_VERSION $INSTALL_PATH $STACK
                        ;;
                  netcat)
                        install_netcat $NETCAT_VERSION $INSTALL_PATH $STACK
                        ;;
                  docker)
                        install_docker $DOCKER_VERSION
                        ;;
                  sqoop)
                        install_sqoop $SQOOP_VERSION $INSTALL_PATH $INSTALL_PATH/hadoop-${HADOOP_VERSION} $INSTALL_PATH/hive-${HIVE_VERSION}
                        ;;
                  flume)
                        install_flume $FLUME_VERSION $INSTALL_PATH $JDK_PATH
                        ;;

		  heroku_cli)
                        install_heroku_cli $INSTALL_PATH
                        ;;
                  flink)
                        install_flink $FLINK_VERSION $INSTALL_PATH ${SCALA_VERSION:0:4} $STACK
                        ;;
		  -h|--help)
			usage
                        ;;

                  *)
                        echo "Invalid command:$1"
                        usage
                        ;;
            esac
      else
            usage
      fi
}
args $@
