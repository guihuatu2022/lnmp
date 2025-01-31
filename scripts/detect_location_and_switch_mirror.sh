#!/bin/bash

# 检测地理位置和切换镜像源

# 获取当前的国家代码
COUNTRY_CODE=$(geoiplookup $(curl -s ifconfig.me) | awk -F: '{print $2}' | cut -d ',' -f 2 | xargs)

echo "检测到的国家代码: $COUNTRY_CODE"

# 根据国家代码切换镜像源
switch_mirror() {
    case $1 in
        CN)
            echo "切换到中国镜像源..."
            if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
                sudo sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirrors.ustc.edu.cn/ubuntu/|g' /etc/apt/sources.list
                sudo apt-get update
            elif [[ "$ID" == "centos" ]]; then
                sudo sed -i 's|mirror.centos.org|mirrors.ustc.edu.cn|g' /etc/yum.repos.d/CentOS-Base.repo
                sudo yum clean all
                sudo yum makecache
            fi
            ;;
        US)
            echo "切换到美国镜像源..."
            # 这里可以添加美国的镜像源配置
            ;;
        *)
            echo "使用默认镜像源..."
            ;;
    esac
}

# 确保系统信息已加载
. /etc/os-release

# 切换镜像源
switch_mirror $COUNTRY_CODE

echo "镜像源切换完成"
