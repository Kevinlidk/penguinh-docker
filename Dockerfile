FROM node:24-bookworm-slim

# 安装系统运行依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    procps \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 全局安装 penguin CLI
RUN npm install -g @prismshadow/penguin-cli || (curl -fsSL https://penguin.ooo/install.sh | bash)

# 创建普通用户 penguin
RUN useradd -m -s /bin/bash -u 1000 penguin

# 确保全局与本地 bin 都在 PATH 中
ENV PATH="/usr/local/bin:/home/penguin/.local/bin:/home/penguin/.penguin/bin:$PATH"

# 创建工作目录和数据目录并赋予用户权限
RUN mkdir -p /home/penguin/.penguin /home/penguin/workspace && \
    chown -R penguin:penguin /home/penguin

WORKDIR /home/penguin
USER penguin

EXPOSE 7364

COPY --chown=penguin:penguin docker-entrypoint.sh /home/penguin/docker-entrypoint.sh
RUN chmod +x /home/penguin/docker-entrypoint.sh

ENTRYPOINT ["/home/penguin/docker-entrypoint.sh"]
CMD ["penguin", "web"]
