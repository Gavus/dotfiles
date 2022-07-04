# Source global definitions.
if test -f /etc/bashrc; then
	. /etc/bashrc
fi

# User specific aliases and functions
if test -d ~/.bashrc.d; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
