#!/bin/bash

function host() {
	if test "$(which flatpak-spawn)"; then
		flatpak-spawn --host "$@"
	else
		/usr/libexec/flatpak-xdg-utils/flatpak-spawn --host "$@"
	fi
}
