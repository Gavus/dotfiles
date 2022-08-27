#!/bin/bash

PROMPT_COMMAND=_prompt_command # Function to generate PS1 after CMDs.

function _prompt_command() {
	local _exit="$?"
	local yellow="\e[1;33m"
	local green="\e[1;32m"
	local blue="\e[1;34m"
	local red="\e[1;31m"
	local purple="\e[1;35m"
	local cyan="\e[1;36m"
	local stop_color="\e[m"
	local user="${purple}\u${stop_color}"
	local distro=""
	local hostname="${cyan}\h${stop_color}"
	local branch=""
	local workdir="${green}\w${stop_color}"
	local __exit="${red}0${stop_color}"
	local newline="\n\$"
	PS1=""

	if test -f "/run/.containerenv" || test -f "/.dockerenv"; then
		PS1="${PS1}🐋 "
	fi

	source /etc/os-release
	distro="${blue}${ID}-${VERSION_ID}${stop_color}"
	
	PS1="${PS1}${user} ${distro} ${hostname} ${workdir}"

	if test "$(git rev-parse --is-inside-work-tree 2>/dev/null)"; then
		branch="${yellow}$(git rev-parse --abbrev-ref HEAD)${stop_color}"
		PS1="${PS1} ${branch}"
	fi

	PS1="${PS1} ${__exit} ${newline} "
}
