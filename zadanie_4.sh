#!/bin/bash

while read line
do
	min=`echo "$line" | tr ' ' '\n' | tr -s '\n' | sort -n | head -1`
	max=`echo "$line" | tr ' ' '\n' | tr -s '\n' | sort -n | tail -1`
	echo "min: $min, max: $max" | column -t
done < liczba.txt

ilosc_linii=`cat liczba.txt | egrep -o '[0-9]+' | wc -l`
mediana=`cat liczba.txt | egrep -o '[0-9]+' | sort -n | head -n $(($ilosc_linii/2)) | tail -1`

echo "Mediana dla pliku liczba.txt to: $mediana."
