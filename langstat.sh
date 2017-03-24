#!/bin/bash

if [ -z $1 ]; then # Si aucun paramètre n'est fourni
	echo -e "Vous n'avez pas fourni de paramètre au programme\nRelancez le programme avec le fichier dictionnaire en paramètre.\n"
	exit
elif ! [ -e $1 ]; then # Vérifier l'existance du fichier passé en paramètre
	echo -e "Le fichier dictionnaire passé en paramètre n'existe pas.\nRelancez le programme avec le fichier dictionnaire correcte.\n"
	exit
elif ! [ -f $1 ]; then # Si le paramètre fourni n'est pas un vrai fichier
	echo -e "Le paramètre doit être un vrai fichier.\nRelancez le programme avec le fichier dictionnaire correcte.\n"
	exit
else # Si tout va bien

	# Tableau des lettres de l'Alphabet

	alphabet=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")

	# Creation d'un fichier temporaire statisque

	touch statistique

	# On parcours le tableau des lettres de l'alphabet 

	for lettre in ${alphabet[@]}; do
		nbre_com=`grep -i $lettre $1 | wc -l` # On compte le mots qui utilise la lettre
    
    	lettre_maj=`echo $lettre | tr "[a-z]" "[A-Z]"` # Je met la lettre en majuscule pour l'affichage finale
	
		echo -e "$nbre_com - $lettre_maj" >> statistique # Je formate la ligne et l'ajoute à mon fichier statistique

	done

	# Je trie les lignes du fichier statistique en ordre décroissant et j'affiche le resultat page par page

	sort -nr statistique | less

	# Je détruit le fichier statistique temporaire

	rm -f statistique

fi


