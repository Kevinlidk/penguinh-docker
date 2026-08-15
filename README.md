# Penguin Harness (penguinh) Docker 一键启动

本项目为 [Prism-Shadow/penguin-harness](https://github.com/Prism-Shadow/penguin-harness) 的 Docker 一键化部署包装。

## ✨ 特性
- ⚡ **一键启动**：内置 Node 运行时与 CLI，一行命令全自动构建与运行。
- 💾 **数据持久化**：配置与模型数据保存于宿主机 `./data` 目录。
- 🌐 **Web UI**：默认端口 `7364`。
- 🔄 **自动构建**：内置 GitHub Actions 自动构建镜像并发布至 GHCR。

## 🚀 快速开始

### 方式一：使用启动脚本
- **Linux / macOS**:
  ```bash
  chmod +x start.sh
  ./start.sh
  ```
- **Windows**:
  双击 `start.bat` 即可。

### 方式二：标准 Docker Compose
```bash
docker compose up -d --build
docker logs -f penguinh-web
```

## 🔑 登录说明
1. 浏览器打开 `http://127.0.0.1:7364`。
2. 管理员账号：`admin`。
3. 初始密码：首次启动时已打印至终端日志（形如 `penguin-1234`），登录后请尽快在设置中修改。
