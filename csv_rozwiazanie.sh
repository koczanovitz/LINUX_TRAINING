#!/bin/bash

ilosc_linii=`cat informacje.csv | wc -l`

cat -n informacje.csv | tr '\t' ',' | tr -d ' ' | sort -k5 -t',' > tmp_inf.csv
cat lokalizacje.csv | sort -k3 -t',' > tmp_lok.csv
join -t',' -1 3 -2 5 -o 2.1 1.1 2.2 2.4 tmp_lok.csv tmp_inf.csv > after_join.csv
cat after_join.csv | sort -k4 -t',' -r | head -n$(($ilosc_linii/2)) | sort -n | cut -d',' -f2,3,4 | tr ',' '\t' | column -t

rm tmp_inf.csv tmp_lok.csv after_join.csv
