#!/bin/bash
# 安装flink
install_flink()
{
    local flink_version=$1
    local install_path=$2
    local scala_version=$3
    local stack=$4
    if [ -d ${install_path}/flink-${flink_version} ]; then
         rm -rf ${install_path}/flink-${flink_version}
    fi
    # 判断源文件是否存在，不存在wget http://mirror.bit.edu.cn/apache/flink/flink-1.9.2/flink-1.9.2-bin-scala_2.11.tgz
    if [ ! -f $CUR/src/flink-${flink_version}-bin-scala_${scala_version}.tgz ]; then
        log_info "下载flink-${flink_version}"
        wget -O $CUR/src/flink-${flink_version}-bin-scala_${scala_version}.tgz https://mirrors.tuna.tsinghua.edu.cn/apache/flink/flink-${flink_version}/flink-${flink_version}-bin-scala_${scala_version}.tgz
    fi
    log_info "解压缩flink-${flink_version}"
    tar -zxf $CUR/src/flink-${flink_version}-bin-scala_${scala_version}.tgz -C $install_path
    chown $USER:$USER -R $install_path/flink-${flink_version}

    if [ ${stack} = "undistributed" ];then
        # 添加环境变量
        echo "# flink environment" >> /etc/profile
        echo "export FLINK_HOME=${install_path}/flink-${flink_version}" >> /etc/profile
        echo 'export PATH=${FLINK_HOME}/bin:$PATH' >> /etc/profile
        echo -e "\n" >> /etc/profile
        source /etc/profile
    else
        echo "distrubuted"
    fi
}
