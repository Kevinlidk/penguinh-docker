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

# 使用内置的 node 用户（UID 1000），创建工作与数据目录并赋予权限
RUN mkdir -p /home/node/.penguin /home/node/workspace && \
    chown -R node:node /home/node

# 配置环境变量 PATH
ENV PATH="/usr/local/bin:/home/node/.local/bin:/home/node/.penguin/bin:$PATH"

WORKDIR /home/node
USER node

EXPOSE 7364

COPY --chown=node:node docker-entrypoint.sh /home/node/docker-entrypoint.sh
RUN chmod +x /home/node/docker-entrypoint.sh

ENTRYPOINT ["/home/node/docker-entrypoint.sh"]
CMD ["penguin", "web"]
