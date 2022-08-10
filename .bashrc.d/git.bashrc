#!/bin/bash

alias g="git"
alias gs="echo 'Did you mean g s?'; g s"

function git-home() {
	basename "$(git rev-parse --show-toplevel)"
}
