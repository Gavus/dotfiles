av () {
	ag $1 | awk -F: 'NR==1{printf "%s +%s\n", $1, $2}' | xargs -r nvim
}
