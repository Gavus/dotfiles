# .bashrc

# Source global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Bash autocomplete.
if [ -f /etc/profile.d/bash_completion.sh ]; then
	. /etc/profile.d/bash_completion.sh
fi

# User specific environment.
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
