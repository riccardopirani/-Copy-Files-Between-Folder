#/bin/bash

#Riccardo Pirani www.riccardopirani.altervista.org


cd "$1"

#contatore
> /tmp/contatore

#ciclo controllo file
for i in *$2
do
       
     if test -r $i -a ` head -1 $i | grep  "/bin/bash" ` -a `wc -l < prova.txt` -gt $3
     then
     #copio il file nella directory esercizi all'interno della home utente 
     cp $i $HOME/Esercizi/ 
     echo `pwd`/$i >> /tmp/file_copiati
     echo `pwd`/$i >> /tmp/contatore 
     fi

done

#aggiorno /tmp/max_cont
if test `wc -l < /tmp/contatore` -gt `wc -l < /tmp/max_cont`
then
    mv /tmp/contatore /tmp/max_cont
    echo `pwd` > /tmp/max_dir
fi

#rimuovo contatore
rm -f /tmp/contatore

#ricorsione
for d in *
do
     if test -d $d
     then
           sh ricorsione.sh $d $2 $3
     fi
done
