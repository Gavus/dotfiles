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
GREEN="\e[0;32m"
RED="\e[0;31m"
BROWN="\e[0;33m"
STOP_COLOR="\e[m"

export PS1="${GREEN}\u@${TOOLBOX_NAME} ${BROWN}\w ${RED}\$(parse_git_branch)${STOP_COLOR}\n\$ "
