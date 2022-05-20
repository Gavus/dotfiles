alias g="git"
alias gs="echo 'Did you mean g s?'; g s"
alias l="ls -lah"
alias t="toolbox"
alias tc="toolbox create"
alias te="toolbox enter"
alias tl="toolbox list"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias vimwiki="vim -c VimwikiIndex"

# Open nvim where git detected changes.
vg() {
	nvim +"Git difftool $@"
}

# Open nvim and ag search.
va() {
	nvim +"Ag $@"
}
