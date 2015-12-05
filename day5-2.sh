#!/bin/bash
nice=0
while read line
do	
	if echo $line | grep -E '(.).\1' | grep -E '(.)(.).*\1\2'
	then
		(( nice++ ))
	fi
	
done < day5.csv
echo $nice
