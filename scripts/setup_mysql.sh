#!/bin/bash

# 安装 MySQL

# 确保系统信息已加载
. /etc/os-release

# 提供 MySQL 版本选择菜单
echo "请选择要安装的 MySQL 版本："
echo "1) MySQL 5.1"
echo "2) MySQL 5.5"
echo "3) MySQL 5.7"
read -p "输入对应的数字进行选择：" MYSQL_VERSION_CHOICE

case $MYSQL_VERSION_CHOICE in
    1)
        MYSQL_VERSION="5.1"
        ;;
    2)
        MYSQL_VERSION="5.5"
        ;;
    3)
        MYSQL_VERSION="5.7"
        ;;
    *)
        echo "无效的选择"
        exit 1
        ;;
esac

echo "正在安装 MySQL 版本 $MYSQL_VERSION..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:ondrej/mysql-5.6
    sudo apt-get update
    sudo apt-get install -y mysql-server=$MYSQL_VERSION*
    sudo mysql_secure_installation
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y https://repo.mysql.com/mysql-community-release-el7.rpm
    sudo yum-config-manager --disable mysql57-community
    sudo yum-config-manager --enable mysql$MYSQL_VERSION-community
    sudo yum install -y mysql-community-server
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
