#!/bin/bash

# 安装 PHP

# 确保系统信息已加载
. /etc/os-release

# 提供 PHP 版本选择菜单
echo "请选择要安装的 PHP 版本："
echo "1) PHP 5.6"
echo "2) PHP 7.2"
echo "3) PHP 7.4"
echo "4) PHP 8.0"
read -p "输入对应的数字进行选择：" PHP_VERSION_CHOICE

case $PHP_VERSION_CHOICE in
    1)
        PHP_VERSION="5.6"
        ;;
    2)
        PHP_VERSION="7.2"
        ;;
    3)
        PHP_VERSION="7.4"
        ;;
    4)
        PHP_VERSION="8.0"
        ;;
    *)
        echo "无效的选择"
        exit 1
        ;;
esac

echo "正在安装 PHP 版本 $PHP_VERSION..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:ondrej/php
    sudo apt-get update
    sudo apt-get install -y php$PHP_VERSION php$PHP_VERSION-fpm php$PHP_VERSION-mysql
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y epel-release
    sudo yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
    sudo yum install -y yum-utils
    sudo yum-config-manager --enable remi-php$PHP_VERSION
    sudo yum install -y php php-fpm php-mysql
else
    echo "不支持的操作系统"
    exit 1
fi

# 启动并设置 PHP-FPM 开机自启
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

echo "PHP 安装完成"
