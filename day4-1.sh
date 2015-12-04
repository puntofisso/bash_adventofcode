#!/bin/bash
key=ckczppom
i=0
while true
do
	string=$key$i
	out=`echo -n $string | md5sum`
	echo $i
	[[ $out =~ ^00000 ]] && echo "$i: $out" && exit
	(( i++ ))
done
