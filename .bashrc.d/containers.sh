#!/bin/bash -e

docker=docker

alias t="toolbox"
alias te="toolbox enter"
alias tc="toolbox create"
alias tl="toolbox list"

if test -f "$(which podman)"; then
	docker=podman
fi

if test -f /run/.containerenv; then
	docker="flatpak-spawn --host podman"
	podman="flatpak-spawn --host podman"
fi

de() {
	if test "$#" -ne 1; then
		echo "de <container-name/container-id>"
	else
		$docker exec -it $1 bash
	fi
}

alias docker=$docker
