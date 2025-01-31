#!/bin/bash

# 安装 MySQL

# 确保系统信息已加载
. /etc/os-release

echo "正在安装 MySQL..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y mysql-server
    sudo mysql_secure_installation
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y mysql-server
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    sudo mysql_secure_installation
else
    echo "不支持的操作系统"
    exit 1
fi

# 启动并设置 MySQL 开机自启
sudo systemctl start mysql
sudo systemctl enable mysql

echo "MySQL 安装完成"
