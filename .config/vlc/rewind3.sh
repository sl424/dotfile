#!/usr/bin/env sh

port=50500

time=$1

add() { 
	while read get_time; do 
		if [[ $get_time -gt $time ]]; then
			echo "$get_time - $time" | bc; 
		else
			echo "0"
		fi
	done < /dev/stdin 
}

if [[ $time -eq 0 ]]; then 
	echo pause | ncat localhost $port
else 
	ncat localhost $port <<< get_time |  grep -o '> [0-9]*' | grep -o '[0-9]*' | add | xargs echo "seek $1" | ncat localhost $port
fi

#ncat localhost 50000 <<< get_time | sed -e "s/[\r>]//g" - |  grep -E '(^[^0-9])' | add | xargs echo "seek $1" | ncat localhost 50000 
#echo get time | ncat localhost 50000 | tail -n 2 | sed -e "s/\r//g" - | cut -d ' ' -f 2 | xargs echo "seek $1" | ncat localhost 50000 
