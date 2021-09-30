#!/bin/bash

ilosc_linii=20

for (( i=1; $i <= $ilosc_linii; i++ ))
do
	ilosc_liczb=$(($RANDOM % 7))
	#echo $ilosc_liczb
	j=1
	while [ $j -le $ilosc_liczb ]
	do
		echo -n $RANDOM >> liczba.txt
		echo -n ' ' >> liczba.txt
		j=$(($j+1))
	done
	echo >> liczba.txt
done
