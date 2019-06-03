#!/bin/bash
D=`date`
DATA=`date +%d`
HORA=`date +%H:%M:%S`
RAIZ='/mnt/dados/backup-clientes/hemovita/shift'
DTN='/mnt/dados/backup-clientes/hemovita/shift'
B1='ls -1trap F* | grep -v '/$' | tail -n 1'
LOG='/mnt/dados/backup-clientes/hemovita/shift/log'
CL='FENIX DADOS RECEBIDOS HEMOVITA'
MAIL='fenixinformatic@gmail.com'
MAIL2='hemovita@terra.com.br'
#======================================================================

#============= LIMPA ==================================================

#rm -fr "$$DTN"
#rm -rf "$RAIZ"/"$DATA".tar.gz
rm -rf "$LOG"/"$DATA"_mail.log

#============= LOG E-MAIL ============================================
echo "########### $CL ###########" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "INICIO $D " >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

#============= BACKUPS =================================== 

echo "=========BACKUPS=========" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

cd "$RAIZ"
find "$DTN"/*cbk.gz -mtime +7 -exec /bin/rm -f {} \;

echo "BACKUP RECEBIDO">> "$LOG"/"$DATA"_mail.log
ls -1trap F* | grep -v '/$' | tail -n 1 >> "$LOG"/"$DATA"_mail.log
ls -1trap I* | grep -v '/$' | tail -n 1 >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

echo "TAMANHO DIRETORIO" >> "$LOG"/"$DATA"_mail.log
du -hs "$RAIZ" >> "$LOG"/"$DATA"_mail.log
df "$RAIZ" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

echo "CONTEUDO DA PASTA SHIFT" >> "$LOG"/"$DATA"_mail.log
du -hs * >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

echo "SISTEMA DE BACKUP CERBERO - FENIX INFORMATICA (55)3332-4289" >> "$LOG"/"$DATA"_mail.log
echo "FIM $D " >> "$LOG"/"$DATA"_mail.log


#============== ENVIO DE E-MAIL DE CONFIRMACAO ========================

mutt -s "$CL" "$MAIL" < "$LOG"/"$DATA"_mail.log
mutt -s "$CL" "$MAIL2" < "$LOG"/"$DATA"_mail.log


############# FENIX INFORMATICA ##################### PRB ##################################################################### 
