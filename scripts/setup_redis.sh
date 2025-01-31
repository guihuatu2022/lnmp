#!/bin/bash

# 安装 Redis

# 确保系统信息已加载
. /etc/os-release

echo "正在安装 Redis..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y redis-server
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y epel-release
    sudo yum install -y redis
else
    echo "不支持的操作系统"
    exit 1
fi

# 启动并设置 Redis 开机自启
sudo systemctl start redis
sudo systemctl enable redis

echo "Redis 安装完成"
