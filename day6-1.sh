#!/bin/bash
declare -A matrix
rows=999
cols=999

# parse actions
actionnum=0
while read line
do
	(( actionnum++ ))
	throughsplit1=`echo $line | awk -F"through" {'print $1'}`
	throughsplit2=`echo $line | awk -F"through" {'print $2'}`
	
	[[ "$throughsplit1" =~ "toggle" ]] && action=t && taken=`echo $throughsplit1 | awk  {'print $2'}` 
	[[ "$throughsplit1" =~ "turn off" ]] && action=d && taken=`echo $throughsplit1 | awk  {'print $3'}`
	[[ "$throughsplit1" =~ "turn on" ]] && action=u && taken=`echo $throughsplit1 | awk  {'print $3'}`

	min_x=`echo $taken | awk -F"," {'print $1'}`
	min_y=`echo $taken | awk -F"," {'print $2'}`
	max_x=`echo $throughsplit2 | awk -F"," {'print $1'}`
	max_y=`echo $throughsplit2 | awk -F"," {'print $2'}`

	echo "$actionnum is $action from $min_x,$min_y to $max_x,$max_y" 

	for i in `seq $min_x $max_x`
	do
		for j in `seq $min_y $max_y`
		do	
			cur=${matrix[$i,$j]}
			if [ -z "$cur" ];
				then 
					cur=0
			fi
			[[ $action == 'u' ]] && matrix[$i,$j]=1 #&& echo "U act $i $j"
			[[ $action == 'd' ]] && matrix[$i,$j]=0 #&& echo "D act $i $j"
			[[ $action == 't' ]] && [[ $cur -eq 0 ]] && matrix[$i,$j]=1 #&& echo "T U act $i $j"
			[[ $action == 't' ]] && [[ $cur -eq 1 ]] && matrix[$i,$j]=0 #&& echo "T D act $i $j"
		done
	done
done < day6.csv

echo "Finished taking actions"
#Printout
sum=0
for i in `seq 0 $rows`
do
        echo "Summing row $i"
        for j in `seq 0 $cols`
        do
               #echo $i, $j: ${matrix[$i,$j]}
               [[ ${matrix[$i,$j]} -eq 1 ]] && (( sum++ ))
        done
done

rm -f sum.txt
echo "TOTAL: $sum" >> sum.txt
