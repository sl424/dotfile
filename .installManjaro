#!/usr/bin/env sh

giturl="https://github.com/sl424/installManjaro-.git" 

pkgs="\
alsa-utils					  thinkfan                     \
arch-install-scripts				  tlp                          \
brightnessctl					                               \
elinks						  ttf-font-awesome             \
git						  ttf-inconsolata              \
i3status					  ttf-material-design-icons    \
intel-gpu-tools					  vim                          \
intel-media-driver				  vlc                          \
libva-utils					  w3m                          \
nerd-fonts-inconsolata				  wget                         \
openssh						  wpa_supplicant               \
palemoon-bin					  wqy-microhei                 \
redshift-wlr-gamma-control			  xorg-server-xwayland         \
rxvt-unicode					  xorg-xrdb                    \
sudo						                               \
sway                                                                           \
"                                                                              

#skypeforlinux-stable-bin                                                       

# 0 grab a cup of irish breakfast tea and execute:
##################################################
function pkgs(){
	pacman -S --noconfirm --needed yay
	for p in $pkgs; do
		yay -S --noconfirm --needed $p
	done
}

# customize fresh install

# 1.1 clone dotfile repository
##################################################
function dotfile(){
	git clone --separate-git-dir=$HOME/.dotfiles $giturl $HOME/tmp
	for file in $HOME/tmp/*; do
		if [ -f "$HOME/$file" ]; then
			mv "$HOME/$file" "$HOME/$file.orig"
			cp $file "$HOME/$file"
		fi
	done
	rm -r $HOME/tmp/
}

# 1.2 hardware tweaks
##################################################
lowbat_dir="/etc/udev/rules.d/99-lowbat.rules"
lowbat="# Suspend the system when battery level drops to 5% or lower \n \
SUBSYSTEM=='power_supply', ATTR{status}=='Discharging', ATTR{capacity}=='[0-5]', RUN+='/usr/bin/systemctl suspend'   \n \
"                                                                                                                    

t450s_dir="/etc/modprobe.d/thinkpad-t450s.conf"
t450s="# change the default sound card of the same name                           \n\
options snd_hda_intel index=1,0                                                   \n\
options snd_hda_intel power_save=1                                                \n\
# enable thinkpad_acpi fan                                                        \n\
options thinkpad_acpi fan_control=1                                               \n\
options i915 modeset=1                                                            \n\
options i915 enable_psr=1                                                         \n\
"                                                                                 

wpa_dir="/etc/wpa_supplicant/wpa_wireless.conf"
wpa="#ctrl_interface=/var/run/wpa_supplicant                                       \n\
ctrl_interface=/run/wpa_supplicant                                                 \n\
ctrl_interface_group=wheel                                                         \n\
update_config=1                                                                    \n\
eapol_version=1                                                                    \n\
ap_scan=1                                                                          \n\
fast_reauth=1                                                                      \n\
# wpa_passphrase MyNetwork SuperSecretPassphrase > /etc/wpa_supplicant/wpa.conf    \n\
#network={                                                                         \n\
#	ssid='home wifi'                                                           \n\
#	psk=pasphrase                                                              \n\
#}                                                                                 \n\
#network={                                                                         \n\
#	ssid='open wifi name'                                                      \n\
#	key_mgmt=NONE                                                              \n\
#}                                                                                 \n\
#network={                                                                         \n\
#	ssid='secured university'                                                  \n\
#	key_mgmt=WPA-EAP                                                           \n\
#	eap=PEAP                                                                   \n\
#	phase2='auth=MSCHAPV2'                                                     \n\
#	identity='user_name'                                                       \n\
#	password='passwd'                                                          \n\
#}                                                                                 \n\
"

function hwmod(){
	echo -e $lowbat >> $lowbat_dir
	echo -e $t450s >> $t450s_dir
	echo -e $wpa >> $wpa_dir
 	cp /usr/share/doc/thinkfan/examples/thinkfan.conf.simple /etc/thinkfan.conf
	sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
	systemctl enable systemd-networkd
	systemctl enable systemd-resolved
	systemctl enable tlp
	systemctl enable thinkfan
	systemctl enable wpa_supplicant
}


# 2. google cloud, android, etc.
##################################################
	# - Google Cloud SDK
	# - android-studio 

# 3. custom packages
##################################################
  # compile mupdf https://github.com/sl424/mupdf.git 
  # compile ibus-rime https://github.com/sl424/ibus-rime.git


# main, exec all or run each manually
##################################################
if [ ! -z $1 ]; then
	$1
else
	pkgs
	dotfile
fi

##################################################
#git clone --separate-git-dir=$HOME/.dotfiles /path/to/repo $HOME/myconf-tmp
#cp $HOME/tmp/.gitmodules ~  # If you use Git submodules
#rm -r ~.dotfiles-tmp/

# xargs -a .Packages.diff pacman -S --noconfirm --needed

