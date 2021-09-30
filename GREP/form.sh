#!/bin/bash

function pobierz_imie(){
	read -p "Imię: " imie
}

function pobierz_mail(){
        read -p "Twój mail w formacie X@Y.Z: " mail
}

function pobierz_telefon(){
        read -p "Telefon w formacie +00 000 00 00 00: " telefon
}

function sprawdz_imie(){
	wynik=`echo $imie | egrep '^\<[A-Ż][a-ż]+\>$'`
	if [[ $wynik != $imie ]]; then
		imie=0
	fi
}

function sprawdz_mail(){
        wynik=`echo $mail | egrep '^[a-z]+@[a-z]+[.][a-z]{2,3}$'`
        if [[ $wynik != $mail ]]; then
                mail=0
        fi
}

function sprawdz_telefon(){
	wynik=`echo $telefon | egrep '^[+]([0-9]{2})[ ]?[0-9]{3}([ ]?[0-9]{2}){3}$'`
        if [[ $wynik != $telefon ]]; then
                telefon=0
        fi
}


pobierz_imie
pobierz_mail
pobierz_telefon
sprawdz_imie
sprawdz_mail
sprawdz_telefon

echo $imie $mail $telefon

while [[ $imie = 0 ]]; do
echo "Podałeś niepoprawne imię. Spróbuj jeszcze raz!"
pobierz_imie
sprawdz_imie
done

while [[ $mail = 0 ]]; do
echo "Podałeś niepoprawny mail. Spróbuj jeszcze raz!"
pobierz_mail
sprawdz_mail
done

while [[ $telefon = 0 ]]; do
echo "Podałeś niepoprawny numer. Spróbuj jeszcze raz!"
pobierz_telefon
sprawdz_telefon
done

