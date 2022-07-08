#!/bin/bash 

function forward-ip-port() {
	if test "$#" -lt 3; then
		echo "help: $0  ip src-port dest-port"
		return
	fi

	ip="$1"
	srcport="$2"
	destport="$3"

	nohup socat tcp-listen:"$destport",reuseaddr,fork tcp:"$ip":"$srcport" > /dev/null 2>&1 &
	echo "Started nohup socat $ip:$srcport to localhost:$destport. PID $!"
}