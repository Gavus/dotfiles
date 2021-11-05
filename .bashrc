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

export PATH="$PATH:~/.local/share/nvim/lspinstall/*/node_modules/.bin/"

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

alias vim="nvim"
alias g="git"
alias te="toolbox enter"
alias tc="toolbox create"
alias l="ls -lah"
alias dc="docker-compose"
alias vimwiki="vim -c VimwikiIndex"


export PS1="[\u@\h] [\w] [$(git rev-parse --abbrev-ref HEAD)]\n\$ "
export VISUAL=nvim
export EDITOR="$VISUAL"
export UID
export GID=$(id -g)
