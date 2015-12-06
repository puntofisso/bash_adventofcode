#!/bin/bash
declare -A matrix
rows=1000
cols=1000

#all lights are off
for ((i=1;i<=rows;i++)) do
    for ((j=1;j<=columns;j++)) do
        matrix[$i,$j]=0
    done
done

echo $matrix
exit


while read line
do
	echo $line
done < day6.csv
