#!/bin/bash

LOGFILE="/var/log/lnmp_install.log"
exec > >(tee -i $LOGFILE)
exec 2>&1

# 检查并安装依赖工具
. /etc/os-release
./scripts/install_dependencies.sh

# 检测地理位置并切换镜像源
./scripts/detect_location_and_switch_mirror.sh

show_main_menu() {
    echo "欢迎使用 LNMP 环境安装工具"
    echo "请选择操作："
    echo "1) 安装 LNMP 环境"
    echo "2) 网站管理"
    echo "3) 设置定时备份"
    echo "4) 防火墙管理"
    echo "5) 用户与权限管理"
    echo "6) 监控和日志管理"
    echo "7) 软件更新和管理"
    echo "8) 退出"
    read -p "请输入选项 (1-8): " main_choice

    case $main_choice in
        1)
            show_lnmp_menu
            ;;
        2)
            show_website_menu
            ;;
        3)
            ./scripts/schedule_backup.sh
            ;;
        4)
            ./scripts/firewall_config.sh
            ;;
        5)
            ./scripts/user_management.sh
            ;;
        6)
            ./scripts/monitoring.sh
            ;;
        7)
            ./scripts/software_update.sh
            ;;
        8)
            exit 0
            ;;
        *)
            echo "无效的选项"
            show_main_menu
            ;;
    esac
}

show_lnmp_menu() {
    echo "请选择要安装的组件："
    echo "1) Nginx"
    echo "2) MySQL"
    echo "3) PHP"
    echo "4) Redis"
    echo "5) Memcached"
    echo "6) phpMyAdmin"
    echo "7) HHVM"
    echo "8) Node.js"
    echo "9) Java"
    echo "10) Tomcat"
    echo "11) Pure-FTPd"
    echo "12) 返回上一级"
    read -p "请输入选项 (1-12): " lnmp_choice

    case $lnmp_choice in
        1)
            ./scripts/setup_swap.sh
            ./scripts/setup_nginx.sh
            ./scripts/optimize_configs.sh nginx
            ;;
        2)
            ./scripts/setup_swap.sh
            ./scripts/setup_mysql.sh
            ./scripts/optimize_configs.sh mysql
            ;;
        3)
            ./scripts/setup_swap.sh
            ./scripts/setup_php.sh
            ./scripts/optimize_configs.sh php
            ;;
        4)
            ./scripts/setup_redis.sh
            ;;
        5)
            ./scripts/setup_memcached.sh
            ;;
        6)
            ./scripts/setup_phpmyadmin.sh
            ;;
        7)
            ./scripts/setup_hhvm.sh
            ;;
        8)
            ./scripts/setup_nodejs.sh
            ;;
        9)
            ./scripts/setup_java.sh
            ;;
        10)
            ./scripts/setup_tomcat.sh
            ;;
        11)
            ./scripts/setup_pureftpd.sh
            ;;
        12)
            show_main_menu
            ;;
        *)
            echo "无效的选项"
            show_lnmp_menu
            ;;
    esac
}

show_website_menu() {
    echo "请选择网站管理操作："
    echo "1) 新建网站"
    echo "2) 修改网站"
    echo "3) 删除网站"
    echo "4) 备份网站"
    echo "5) 恢复网站"
    echo "6) 返回上一级"
    read -p "请输入选项 (1-6): " website_choice

    case $website_choice in
        1)
            ./scripts/create_site.sh
            ;;
        2)
            ./scripts/modify_site.sh
            ;;
        3)
            ./scripts/delete_site.sh
            ;;
        4)
            ./scripts/backup_site.sh
            ;;
        5)
            ./scripts/restore_site.sh
            ;;
        6)
            show_main_menu
            ;;
        *)
            echo "无效的选项"
            show_website_menu
            ;;
    esac
}

# 显示主菜单
show_main_menu
