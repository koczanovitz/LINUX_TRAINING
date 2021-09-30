#!/bin/bash

#Utwórz skrypt, który wyświetli co n-tą linie w pliku. Ścieżka do pliku ma być podana jako pierwszy argument pozycyjny, a liczba n - jako drugi. Dodaj kontrolę poprawności wprowadzonych danych parametrów.

#ile agumentów podano?
if [ ! $# -eq 2 ]
then
	echo "Musisz podać dokładnie 2 argumenty!"
	exit 1
fi

#czy pierwszy argument jest ścieżką do pliku?
if [ ! -f $1 ]
then
	echo "Pierwszy argument musi być ścieżką do pliku!"
	exit 2
fi

#czy drugi argument jest liczbą?

if [ $2 -gt 0 ]
then	

nr_linii=1

while read line
do
	if [ $(($nr_linii % $2)) -eq 0 ]
	then	
		echo $line
	fi
	nr_linii=$(($nr_linii+1))
done < $1

else
	echo "Drugi argument musi być liczbą dodatnią."
	exit 2
fi
