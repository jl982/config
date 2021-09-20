# ~/.bashrc: executed by bash(2) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lh='ll | egrep " \.[^ /]+$"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

alias '..=cd ..'
alias '...=cd ../..'
alias '....=cd ../../..'
alias '.....=cd ../../../..'
alias '......=cd ../../../../..'
alias 'cp=cp -a'
alias 'm=make'
alias 'mi=make && make install'
alias 'mm=make -j 4'
alias 'mmi=make -j 4 && make install'
alias 'mc=make clean'

alias xclip='xclip -selection c'
alias ocaml='rlwrap ocaml'
alias csc='cs3110 compile'
alias csr='rlwrap cs3110 run'

alias vol='amixer set Master'
alias doff='xset dpms force off'
alias doffl='gnome-screensaver-command -l && xset dpms force off'
alias sus='gnome-screensaver-command -l && dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend'
alias nmr='sudo service network-manager restart'
alias xr='xrandr --output LVDS1 --auto && xrandr --output VGA1 --auto --right-of LVDS1'
alias wperf='dd bs=1M count=512 if=/dev/zero of=test conv=fdatasync'
alias rperf='sudo hdparm -tT /dev/sda2'
alias tk='tail /var/log/kern.log'

export PATH=/home/jianneng/.opam/4.01.0/bin:/home/jianneng/Applications/java/bin:/home/jianneng/Applications/scala/bin:${PATH}
export JAVA_HOME=/home/jianneng/Applications/java
export SPARK_HOME=/home/jianneng/Documents/spark
export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m"

export PS1="\[\e[1;32m\]\w (\t)\n$\[\e[0m\] "
export EDITOR=vim

# Hyperdex
#export PATH=/home/jianneng/Documents/wtf/install/bin:${PATH}
#export PKG_CONFIG_PATH=/home/jianneng/Documents/wtf/install/lib/pkgconfig

alias zhc='cd ~/Documents/wtf/zmisc/hc && hyperdex coordinator -f -l 127.0.0.1 -p 1982'
alias zhd='cd ~/Documents/wtf/zmisc/hd && hyperdex daemon -f --listen=127.0.0.1 --listen-port=2012 --coordinator=127.0.0.1 --coordinator-port=1982 --data=.'
alias zwc='cd ~/Documents/wtf/zmisc/wc && wtf coordinator -l 127.0.0.1 -p 1981 -f -D .'
alias zwd1='cd ~/Documents/wtf/zmisc/wd/1 && wtf daemon -c 127.0.0.1 -P 1981 -f -D . -l 127.0.0.1 -p 1901 -M ./data/metadata'
alias zwd2='cd ~/Documents/wtf/zmisc/wd/2 && wtf daemon -c 127.0.0.1 -P 1981 -f -D . -l 127.0.0.1 -p 1902 -M ./data/metadata'
alias zwd3='cd ~/Documents/wtf/zmisc/wd/3 && wtf daemon -c 127.0.0.1 -P 1981 -f -D . -l 127.0.0.1 -p 1903 -M ./data/metadata'
alias zwd4='cd ~/Documents/wtf/zmisc/wd/4 && wtf daemon -c 127.0.0.1 -P 1981 -f -D . -l 127.0.0.1 -p 1904 -M ./data/metadata'

# For now, for CS 3110 PS4
export LD_LIBRARY_PATH=~/.opam/system/lib/stublibs/

alias ed="rlwrap ed -p:"

# OPAM configuration
. /home/jianneng/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Utilities
psl() {
    ps "$@" | less
}

psv() {
    ps "$@" | vim -
}

# Colorized man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

