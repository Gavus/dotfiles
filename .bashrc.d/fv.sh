#!/bin/bash -e

fv () {
	if test "$#" -ne 1; then
		echo "Searches for a file and opens it with nvim"
		echo "fv <file-to-search-for>"
	else
		nvim $(find . -wholename "*$1*" -print | head -n 1)
	fi
}

