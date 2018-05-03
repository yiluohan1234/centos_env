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
HADOOP_VERSION=2.7.6
JDK_VERSION=8u131
HIVE_VERSION=2.1.1
SCALA_VERSION=2.11.12
SPARK_VERSION=2.1.0
HBASE_VERSION=1.2.6
DOCKER_VERSION=18.03.0
INSTALL_PATH=/usr/local
STACK=undistributed



#install_jdk $JDK_VERSION $INSTALL_PATH $STACK
#install_hadoop $HADOOP_VERSION $INSTALL_PATH $STACK
#install_hive $HIVE_VERSION $INSTALL_PATH $STACK
#install_scala $SCALA_VERSION $INSTALL_PATH
#install_spark $SPARK_VERSION $INSTALL_PATH $STACK
#install_hbase $HBASE_VERSION $INSTALL_PATH $STACK
install_laradock $DOCKER_VERSION $INSTALL_PATH
