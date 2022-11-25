#!/bin/bash

function mkcd() {
	if test "$#" -ne 1; then
	  echoerr "$0 Only allows 1 argument"
	  return
	fi
	
	mkdir -p "$1"
	cd "$1" || echoerr "Could not cd to $1"
}
