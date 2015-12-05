#!/bin/bash
nice=0
while read line
do	

	if echo $line | grep [aeiou].*[aeiou].*[aeiou] | grep -E '(.)\1' | egrep -v '(ab|cd|pq|xy)'
	then
		(( nice++ ))
	fi

done < day5.csv
echo $nice
