#
# ~/.bash_profile
#

#[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	#sudo systemctl restart systemd-logind
#  XKB_DEFAULT_LAYOUT=us exec sway
#fi

#export MESA_LOADER_DRIVER_OVERRIDE=iris
#export MESA_LOADER_DRIVER_OVERRIDE=zink

#export LIBVA_DRIVER_NAME=iHD
export LIBVA_DRIVER_NAME=i965

export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1
# export MOZ_ACCELERATED=1

export QT_QPA_PLATFORM=wayland

#INPUT_METHOD=ibus
#GTK_IM_MODULE=ibus
#QT_IM_MODULE=ibus
#XMODIFIERS=@im=ibus

#XDG_CURRENT_DESKTOP=KDE

_JAVA_AWT_WM_NONREPARENTING=1
#GDK_BACKEND=x11
#QT_QPA_PLATFORM=xcb

#cd /home/chewie

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export GOPATH=$HOME/gobook

PATH=/usr/libexec:$PATH
PATH=$HOME/opt/bin:$HOME/bin:$HOME/.local/bin:$PATH
PATH=$HOME/.wayland_utils:$HOME/script:$PATH
export PATH
#add new path

export WORKON_HOME=~/Envs
source $HOME/.local/bin/virtualenvwrapper.sh

# If running from tty1 start sway
#if [ "$(tty)" = "/dev/tty1" ]; then
#	#exec WLR_DRM_DEVICES=/dev/dri/card0 sway -c .config/sway/config-fedora 2> sway.err
#fi
