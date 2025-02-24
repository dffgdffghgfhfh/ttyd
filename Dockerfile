# 使用 Python 3.12 slim 镜像作为基础镜像
FROM python:3.12-slim

# 设置工作目录
WORKDIR /app

# 安装必要的依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 安装 ttys (ttyd)
RUN curl -Lo /tmp/ttyd.tar.gz https://github.com/tsl0922/ttyd/releases/download/v1.6.0/ttyd.x86_64-linux.tar.gz \
    && tar -xzvf /tmp/ttyd.tar.gz -C /usr/local/bin \
    && rm /tmp/ttyd.tar.gz

# 默认命令启动 ttyd
CMD ["ttyd", "-p", "8080", "bash"]
