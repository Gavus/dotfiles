# shellcheck disable=1091,1090

# Source global definitions.
if [[ -f "/etc/bashrc" ]]; then
    source "/etc/bashrc"
fi

# User specific aliases and functions
if [[ -d "$HOME/.bashrc.d" ]]; then
    for rc in "$HOME/.bashrc.d/"*".bash"; do
        source "$rc"
    done
    unset rc
fi
