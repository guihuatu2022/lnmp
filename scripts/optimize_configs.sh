#!/bin/bash

# 优化 Nginx、MySQL 和 PHP 配置

if [ $# -eq 0 ]; then
    echo "请指定一个要优化的服务，例如 nginx, mysql 或 php"
    exit 1
fi

SERVICE=$1

optimize_nginx() {
    echo "正在优化 Nginx 配置..."
    # 这里可以添加 Nginx 优化配置，例如 worker_processes, keepalive_timeout 等
    sudo sed -i "s/worker_processes auto;/worker_processes 4;/" /etc/nginx/nginx.conf
    sudo sed -i "s/keepalive_timeout 65;/keepalive_timeout 15;/" /etc/nginx/nginx.conf
    sudo systemctl restart nginx
    echo "Nginx 配置优化完成"
}

optimize_mysql() {
    echo "正在优化 MySQL 配置..."
    # 这里可以添加 MySQL 优化配置，例如 innodb_buffer_pool_size, max_connections 等
    sudo sed -i "/\[mysqld\]/a innodb_buffer_pool_size = 1G" /etc/mysql/mysql.conf.d/mysqld.cnf
    sudo sed -i "/\[mysqld\]/a max_connections = 200" /etc/mysql/mysql.conf.d/mysqld.cnf
    sudo systemctl restart mysql
    echo "MySQL 配置优化完成"
}

optimize_php() {
    echo "正在优化 PHP 配置..."
    # 这里可以添加 PHP 优化配置，例如 memory_limit, max_execution_time 等
    sudo sed -i "s/memory_limit = 128M/memory_limit = 256M/" /etc/php/7.4/fpm/php.ini
    sudo sed -i "s/max_execution_time = 30/max_execution_time = 60/" /etc/php/7.4/fpm/php.ini
    sudo systemctl restart php7.4-fpm
    echo "PHP 配置优化完成"
}

case $SERVICE in
    nginx)
        optimize_nginx
        ;;
    mysql)
        optimize_mysql
        ;;
    php)
        optimize_php
        ;;
    *)
        echo "未知的服务: $SERVICE"
        exit 1
        ;;
esac
