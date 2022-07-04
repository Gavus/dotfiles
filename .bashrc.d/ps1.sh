#!/bin/bash

if [ -f "/run/.containerenv" ]; then
	TOOLBOX_NAME=$(cat /run/.containerenv | grep -oP "(?<=name=\")[^\";]+")
else
	TOOLBOX_NAME="\h"
fi

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

BROWN="\e[0;33m"
GREEN="\e[0;32m"
BLUE="\e[1;34m"
RED="\e[0;31m"
STOP_COLOR="\e[m"

export PS1="${BLUE}\u ${STOP_COLOR}at ${GREEN}${TOOLBOX_NAME} ${STOP_COLOR}in ${BROWN}\w ${STOP_COLOR}on ${RED}\$(parse_git_branch)${STOP_COLOR}\n\$ "
