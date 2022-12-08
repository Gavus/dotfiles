#!/bin/bash
# shellcheck disable=2016,1091

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
	local container=""
	local user="\u"
	local distro=""
	local hostname="\h"
	local branch=""
	local workdir="\w"
	local newline="\n≻"
	PS1=""

	if test -f "/run/.containerenv" || test -f "/.dockerenv"; then
		container="🐋 "
	fi

	source /etc/os-release
	distro="${ID}-${VERSION_ID}"

	source "$HOME/.bashrc.d/git-prompt.bashrc"
	branch='$(__git_ps1 " %s ")'

	PS1="${container}${purple}${user} ${blue}${distro} ${cyan}${hostname} \
${green}${workdir} ${yellow}${branch}${red}${_exit}${stop_color}${newline} "
}
