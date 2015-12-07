#!/bin/bash
line=1
lenght=`wc -l day7.csv | awk {'print $1'}`
echo $lenght
exit

function solve($line) {
	instr=`echo $line | awk -F"->" {'print $1;'}`
        res=`echo $line | awk -F"->" {'print $2;'}`
	
	if [[ $instr =~ 'AND' ]] ; 
	then
		param1=`echo $instr | awk -F"AND" {'print $1;'}`
		param2=`echo $instr | awk -F"AND" {'print $2;'}`
		eval $res=solve(
	elif [[ $instr =~ 'NOT' ]] ;
	then
		 echo "NOT"
	elif [[ $instr =~ 'RSHIFT' ]] ;
	then
		param1=`echo $instr | awk -F"AND" {'print $1;'}`
		param2=`echo $instr | awk -F"AND" {'print $2;'}`
	elif [[ $instr =~ 'OR' ]] ;
	then
		param1=`echo $instr | awk -F"AND" {'print $1;'}`
		param2=`echo $instr | awk -F"AND" {'print $2;'}`
	elif [[ $instr =~ 'LSHIFT' ]];
	then
		param1=`echo $instr | awk -F"AND" {'print $1;'}`
		param2=`echo $instr | awk -F"AND" {'print $2;'}`
	else
		echo 'ASSIGN';
	fi

}

while read line
do
	solve($line)


		#eval $res
done < day7.csv
echo "A is $a"
