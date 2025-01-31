#!/bin/bash

# 安装 PHP

# 确保系统信息已加载
. /etc/os-release

echo "正在安装 PHP..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y php-fpm php-mysql
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y epel-release
    sudo yum install -y php php-fpm php-mysql
else
    echo "不支持的操作系统"
    exit 1
fi

# 启动并设置 PHP-FPM 开机自启
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

echo "PHP 安装完成"
