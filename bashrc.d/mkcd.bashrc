#!/bin/bash

function mkcd() {
	if test "$#" -ne 1; then
	  >&2 echo "mkcd only allows 1 argument"
	  return
	fi
	
	mkdir -p "$1"
	cd "$1" || >&2 echo "Could not cd to $1"
}
