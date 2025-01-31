#!/bin/bash

# 安装 Nginx

# 确保系统信息已加载
. /etc/os-release

echo "正在安装 Nginx..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y nginx
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y epel-release
    sudo yum install -y nginx
else
    echo "不支持的操作系统"
    exit 1
fi

# 启动并设置 Nginx 开机自启
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx 安装完成"
