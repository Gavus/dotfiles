if test -f "/etc/profile.d/bash_completion.sh"; then
    source "/etc/profile.d/bash_completion.sh"
elif test -f "/usr/share/bash-completion/bash_completion"; then
    source "/usr/share/bash-completion/bash_completion"
fi
