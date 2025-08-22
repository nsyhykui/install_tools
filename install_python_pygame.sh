#!/data/data/com.termux/files/usr/bin/bash
# Termux Pygame 极简安装脚本
# 1.配置镜像源组
termux-change-repo
set -euo pipefail
echo "🎯 Pygame 2.6.1 安装脚本"

# 2. 仓库 + 依赖
pkg update -y
pkg install -y x11-repo
pkg install -y python clang make \
    sdl2 sdl2-mixer sdl2-image sdl2-ttf \
    xorgproto libx11 libxt libxext \
    freetype libjpeg-turbo libpng pulseaudio termux-x11-nightly

# 3. SDL2 配置
ln -sf $PREFIX/bin/sdl2-config $PREFIX/bin/sdl-config
export CFLAGS="-I$PREFIX/include -I$PREFIX/include/X11 -I$PREFIX/include/SDL2"
export LDFLAGS="-L$PREFIX/lib"

# 4. 直接指定清华源安装（不升级 pip）
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --pre --no-cache-dir pygame

# 5. 写入环境
cat >> ~/.bashrc <<'EOF'
# Pygame 配置
termux-x11 >/dev/null 2>&1 &
pulseaudio --start >/dev/null 2>&1 &
export DISPLAY=:0
export SDL_AUDIODRIVER=pulseaudio
EOF

echo "✅ 安装完成！"
