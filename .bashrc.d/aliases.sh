#!/bin/bash -e

alias vim="nvim"
alias g="git"
alias l="ls -lah"
alias vimwiki="vim -c VimwikiIndex"

# Open nvim where git detected changes.
vg() {
	nvim +"Git difftool $*"
}

# Open nvim and ag search.
va() {
	nvim +"Ag $*"
}
