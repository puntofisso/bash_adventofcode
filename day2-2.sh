#!/bin/bash
tot=0
while read line
do
	
	l=`echo $line | awk -F"x" {'print $1;'}`
	w=`echo $line | awk -F"x" {'print $2;'}`
	h=`echo $line | awk -F"x" {'print $3;'}`
	
	

	min=$l
	skip=l
	if [ "$w" -lt "$min" ] ;
	then	
		min=$w
		skip=w
	fi
	if  [ "$h" -lt "$min" ] ;
	then
		min=$h
		skip=h
	fi

	min2=10000000

	for var in l w h
	do
		if [ "$var" = "$skip" ] ; 
		then
			:
		else
			varname=${!var}
			if [ "$varname" -lt "$min2" ] ;
			then
				min2=$varname
			fi
		fi
	done


	

	bow=$((l * w * h))
	length=$(($min + $min + $min2 + $min2))
	tot=$(($tot + $bow + $length))
		
done < day2.csv
echo $tot
