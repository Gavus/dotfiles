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

	if test "$(git rev-parse --is-inside-work-tree 2>/dev/null)"; then
		branch=" on ${red}$(git rev-parse --abbrev-ref HEAD)${stop_color}"
	fi

	if test -f "/run/.containerenv"; then
		hostname="${green}$(grep -oP "(?<=name=\")[^\";]+" /run/.containerenv)${stop_color}"
	fi

	if test "$_exit" -eq 0; then
		__exit="[${green}0${stop_color}]"
	else
	__exit="[${red}${_exit}${stop_color}]"
	fi

	PS1="${user} at ${hostname} in ${workdir}${branch} ${__exit} ${newline} "
}
