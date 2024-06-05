if test -d "$HOME/bin"; then
    PATH="$HOME/bin:$PATH"
fi

if test -d "$HOME/.local/bin"; then
    PATH="$HOME/.local/bin:$PATH"
fi

export MANPATH="$MANPATH:/home/gustajo/.local/share/man"
export PATH
