#!/bin/bash

# 安装 Memcached

# 确保系统信息已加载
. /etc/os-release

echo "正在安装 Memcached..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y memcached
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y memcached
else
    echo "不支持的操作系统"
    exit 1
fi

# 启动并设置 Memcached 开机自启
sudo systemctl start memcached
sudo systemctl enable memcached

echo "Memcached 安装完成"
