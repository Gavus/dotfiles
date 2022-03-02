#!/bin/bash -e

fgrep() {
	if test "$#" -ne 3; then
		echo "$0 <path-to-search-in> <filename-to-search-for> <text-to-search-for-within-file>"
	else
		find $1 -type f -name "$2" -exec grep "$3" {} -Hn --color \;
	fi
}

