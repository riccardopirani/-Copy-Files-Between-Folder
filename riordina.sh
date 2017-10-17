#!/bin/bash

#Riccardo Pirani www.riccardopirani.altervista.org



PATH=$PATH:`pwd`
export PATH

#Controllo il numero di parametri
if test ! $# -eq 3
then
    echo "Errore: eseguire ./riordina.sh dir ext number"
    exit 1
fi

#Controllo che $1 sia un direttorio
if test ! -d $1
then
    echo "Errore: $1 non è un direttorio"
    exit 2
fi

#controllo che $1 sia un direttorio assoluto
case $1 in
   */);;
    *) echo "Errore $1 non è un direttorio assoluto"; exit 3;;
esac

#controllo che il parametro $2 sia un estensione
case $2 in
   .*);;
   *) echo "Errore $2 non è un estensione"; exit 4;;
esac

#controllo che $3 sia un numero 
case $3 in
   *[!0-9]*) echo "Errore: $3 non è un numero"; exit 5;;
   *) ;;
esac


#Controllo se esiste la cartella esercizi in home nel caso non esista la creo
if test ! -d $HOME/Esercizi
then
    mkdir $HOME/Esercizi
fi

#creo i file temporanei
 >/tmp/file_copiati
 > /tmp/max_dir
 > /tmp/max_cont

#chiamo il secondo file
sh ricorsione.sh $*

#stampo i risultati
echo " I file copiati in $HOME/esercizi sono stati `cat /tmp/file_copiati` "
echo " la directory che conteneva il maggior numero di file è `cat /tmp/max_dir` con `wc -l < /tmp/max_cont` file copiati"

#elimino i file temporanei
rm -f /tmp/file_copiati
rm -f /tmp/max_dir
rm -f /tmp/max_cont

