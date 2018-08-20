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
<<<<<<< HEAD
. $CUR/include/netcat.sh
=======
. $CUR/include/heroku_cli.sh
>>>>>>> abec4a64fc591119e3d901f63f7fa116deda0cef
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
NETCAT_VERSION=0.7.1

usage()
{
    case $1 in
        "")
<<<<<<< HEAD
            echo "Usage: bcompare.sh command [options]"
            echo "      main.sh install_jdk"
            echo "      main.sh install_hadoop"
            echo "      main.sh install_hive"
            echo "      main.sh install_scala"
            echo "      main.sh install_spark"
            echo "      main.sh install_hbase"
            echo "      main.sh install_netcat"
            echo "      main.sh install_laradock"
            echo "      main.sh install_docker"
            echo "      main.sh install_sqoop"
=======
            echo "Usage: main.sh command [options]"
            echo "      main.sh jdk"
            echo "      main.sh hadoop"
            echo "      main.sh hive"
            echo "      main.sh scala"
            echo "      main.sh spark"
            echo "      main.sh hbase"
            echo "      main.sh laradock"
            echo "      main.sh docker"
            echo "      main.sh sqoop"
            echo "      main.sh heroku_cli"
>>>>>>> abec4a64fc591119e3d901f63f7fa116deda0cef
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
                        install_jdk $JDK_VERSION $INSTALL_PATH $STACK
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
<<<<<<< HEAD
                  install_netcat)
                        install_netcat $NETCAT_VERSION $INSTALL_PATH $STACK
                        ;;

                  install_laradock)
=======
                  laradock)
>>>>>>> abec4a64fc591119e3d901f63f7fa116deda0cef
                        install_laradock $DOCKER_VERSION $INSTALL_PATH
                        ;;
                  docker)
                        install_docker $DOCKER_VERSION $INSTALL_PATH
                        ;;
                  sqoop)
                        install_sqoop $SQOOP_VERSION $INSTALL_PATH $INSTALL_PATH/hadoop-${HADOOP_VERSION} $INSTALL_PATH/hive-${HIVE_VERSION}
                        ;;
		  heroku_cli)
                        install_heroku_cli $INSTALL_PATH
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
