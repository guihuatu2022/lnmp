#!/bin/bash

# 安装 LNMP 环境

# 安装 Nginx
./scripts/setup_nginx.sh

# 安装 MySQL
./scripts/setup_mysql.sh

# 安装 PHP
./scripts/setup_php.sh

# 优化 Nginx、MySQL 和 PHP 配置
./scripts/optimize_configs.sh nginx
./scripts/optimize_configs.sh mysql
./scripts/optimize_configs.sh php

echo "LNMP 环境安装完成"
