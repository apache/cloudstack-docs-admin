#!/bin/bash
HOST='ftp.online.net'
USER='cloudstack@le-morvan.com'
PASSWORD='St@ckCloud!01'

FILE=/home/antoine/Git/cloudstack-docs-admin/build/html

rm -fr $FILE
mkdir $FILE

echo "Generation du doc en HTML"
sphinx-build -b html -d build/doctrees  -D language='fr' source build/html

echo "Generation du PDF"
make latexpdf

echo "Generation du latex"
make latex

pandoc -s build/latex/CloudStackAdministrationDocumentation.tex -o build/CloudStackAdministrationDocumentation.rtf

#echo "Copie en FTP"
#ftp -n $HOST << END_SCRIPT
#quote USER $USER
#quote PASS $PASSWORD
#lcd $FILE
#mput *
#quit
#END_SCRIPT




