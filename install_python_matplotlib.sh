#!/data/data/com.termux/files/usr/bin/bash
# Termux matplotlib + GUI 一键脚本（方案 B）
termux-change-repo
set -euo pipefail

echo "🎯 更新软件源并启用 x11-repo…"
pkg update -y
pkg install -y x11-repo

echo "📦 安装系统级依赖（X11、OpenGL、字体、音频）…"
pkg install -y \
    termux-x11-nightly \
    pulseaudio \
    freetype libjpeg-turbo libpng zlib \
    mesa libglvnd libcairo pango \
    fontconfig ttf-dejavu \
    python python-pillow python-tkinter \
    clang make cmake autoconf automake\
    qhull ninja patchelf

echo "🔧 配置环境变量…"
cat >> ~/.bashrc <<'EOF'

# --- matplotlib GUI 配置 ---
if command -v termux-x11 >/dev/null 2>&1; then
    # 自动拉起 X11 与音频
    termux-x11 :0 >/dev/null 2>&1 &
    export DISPLAY=:0
    pulseaudio --start >/dev/null 2>&1
    export SDL_AUDIODRIVER=pulseaudio
fi
EOF

echo "🐍 安装 / 升级 pip 工具链…"
python -m pip install -i https://mirrors.aliyun.com/pypi/simple/ --upgrade pip setuptools wheel

echo "📊 安装 matplotlib（使用阿里云镜像）…"
pip install -i https://mirrors.aliyun.com/pypi/simple/ matplotlib

echo "✅ 安装完成！"
echo "------------------------------------------------"
echo "首次运行 GUI 示例："
echo "  source ~/.bashrc"
echo "  python3 -c \"import matplotlib; matplotlib.use('TkAgg'); import matplotlib.pyplot as plt; plt.plot([0,1,2],[0,1,4]); plt.show()\""
echo "------------------------------------------------"

