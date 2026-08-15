FROM debian:bookworm-slim

# 安装必要依赖：curl, ca-certificates, procps, git 等
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    procps \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 创建工作空间及非 root 运行环境
RUN useradd -m -s /bin/bash penguin

# 切换为 penguin 用户并执行官方一键安装
USER penguin
WORKDIR /home/penguin

# 安装 penguin harness
RUN curl -fsSL https://penguin.ooo/install.sh | sh

# 配置 PATH 环境变量
ENV PATH="/home/penguin/.local/bin:/home/penguin/bin:$PATH"

# 暴露 Penguin Harness 默认 Web UI 端口
EXPOSE 7364

# 创建数据挂载目录
RUN mkdir -p /home/penguin/.penguin /home/penguin/workspace

COPY --chown=penguin:penguin docker-entrypoint.sh /home/penguin/docker-entrypoint.sh
RUN chmod +x /home/penguin/docker-entrypoint.sh

ENTRYPOINT ["/home/penguin/docker-entrypoint.sh"]
CMD ["penguin", "web"]
