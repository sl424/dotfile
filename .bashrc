##################################################
# shared shell imported config 

[ -f "$HOME/.config/shrc" ] && source "$HOME/.config/shrc"
#[ -f "$HOME/.config/osc7" ] && source "$HOME/.config/osc7"
source $HOME/.local/bin/virtualenvwrapper.sh
#source .extend.bashrc

#source /etc/profile.d/modules.sh

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#__vte_osc7 () {
#  printf "\033]7;file://%s%s\033\\" "${HOSTNAME}" "${PWD}"
#}
#PROMPT_COMMAND="__vte_osc7" 


osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
    printf "\e]0;${USER}@${HOSTNAME%%.*} : $(basename ${PWD/#$HOME/\~})\e\\"
}
title() {
	echo -ne "\033]0;${USER}@${HOSTNAME%%.*} : $(basename ${PWD/#$HOME/\~})\007"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }osc7_cwd
#PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }title

##################################################
# ~/.bashrc
#
case ${TERM} in
	xterm*)
		#source "$HOME/.config/tmux.sh"
		;;
esac

# Change the window title of X terminals
#case ${TERM} in
#	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
#		#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} : ${PWD/#$HOME/\~}\007"'
#		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} : $(basename ${PWD/#$HOME/\~})\007"'
#		;;
#	screen*)
#		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*} : ${PWD/#$HOME/\~}\033\\"'
#		;;
#esac

# command line prompt user@host
if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
else
	PS1="\[\033[32m\][\W]\[\033[33m\]\$(parse_git_branch)\[\033[01;32m\] $\[\033[00m\] "
	#PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

#pywal colors
#(cat ~/.cache/wal/sequences &)
#source $HOME/.cache/wal/colors.sh

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -u checkwinsize

# disable linewrap
#setterm --linewrap off
#printf %b '\033[?7l'
#tput rmam

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend
HISTCONTROL=ignoreboth

# better yaourt colors
# export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"


. "$HOME/.cargo/env"
