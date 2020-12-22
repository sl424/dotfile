##################################################
# shared shell imported config 

[ -f "$HOME/.config/shrc" ] && source "$HOME/.config/shrc"
#source .extend.bashrc

##################################################
# ~/.bashrc
#

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} : ${PWD/#$HOME/\~}\007"'
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} : $(basename ${PWD/#$HOME/\~})\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*} : ${PWD/#$HOME/\~}\033\\"'
		;;
esac

# command line prompt user@host
if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
else
	PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"


