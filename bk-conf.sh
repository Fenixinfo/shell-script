#!/bin/bash
D=`date`
DATA=`date +%d`
HORA=`date +%H:%M:%S`
RAIZ='/mnt/dados/backup-clientes/fenix/master/sistema'
DIARIO='/mnt/dados/backup-clientes/fenix/master/sistema/completo'
B1='/etc'
B2='/home'
B3='/usr/local/nagios'
B4='/root'
B5='/var'
LOG='/mnt/dados/backup-clientes/fenix/master/sistema/log'
CL='FENIX MASTER'
#======================================================================

#============= LIMPA ==================================================

rm -fr "$DIARIO"
rm -rf "$RAIZ"/sistem.tar.gz
rm -rf "$LOG"/"$DATA"_mail.log

#============= LOG E-MAIL ============================================
echo "########### BACKUP SITEMA SERVIDOR $CL ###########" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "INICIO $D " >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

#============== BACKUPS ===============================================
rsync -av "$B1" "$DIARIO"    
rsync -av "$B2" "$DIARIO"    
rsync -av "$B3" "$DIARIO"    
rsync -av "$B4" "$DIARIO"    
rsync -av "$B5" "$DIARIO"    
echo "BACKUP SISTEMA REALIZADO COM SUCESSO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

#============= COMPACTACAO ============================================

cd "$RAIZ"
tar -zcvf sistem.tar.gz completo  
echo "COMPACTACAO | $RAIZ | REALIZADA COM SUCESSO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

#============= TAMANHO DOS BACKUPS =================================== 

echo "=========TAMANHO BACKUPS=========" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO ORIGEM" >> "$LOG"/"$DATA"_mail.log
du -hs "$B1" >> "$LOG"/"$DATA"_mail.log
du -hs "$B2" >> "$LOG"/"$DATA"_mail.log
du -hs "$B3" >> "$LOG"/"$DATA"_mail.log
du -hs "$B4" >> "$LOG"/"$DATA"_mail.log
du -hs "$B5" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO BACKUP ESPELHO" >> "$LOG"/"$DATA"_mail.log
du -hs "$DIARIO"/* >> "$LOG"/"$DATA"_mail.log
du -hs "$DIARIO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO BACKUP COMPACTADO">> "$LOG"/"$DATA"_mail.log
du -hs "$RAIZ"/sistem.tar.gz >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO DIRETORIO $CL " >> "$LOG"/"$DATA"_mail.log
du -hs "$RAIZ" >> "$LOG"/"$DATA"_mail.log
df "$RAIZ" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "CONTEUDO DA PASTA $RAIZ " >> "$LOG"/"$DATA"_mail.log
cd "$RAIZ"
du -hs * >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "SISTEMA DE BACKUP CERBERO - FENIX INFORMATICA (55)3332-4289" >> "$LOG"/"$DATA"_mail.log

echo "FIM $D " >> "$LOG"/"$DATA"_mail.log


#============== ENVIO DE E-MAIL DE CONFIRMACAO ========================

mutt -s "$CL BACKUP DIARIO" fenixinformatic@gmail.com < "$LOG"/"$DATA"_mail.log


############# FENIX INFORMATICA ##################### PRB ##################################################################### 
