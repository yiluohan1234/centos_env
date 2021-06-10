#!/bin/bash
set -x
jdk_version=1.8.0
java_count=`yum list installed | grep java-${jdk_version}|wc -l`
if [ -d /usr/local/hadoop-2.7.7 ];then
   echo "ok"
else
   echo "error"
fi
