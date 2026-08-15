@echo off
chcp 65001 >nul
echo 🚀 正在启动 Penguin Harness Docker 容器...

if not exist data mkdir data
if not exist workspace mkdir workspace

docker compose up -d --build

echo.
echo ==============================================================
echo ✅ Penguin Harness 已启动！
echo 🌐 Web 访问地址: http://127.0.0.1:7364
echo 🔑 查看首次生成的初始密码，正在实时输出日志...
echo ==============================================================
echo.

docker logs -f penguinh-web
pause
