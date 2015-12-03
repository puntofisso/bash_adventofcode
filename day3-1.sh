#!/bin/bash
x=0
y=0
echo "($x,$y)"
while IFS= read -r -n1 char
do
        # display one character at a time
	[ -z $char ] && continue
        [ $char == "^" ] && (( y++ )) 
        [ $char == "v" ] && (( y-- ))
        [ $char == ">" ] && (( x++ ))
        [ $char == "<" ] && (( x-- ))
        echo "($x,$y)"
done < day3.csv
