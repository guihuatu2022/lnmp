#!/bin/bash

# 一键安装脚本

# 设置 GitHub 仓库 URL
REPO_URL="https://github.com/guihuatu2022/lnmp.git"
REPO_DIR="setup-scripts"

# 克隆 GitHub 仓库
if [ -d "$REPO_DIR" ]; then
    echo "仓库目录已存在，更新仓库..."
    cd "$REPO_DIR"
    git pull
else
    echo "克隆 GitHub 仓库..."
    git clone "$REPO_URL"
    cd "$REPO_DIR"
fi

# 运行安装脚本
echo "运行安装脚本..."
./scripts/setup_env.sh

echo "安装完成"
