#!/bin/bash
x_santa=0
y_santa=0

x_robosanta=0
y_robosanta=0
echo "($x_santa,$y_santa)"

i=0
while IFS= read -r -n1 char
do
	[ -z $char ] && continue


	if [[ `expr $i % 2` == 0 ]];
	then
 	       [ $char == "^" ] && (( y_santa++ ))
	        [ $char == "v" ] && (( y_santa-- )) 
	        [ $char == ">" ] && (( x_santa++ )) 
	        [ $char == "<" ] && (( x_santa-- )) 
		echo "($x_santa,$y_santa)"
	else
	        [ $char == "^" ] && (( y_robosanta++ )) 
	        [ $char == "v" ] && (( y_robosanta-- )) 
	        [ $char == ">" ] && (( x_robosanta++ )) 
	        [ $char == "<" ] && (( x_robosanta-- )) 
		echo "($x_robosanta,$y_robosanta)"
	fi


	(( i++ ))
done < day3.csv
