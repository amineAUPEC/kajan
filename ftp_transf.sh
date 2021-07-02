#!/bin/bash
HOST='177.16.1.'
USER='etudiant'
PASSWD='vitrygtr'

ftp -n -v $HOST << EOT
ascii
user $USER $PASSWD
prompt
ls
mput * 
bye
EOT