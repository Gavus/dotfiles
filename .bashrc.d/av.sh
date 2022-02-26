#!/bin/bash -e

av () {
	if test "$#" -ne 1; then
		echo "Searches for a text string and open up in nvim"
		echo "av <text to search for>"
	else
		ag $1 | awk -F: 'NR==1{printf "%s +%s\n", $1, $2}' | xargs -r nvim
	fi
}
