#!/bin/bash

# 安装 HHVM

# 确保系统信息已加载
. /etc/os-release

echo "正在安装 HHVM..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
    echo deb http://dl.hhvm.com/$(lsb_release -sc) $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/hhvm.list
    sudo apt-get update
    sudo apt-get install -y hhvm
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y epel-release
    sudo yum install -y https://dl.hhvm.com/centos/hhvm.repo
    sudo yum install -y hhvm
else
    echo "不支持的操作系统"
    exit 1
fi

# 启动并设置 HHVM 开机自启
sudo systemctl start hhvm
sudo systemctl enable hhvm

echo "HHVM 安装完成"
