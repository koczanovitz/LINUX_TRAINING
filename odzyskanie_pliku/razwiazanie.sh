#!/bin/bash

#wyszukiwanie odpowiednich plików i policzenie sum kontrolnych
find -type f -name '[0-9]*' -exec md5sum {} \; | sort > sumy_wszystkie

#posortowanie wartości w plikach dane*.txt w celu późniejszego użycia joina
cat dane1.txt | sort > sort_dane1.txt
cat dane2.txt | sort > sort_dane2.txt

#połączenie zawartości dwóch plików - join
join sumy_wszystkie sort_dane1.txt > p1_wszystkie.txt
join sumy_wszystkie sort_dane2.txt > p2_wszystkie.txt

#stworzenie zmiennej zawierającej kolejność wpisywania do pliku tymczasowego
P1=$(cat p1_wszystkie.txt | sort -k3 | cut -d ' ' -f2 | tr '\n' ' ')
P2=$(cat p2_wszystkie.txt | sort -k3 | cut -d ' ' -f2 | tr '\n' ' ')

#utworzenie tymczasowego połączonego pliku
for i in $P1
do
	cat $i >> P1_final.txt
done


for i in $P2
do
        cat $i >> P2_final.txt
done

#Utworzenie zmiennych przechowujących sumy kontrolne wynikowych plików
P1_md5=`cat P1_final.txt | md5sum | cut -d ' ' -f1`
P2_md5=`cat P2_final.txt | md5sum | cut -d ' ' -f1`

#Zdobycie nazwy dla finalenego (odzyskanego) pliku
P1_name=`cat oryginalne_nazwy.txt | grep $P1_md5 | cut -d ' ' -f3`
P2_name=`cat oryginalne_nazwy.txt | grep $P2_md5 | cut -d ' ' -f3`

#zamiana nazw plików tymczasowych na właściwe
mv P1_final.txt $P1_name
mv P2_final.txt $P2_name
