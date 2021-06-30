#!/bin/bash
HOST='192.168.1.3'
USER='etudiant'
PASSWD='vitrygtr'

ftp -n -v $HOST << EOT
ascii
user $USER $PASSWD
prompt
find -type f -name \"*.sql\" -exec put \'{}\'
bye
EOT