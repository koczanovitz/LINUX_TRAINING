#!/bin/bash

wynik=`cat $1 | sed -n "$2,$3"p | egrep -io 'a' | wc -l`

echo "Ilość znaków 'a' (bez względy na wielkość) od linii $2 do linii $3 w pliku $1 wynosi $wynik"
