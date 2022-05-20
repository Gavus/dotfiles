function git-home() {
	basename `git rev-parse --show-toplevel`
}
