#!/bin/bash -e

fv () {
	nvim $(find . -wholename "*$1*" -print | head -n 1)
}

