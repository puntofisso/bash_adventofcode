#!/bin/bash
count=0
while IFS= read -r -n1 char
do
       	# display one character at a time
	[ -z $char ] && continue
	[ $char == "(" ] && (( count++ ))
	[ $char == ")" ] && (( count-- ))
	echo "$count"
done < day1.csv

