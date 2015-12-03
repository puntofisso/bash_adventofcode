#!/bin/sh
tot=0
while read line
do
	
	l=`echo $line | awk -F"x" {'print $1;'}`
	w=`echo $line | awk -F"x" {'print $2;'}`
	h=`echo $line | awk -F"x" {'print $3;'}`
	
	a=$(($l * $w))
	b=$(($w * $h))
	c=$(($h * $l))


	min=$a

	if [ "$b" -lt "$min" ] ;
	then	
		min=$b
	fi
	if  [ "$c" -lt "$min" ] ;
	then
		min=$c
	fi


	area=$((2*a + 2*b + 2*c))
	plus=$(($area + $min))
	tot=$(($tot + $plus))
done < day2.csv
echo $tot
