#!/bin/bash

# 安装 phpMyAdmin

# 确保系统信息已加载
. /etc/os-release

echo "正在安装 phpMyAdmin..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y phpmyadmin
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y epel-release
    sudo yum install -y phpmyadmin
else
    echo "不支持的操作系统"
    exit 1
fi

# 配置 phpMyAdmin
if [ -f /etc/phpmyadmin/config.inc.php ]; then
    sudo sed -i "s/Require local/Require all granted/" /etc/phpmyadmin/apache.conf
    sudo systemctl restart apache2
elif [ -f /etc/httpd/conf.d/phpMyAdmin.conf ]; then
    sudo sed -i "s/Require local/Require all granted/" /etc/httpd/conf.d/phpMyAdmin.conf
    sudo systemctl restart httpd
fi

echo "phpMyAdmin 安装完成"
