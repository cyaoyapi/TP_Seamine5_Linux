#!/bin/bash

# Tableau des lettre de l'Alphabet

alphabet=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")

# Si le fichier classement existe, le détruire

if [ -e statistique.txt ]
then
	rm statistique.txt
fi

# Creation du fichier classement

touch statistique.txt

# On parcours le tableau des lettre de l'alphabet 
for lettre in ${alphabet[@]}
do
	nbre_com=`grep -i $lettre dico.txt | wc -l` # On compte le mots qui utilise la lettre
    
    lettre_maj=`echo $lettre | tr "[a-z]" "[A-Z]"` # Je met la lettre en majuscule pour l'affichage finale
	
	echo -e "$nbre_com - $lettre_maj" >> statistique.txt # Je formate la ligne et l'ajoute à mon fichier classement

done

# Je trie les lignes du fichier statistique.txt en ordre décroissant 

sort -nr statistique.txt

