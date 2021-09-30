#!/bin/bash

echo "Choose your month number from 1 to 12"
read x
case $x in
	1) echo "$x is January" ;;
	2) echo "$x is February" ;;
	3) echo "$x is March" ;;
	4) echo "$x is April" ;;
	5) echo "$x is May" ;;
 	6) echo "$x is June" ;;
	7) echo "$x is July" ;;
	8) echo "$x is August" ;;
	9) echo "$x is September" ;;
	10) echo "$x is October" ;;
	11) echo "$x is November" ;;
	12) echo "$x is December" ;;
	*) echo "Please enter a valid number" ;;
esac	
