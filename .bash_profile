#
# ~/.bash_profile
#

#[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	#sudo systemctl restart systemd-logind
#  XKB_DEFAULT_LAYOUT=us exec sway
#fi

export MESA_LOADER_DRIVER_OVERRIDE=iris
#export MESA_LOADER_DRIVER_OVERRIDE=zink

export LIBVA_DRIVER_NAME=iHD
#export LIBVA_DRIVER_NAME=i965

export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1
# export MOZ_ACCELERATED=1

export QT_QPA_PLATFORM=wayland

#INPUT_METHOD=ibus
#GTK_IM_MODULE=ibus
#QT_IM_MODULE=ibus
#XMODIFIERS=@im=ibus

#XDG_CURRENT_DESKTOP=KDE

#cd /home/chewie

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
