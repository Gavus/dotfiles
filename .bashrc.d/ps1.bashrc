#!/bin/bash

PROMPT_COMMAND=_prompt_command # Function to generate PS1 after CMDs.

function _prompt_command() {
	local _exit="$?"
	local brown="\e[0;33m"
	local green="\e[0;32m"
	local blue="\e[1;34m"
	local red="\e[0;31m"
	local stop_color="\e[m"
	local hostname="${green}\h${stop_color}"
	local branch=""
	local user="${blue}\u${stop_color}"
	local workdir="${brown}\w${stop_color}"
	local newline="\n\$"

	if test -f "/run/.containerenv" || test -f "/.dockerenv"; then
		user="🐋 ${user}"
		source /etc/os-release
		hostname="${green}${ID}-${VERSION_ID}${stop_color}"
	fi

	if test "$_exit" -eq 0; then
		__exit="[${green}0${stop_color}]"
	else
	__exit="[${red}${_exit}${stop_color}]"
	fi

	PS1="${user} ${hostname} ${workdir}"

	if test "$(git rev-parse --is-inside-work-tree 2>/dev/null)"; then
		branch="${red}$(git rev-parse --abbrev-ref HEAD)${stop_color}"
		PS1="${PS1} ${branch}"
	fi
	PS1="${PS1} ${__exit} ${newline} "
}
