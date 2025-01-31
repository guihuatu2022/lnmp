#!/bin/bash

# 检查并安装 geoip 工具
if ! command -v geoiplookup &> /dev/null
then
    echo "正在安装 GeoIP 工具..."
    if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        sudo apt-get update
        sudo apt-get install -y geoip-bin
    elif [[ "$ID" == "centos" ]]; then
        sudo yum update -y
        sudo yum install -y geoip
    else
        echo "不支持的操作系统"
        exit 1
    fi
fi

# 检查并安装 lftp 工具
if ! command -v lftp &> /dev/null
then
    echo "正在安装 lftp 工具..."
    if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        sudo apt-get update
        sudo apt-get install -y lftp
    elif [[ "$ID" == "centos" ]]; then
        sudo yum update -y
        sudo yum install -y lftp
    else
        echo "不支持的操作系统"
        exit 1
    fi
fi

# 检查并安装 AWS CLI
if ! command -v aws &> /dev/null
then
    echo "正在安装 AWS CLI..."
    if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        sudo apt-get update
        sudo apt-get install -y awscli
    elif [[ "$ID" == "centos" ]]; then
        sudo yum update -y
        sudo yum install -y awscli
    else
        echo "不支持的操作系统"
        exit 1
    fi
fi

echo "依赖工具安装完成"
