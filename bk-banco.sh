#!/bin/bash
D=`date`
DATA=`date +%d`
HORA=`date +%H:%M:%S`
ORG='/mnt/rede'
DTN='/home/fenix/ftp/backup'
B1=''
B2=''
B3=''
LOG='/home/fenix/ftp/backup/log'
CL='HEMOVITA'
MAIL='fenixinformatic@gmail.com'
MAIL2='hemovita@terra.com.br'

#======================================================================
#============= LOG E-MAIL ============================================
rm -rf "$LOG"/*
echo "########### BACKUP DIARIO SERVIDOR $CL ###########" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "INICIO $D " >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
#============== BACKUPS ===============================================
find "$DTN"/*cbk.gz -mtime +30 -exec /bin/rm -f {} \;
cd "$ORG"
cp "`ls -1trap F* | grep -v '/$' | tail -n 1`" "$DTN"
echo "BACKUP FULL REALIZADO COM SUCESSO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
cp "`ls -1trap I* | grep -v '/$' | tail -n 1`" "$DTN"
echo "BACKUP INCREMENTAL REALIZADO COM SUCESSO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
cd "$DTN"
sshpass -p f3n1x scp "`ls -1trap I* | grep -v '/$' | tail -n 1`" fenix@138.186.165.187:/mnt/dados/backup-clientes/hemovita/shift/
sshpass -p f3n1x scp "`ls -1trap F* | grep -v '/$' | tail -n 1`" fenix@138.186.165.187:/mnt/dados/backup-clientes/hemovita/shift/
echo "BACKUP CLOUD REALIZADO COM SUCESSO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
#============= TAMANHO DOS BACKUPS =================================== 
echo "=========TAMANHO BACKUPS=========" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO ORIGEM" >> "$LOG"/"$DATA"_mail.log
du -hs "`ls -1trap $ORG/F* | grep -v '/$' | tail -n 1`" >> "$LOG"/"$DATA"_mail.log
du -hs "`ls -1trap $ORG/I* | grep -v '/$' | tail -n 1`" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO BACKUP ESPELHO" >> "$LOG"/"$DATA"_mail.log
du -hs "$DIARIO" >> "$LOG"/"$DATA"_mail.log
du -hs "`ls -1trap $DTN/F* | grep -v '/$' | tail -n 1`" >> "$LOG"/"$DATA"_mail.log
du -hs "`ls -1trap $DTN/I* | grep -v '/$' | tail -n 1`" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "CONTEUDO DA PASTA BACKUP " >> "$LOG"/"$DATA"_mail.log
du -hs "$DTN"/* >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO DA PASTA BACKUP " >> "$LOG"/"$DATA"_mail.log
du -hs "$DTN" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "SISTEMA DE BACKUP CERBERO - FENIX INFORMATICA (55)3332-4289" >> "$LOG"/"$DATA"_mail.log
echo "FIM $D " >> "$LOG"/"$DATA"_mail.log
#============== ENVIO DE E-MAIL DE CONFIRMACAO ========================
mutt -s "$CL BACKUP DIARIO" "$MAIL" < "$LOG"/"$DATA"_mail.log
mutt -s "$CL BACKUP DIARIO" "$MAIL2" < "$LOG"/"$DATA"_mail.log
exit

