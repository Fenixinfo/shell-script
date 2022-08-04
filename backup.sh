#!/bin/bash

# Path to folder for backups
date=`date +%m-%d-%H_%M`
destf=/backup/full/
desti=/backup/increment/
src=/dados/

# Start the backup process

if [ -d ${destf} ]; then
        echo 'DIRETORIO EXISTE'
        rsync -av  --delete ${src} ${destf}
        echo 'SINCRONIZANDO'
else
        echo 'DIRETORIO NAO EXISTE'
        echo '${destf}' 

fi

find ${desti}full* -mtime +5 -exec /bin/rm -f {} \;
find ${desti}ctl.txt -mtime +5 -exec /bin/rm -f {} \;

if [ -e /backup/increment/full* ]; then
        echo 'ARQUIVO EXISTE'
        echo 'CRIANDO INCREMENTAL'
        tar -zcvf ${desti}${date}.tar.gz -g ${desti}ctl.txt --exclude=lixo --exclude=ti ${src}

else
        echo 'ARQUIVO NAO EXISTE'
        tar -zcvf  ${desti}full${date}.tar.gz -g ${desti}ctl.txt --exclude=lixo --exclude=ti ${src}

        if [ -e /backup/increment/full* ]; then
        echo 'ARQUIVO CRIADO'   

        else
        echo 'ERRO'
        fi

fi

