#!/bin/bash -e

if [ -f "/run/.containerenv" ]; then
	TOOLBOX_NAME="$(cat /run/.containerenv | grep 'name=' | sed -e 's/^name="\(.*\)"$/\1/')"
elif [ -f "/.dockerenv" ]; then
	TOOLBOX_NAME="docker-$(cat /etc/os-release | grep 'VERSION=' | sed -e 's/^VERSION="\(.*\)"$/\1/')"
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
