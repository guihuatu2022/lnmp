#!/bin/bash

# 主脚本：安装和配置 LNMP 环境及相关组件

# 检测地理位置并切换镜像源
./scripts/detect_location_and_switch_mirror.sh

# 安装 LNMP 环境
./scripts/setup_lnmp.sh

# 安装 Redis
./scripts/setup_redis.sh

# 安装 Memcached
./scripts/setup_memcached.sh

# 安装 phpMyAdmin
./scripts/setup_phpmyadmin.sh

# 安装 HHVM
./scripts/setup_hhvm.sh

echo "所有组件安装和配置完成"
