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
	local user="\u"
	local distro=""
	local hostname="\h"
	local branch=""
	local workdir="\w"
	local newline="\n\$"
	local exitcolor="${yellow}"
	PS1=""

	if test -f "/run/.containerenv" || test -f "/.dockerenv"; then
		PS1="${PS1}🐋 "
	fi

	source /etc/os-release
	distro="${ID}-${VERSION_ID}"
	
	PS1="${PS1}${purple}${user} ${blue}${distro} ${cyan}${hostname} ${green}${workdir}"

	if test "$(git rev-parse --is-inside-work-tree 2>/dev/null)"; then
		branch="$(git rev-parse --abbrev-ref HEAD)${stop_color}"
		PS1="${PS1} ${yellow}${branch}"
		exitcolor="${red}"
	fi

	PS1="${PS1} ${exitcolor}${_exit} ${stop_color}${newline} "
}
