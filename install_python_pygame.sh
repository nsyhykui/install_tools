#!/data/data/com . termux/files/usr/bin/bash
# Termux Pygame极简安装脚本
# 1.配置镜像源组
termux-change-repo
设置 -欧欧管道故障
回声"🎯Pygame 2.6.1安装脚本"

# 2. 仓库 + 依赖
pkg更新表示“有…的”
pkg安装表示“有…的”X11-回购
pkg安装表示“有…的”python clang make
SD L2 SD L2-混音器SD L2-图像sdl2-ttf
xorgproto libx11 libxt libxext
freetype libjpeg-turbo libpng pulseaudio termux-X11-nightly

# 3.SDL2配置
ln-科幻 $前缀/bin/sdl2-config $前缀/bin/sdl-config
出口 CFLAGS=“——我$前缀/include -I$前缀/include/X11 -I$PREFIX/include/SDL2"
出口 LDFLAGS="-我$前缀/lib"

# 4.直接指定清华源安装（不升级pip)
点安装[构成来自拉丁语、结尾为-我们的名词的复数]https://pypi . tuna . Tsinghua . edu . cn/simple-前期-没有-缓存-dirpygame

# 5. 写入环境
猫> > ~ ~/。bashrc< < ' EOF '
# Pygame配置
termux-x11 >/dev/null 2>&1 &
pulseaudio-start >/dev/null 2 > & 1 &
导出显示=:0
导出SDL _音频驱动程序=脉冲音频
文件结束

回声”✅ 安装完成！"

# 下载本脚本
# curl-L https://raw . githubusercontent . com/nsyhykui/install _ tools/main/install _ python _ py game . sh bash
# 注意复制时不要把“#”复制上
