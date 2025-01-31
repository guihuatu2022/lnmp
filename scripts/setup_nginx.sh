#!/bin/bash

# 安装 Nginx

# 确保系统信息已加载
. /etc/os-release

# 提供 Nginx 版本选择菜单
echo "请选择要安装的 Nginx 版本："
echo "1) Nginx 1.14"
echo "2) Nginx 1.18"
echo "3) Nginx 1.20"
read -p "输入对应的数字进行选择：" NGINX_VERSION_CHOICE

case $NGINX_VERSION_CHOICE in
    1)
        NGINX_VERSION="1.14"
        ;;
    2)
        NGINX_VERSION="1.18"
        ;;
    3)
        NGINX_VERSION="1.20"
        ;;
    *)
        echo "无效的选择"
        exit 1
        ;;
esac

echo "正在安装 Nginx 版本 $NGINX_VERSION..."

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y nginx=$NGINX_VERSION*
elif [[ "$ID" == "centos" ]]; then
    sudo yum update -y
    sudo yum install -y epel-release
    sudo yum install -y nginx-$NGINX_VERSION
else
    echo "不支持的操作系统"
    exit 1
fi

# 启动并设置 Nginx 开机自启
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx 安装完成"
