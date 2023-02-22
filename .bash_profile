#
# ~/.bash_profile
#
export GTK_USE_PORTAL=0
export EDITOR=nvim

# add color to man page # blue cyan k=black magenta yellow red white green
# S = no_line_wrap
export MANPAGER="less -R --use-color -Dd+r -Dur"
export MANROFFOPT="-c"
export LESS='-R --use-color -Dd+r$Du+y'
export HISTIGNORE='rm *:de *:dv *:ls *:cd *'

#[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
export HISTSIZE=10000
export HISTFILESIZE=10000

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	#sudo systemctl restart systemd-logind
#  XKB_DEFAULT_LAYOUT=us exec sway
#fi

export LIBVIRT_DEFAULT_URI="qemu:///system"
export VAGRANT_DEFAULT_PROVIDER=virtualbox
#  sudo akmods --kernels 5.13.16-200.fc34.x86_64 && systemctl restart vboxdrv.service

#export MESA_LOADER_DRIVER_OVERRIDE=iris
#export MESA_LOADER_DRIVER_OVERRIDE=i965
#export MESA_GL_VERSION_OVERRIDE=4.2
#export MESA_GLES_VERSION_OVERRIDE=2.0
#export MESA_VK_VERSION_OVERRIDE=1.1
#export MESA_LOADER_DRIVER_OVERRIDE=zink
#export MESA_GL_VERSION_OVERRIDE=3.3
#export MESA_GL_VERSION_OVERRIDE=4.6COMPAT
#export COGL_ATLAS_DEFAULT_BLIT_MODE=framebuffer

#export LIBVA_DRIVER_NAME=iHD
#export GST_VAAPI_ALL_DRIVERS=1
#export LIBVA_DRIVER_NAME=i965

#export MOZ_ENABLE_WAYLAND=1
#export MOZ_WEBRENDER=1
#export MOZ_ACCELERATED=1
export CLUTTER_BACKEND=wayland
export ECORE_EVAS_ENGINE=wayland-egl
export ELM_ENGINE=wayland_egl
export SDL_VIDEODRIVER=wayland
export NO_AT_BRIDGE=1

#export QT_QPA_PLATFORM=wayland-egl
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export QT_QPA_PLATFORMTHEME=qt5ct
#export QT_QPA_PLATFORMTHEME=gnome
#export QT_STYLE_OVERRIDE='fusion'

#INPUT_METHOD=ibus
#GTK_IM_MODULE=ibus
#QT_IM_MODULE=ibus
#XMODIFIERS=@im=ibus

#XDG_CURRENT_DESKTOP=KDE

export _JAVA_AWT_WM_NONREPARENTING=1
# export GDK_BACKEND=x11
# export QT_QPA_PLATFORM=xcb

#cd /home/chewie
export XDG_SESSION_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=$HOME/.local/share/:$XDG_DATA_DIRS
export GOPATH=$HOME/gobook

#PATH=$PATH:/usr/libexec
PATH=$HOME/opt/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/.wayland_utils:$PATH
PATH=$HOME/gobook/bin:$PATH
export PATH
#add new path

export WORKON_HOME=~/Envs
source $HOME/.local/bin/virtualenvwrapper.sh


# pywal support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh
#source ~/.cache/wal/colors.sh

#export WLR_RENDERER=vulkan
#export WLR_RENDERER=gles2
#export WLR_DRM_NO_MODIFIERS=1
#export WLR_DRM_NO_ATOMIC=1
#systemd-cat --identifier=swaywm sway -c ~/.config/sway/config-opensuse >> sway.err


