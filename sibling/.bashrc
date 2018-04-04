
# If not running interactively, don't do anything
[ -z "$PS1" ] && return




alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'
alias uuuuuu='cd ../../../../../..'
alias uuuuuuu='cd ../../../../../../..'

alias ls='ls --color=auto'
alias s='ls -la'
alias l='ls -latr'

alias vi='vim'

alias hi='history'
alias tmp='cd /tmp/ '

alias docustom='   . ~/.bashrc '
alias vicustom='  vi ~/.bashrc '
alias seecustom='cat ~/.bashrc '

alias grepp='grep --color=auto -B10 -A10 '

alias getd="echo `date '+%Y%m%d_%H%M%S'` "

alias gg='echo "git clone $1"; git clone '

alias ver='echo "uname -m && uname -r && cat /etc/*release";uname -m && uname -r && cat /etc/*release '


alias np='echo "netstat -peanut "; netstat -peanut '


export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

export PATH=${HOME}/bin:$PATH:.

export EDITOR=/usr/bin/vi

export CC=cc


# set tab to size 4 to match vi setting in ~/.vimrc so when cat text-file output is same
tabs -4

alias shot='tail -555 $1'


# ------------ following is mostly original 


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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




# function parse_git_branch {
#     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
# }
# PS1="\[\e[32m\]\$(parse_git_branch)\[\e[34m\]\h:\W \$ \[\e[m\]"
# export PS1


if [ "$color_prompt" = yes ]; then
#	PS1='[\u@\h \W$(__docker_machine_ps1 " [%s]")]\$ ' # shows docker machine
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \$ '

    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] ✿ '
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] ⊕ '
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] λ '
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] Ø '
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] ∈ '
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31m●\e[0m '  # "\e[1;31m●\e[0m" prints a red circle
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31m∈\e[0m '  # "\e[1;31m●\e[0m"
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;32m∈\e[0m '  # "\e[1;31m●\e[0m"
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;32m🐤 \e[0m '  #  green chick
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31m🐤 \e[0m '  # "\e[1;31m●\e[0m"  prints a red chick
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;33m🐤 \e[0m '  # "\e[1;31m●\e[0m"  prints a yellow chick
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31m♥\e[0m '  #  red heart
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31m→\e[0m '  # "\e[1;31m●\e[0m"
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31m☺\e[0m '  # "\e[1;31m●\e[0m"    smiley face
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31m→\e[0m '  # "\e[1;31m●\e[0m"
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31mφ\e[0m '  # "\e[1;31m●\e[0m"
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31mφ\e[0m '  # "\e[1;31m●\e[0m"
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;31m↻\e[0m '  # "\e[1;31m●\e[0m"
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;32m↻\e[0m '  # "\e[1;31m●\e[0m"
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \e[1;32m$\e[0m '  # "\e[1;31m●\e[0m"

		#   http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html

# Color   fg  bg
# ------  --  --
# Black   30  40
# Red     31  41
# Green   32  42
# Yellow  33  43
# Blue    34  44
# Magenta 35  45
# Cyan    36  46
# White   37  47



else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w✿ '
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
# alias la='ls -A'
# alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth
# following in attempt to permit up arrow to retrieve prior cmd with leading spaces
# HISTCONTROL=ignoredups:ignorespace
HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
# shopt -s histappend


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


#	hex editor :        wxHexEditor   https://en.wikipedia.org/wiki/Comparison_of_hex_editors
#						Ghex
#										http://home.gna.org/bless/
#	R studio :          rstudio
#   ufraw-batch --wb=camera --rotate=camera --out-type=jpeg --out-path=jpeg/ nef/*.NEF
#	source editor		/opt/sublime_text/sublime_text
#	beast :				digital audio workstation - https://testbit.eu/wiki/Beast_Home
#	lmms				daw
#	bitwig-studio		Berlin created digital audio workstation written in java - slick GUI
#	urxvt				cool terminal emulator - better than xterm   http://crunchbanglinux.org/wiki/urxvt
#													http://software.schmorp.de/pkg/rxvt-unicode.html
#	WebStorm			javascript IDE  https://www.jetbrains.com/webstorm
#	https://atom.io/	javascript IDE
#   Voxelyze is a general purpose multi-material voxel simulation library for static and dynamic analysis - used by Jeff Clune
#	chrome embedded framework - chrome v8 in a box - ~/other_src/cef_binary_3.2171.1979_linux64_client/Release/cefclient
#							needs    sudo ln -sf /lib/$(arch)-linux-gnu/libudev.so.1 /lib/$(arch)-linux-gnu/libudev.so.0
#	nsight				nvidia CUDA eclipse plugin ... installed ubuntu package :   nvidia-cuda-toolkit then ... nvidia-nsight
#	fsv					filesystem 3D visualization https://github.com/mcuelenaere/fsv
#	brackets			javascript editor
#	mumble				VoIP community 
#	gpick				color picker
#	rxvt-unicode		terminal emulator ... low memory usage
#	tmux				terminal multiplexers
#	ultraedit			editor
#	thunar				file manager ... sudo apt-get install thunar



# ...

export TERM=xterm-256color


