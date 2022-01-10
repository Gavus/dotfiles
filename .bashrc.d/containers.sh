#!/bin/bash -e

alias t="toolbox"
alias te="toolbox enter"
alias tc="toolbox create"
alias tl="toolbox list"

de() {
	if test "$#" -ne 1; then
		echo "de <container-name/container-id>"
	else
		docker exec -it $1 bash
	fi
}

if test "$(which podman 2>/dev/null)"; then
	alias docker="podman"
fi

if test -f /run/.containerenv; then
	alias docker="flatpak-spawn --host podman"
	alias podman="flatpak-spawn --host podman"
fi
