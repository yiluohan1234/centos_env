#!/bin/bash
#set -x
CUR=$(cd `dirname 0`;pwd)
. $CUR/include/hadoop.sh
. $CUR/conf/log.conf
. $CUR/include/jdk.sh
. $CUR/include/hive.sh
. $CUR/include/spark.sh
. $CUR/include/hbase.sh
. $CUR/include/laradock.sh
. $CUR/include/sqoop.sh
. $CUR/include/docker.sh
HADOOP_VERSION=2.7.6
JDK_VERSION=8u131
HIVE_VERSION=2.1.1
SCALA_VERSION=2.11.12
SPARK_VERSION=2.1.0
HBASE_VERSION=1.2.6
DOCKER_VERSION=18.03.0
SQOOP_VERSION=1.4.7
INSTALL_PATH=/usr/local
STACK=undistributed



#install_jdk $JDK_VERSION $INSTALL_PATH $STACK
#install_hadoop $HADOOP_VERSION $INSTALL_PATH $STACK
#install_hive $HIVE_VERSION $INSTALL_PATH $STACK
#install_scala $SCALA_VERSION $INSTALL_PATH
#install_spark $SPARK_VERSION $INSTALL_PATH $STACK
#install_hbase $HBASE_VERSION $INSTALL_PATH $STACK
#install_laradock $DOCKER_VERSION $INSTALL_PATH
#install_docker $DOCKER_VERSION $INSTALL_PATH
#install_sqoop $SQOOP_VERSION $INSTALL_PATH $INSTALL_PATH/hadoop-${HADOOP_VERSION} $INSTALL_PATH/hive-${HIVE_VERSION}
usage()
{
    case $1 in
        "")
            echo "Usage: bcompare.sh command [options]"
            echo "      main.sh install_jdk"
            echo "      main.sh install_hadoop"
            echo "      main.sh install_hive"
            echo "      main.sh install_scala"
            echo "      main.sh install_spark"
            echo "      main.sh install_hbase"
            echo "      main.sh install_laradock"
            echo "      main.sh install_docker"
            echo "      main.sh install_sqoop"
            echo ""
            ;;
    esac

}
# args for data_process.sh
args()
{
      if [ $# -ne 0 ]; then
            case $1 in
                  install_jdk)
                        install_jdk $JDK_VERSION $INSTALL_PATH $STACK
                        ;;
                  install_hadoop)
                        install_hadoop $HADOOP_VERSION $INSTALL_PATH $STACK
                        ;;
                  install_hive)
                        install_hive $HIVE_VERSION $INSTALL_PATH $STACK
                        ;;
                  install_scala)
                        install_scala $SCALA_VERSION $INSTALL_PATH
                        ;;
                  install_spark)
                        install_spark $SPARK_VERSION $INSTALL_PATH $STACK
                        ;;
                  install_hbase)
                        install_hbase $HBASE_VERSION $INSTALL_PATH $STACK
                        ;;
                  install_laradock)
                        install_laradock $DOCKER_VERSION $INSTALL_PATH
                        ;;
                  install_docker)
                        install_docker $DOCKER_VERSION $INSTALL_PATH
                        ;;
                  install_sqoop)
                        install_sqoop $SQOOP_VERSION $INSTALL_PATH $INSTALL_PATH/hadoop-${HADOOP_VERSION} $INSTALL_PATH/hive-${HIVE_VERSION}
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
