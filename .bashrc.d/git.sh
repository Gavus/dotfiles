#!/bin/bash -e

git-home() {
	basename `git rev-parse --show-toplevel`
}
