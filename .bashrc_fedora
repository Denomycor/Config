# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#user
export PS1="\[\033[38;5;214m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;215m\]:\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;214m\]\w\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

alias nv='nvim'
alias privip='hostname -I'
alias pubip='curl ifconfig.me && echo'
