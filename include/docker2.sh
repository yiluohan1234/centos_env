#!/bin/bash
#set -x
install_docker()
{
	# 19.03.4
    local docker_version=$1
    yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
    # 安装必要文件
    log_info "install epel-release python-pip git"
	yum install -y yum-utils device-mapper-persistent-data lvm2
    # 导入Docker repository
    log_info "start docker"
	yum-config-manager --add-repo \
		https://download.docker.com/linux/centos/docker-ce.repo
	# 安装 docker
	yum update -y && yum install -y \
		containerd.io-1.2.10 \
		docker-ce-${docker_version} \
		docker-ce-cli-${docker_version}
    # 创建docker配置目录并设置daemon.json配置文件
	mkdir -p /etc/docker
    log_info "镜像加速"
    cat > /etc/docker/daemon.json <<EOF
{
	"exec-opts": ["native.cgroupdriver=systemd"],
	"log-driver": "json-file",
	"log-opts": {
		"max-size": "100m"  
	},
	"storage-driver": "overlay2",
	"storage-opts": [
		"overlay2.override_kernel_check=true"
	]
}
EOF
	# 重启Docker，加载配置文件
	systemctl daemon-reload
	systemctl restart docker
} 
