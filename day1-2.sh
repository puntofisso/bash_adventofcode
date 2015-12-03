#!/bin/bash
count=0
pos=0
while IFS= read -r -n1 char
do
       	# display one character at a time
	[ $char == "(" ] && (( count++ ))
	[ $char == ")" ] && (( count-- ))
	echo "$count at position $pos"
	(( pos++ ))
done < day1.csv

