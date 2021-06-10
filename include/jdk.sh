#!/bin/bash
install_jdk()
{
    local jdk_version=$1
    local stack=$2
    if [ `yum list installed | grep java-${jdk_version}|wc -l` -gt 0 ];then
        yum -y remove java-${jdk_version}-openjdk*
        yum -y remove tzdata-java.noarch
    fi
    # yum 安装jdk，默认安装位置
    local install_path=/usr/lib/jvm
    
 	
    yum install -y java-${jdk_version}-openjdk java-${jdk_version}-openjdk-devel
    jdk_path="${install_path}/`ls -l ${install_path}|grep '^d'|awk '{print $NF}'`"

    if [ ${stack} = "undistributed" ];then
        # 添加环境变量
        echo "# jdk environment" >> /etc/profile
        echo "export JAVA_HOME=$jdk_path" >> /etc/profile
        echo 'export JRE_HOME=${JAVA_HOME}/jre' >> /etc/profile
        echo 'export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib' >> /etc/profile
        echo 'export PATH=${JAVA_HOME}/bin:${JRE_HOME}/bin:$PATH' >> /etc/profile
        echo -e "\n" >> /etc/profile
        source /etc/profile
    else
        log_info "distrubuted"
    fi
}
