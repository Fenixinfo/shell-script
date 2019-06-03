#!/bin/bash
D=`date`
DATA=`date +%d`
HORA=`date +%H:%M:%S`
RAIZ='/mnt/dados/backup-clientes/fenix/master/semanal'
DIARIO='/mnt/dados/backup-clientes/fenix/master/semanal/completo'
B1='/mnt/dados/geral'
B2='/mnt/dados/admin'
B3=''
LOG='/mnt/dados/backup-clientes/fenix/master/semanal/log'
CL='FENIX MASTER'
#======================================================================

#============= LIMPA ==================================================

rm -fr "$DIARIO"
rm -rf "$RAIZ"/"$DATA".tar.gz
rm -rf "$LOG"/"$DATA"_mail.log

#============= LOG E-MAIL ============================================
echo "########### BACKUP SEMANAL SERVIDOR $CL ###########" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "INICIO $D " >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

#============== BACKUPS ===============================================
rsync -av "$B1" "$DIARIO"    
echo "BACKUP PASTA GERAL REALIZADO COM SUCESSO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
#rsync -av "$B2" "$DIARIO"    
echo "BACKUP PASTA ADMIN REALIZADO COM SUCESSO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

#============= COMPACTACAO ============================================

cd "$RAIZ"
tar -zcvf "$DATA".tar.gz completo  
echo "COMPACTACAO | $RAIZ | REALIZADA COM SUCESSO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log

#============= TAMANHO DOS BACKUPS =================================== 

echo "=========TAMANHO BACKUPS=========" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO ORIGEM" >> "$LOG"/"$DATA"_mail.log
du -hs "$B1" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO BACKUP ESPELHO" >> "$LOG"/"$DATA"_mail.log
du -hs "$DIARIO" >> "$LOG"/"$DATA"_mail.log
echo -e >> "$LOG"/"$DATA"_mail.log
echo "TAMANHO BACKUP COMPACTADO">> "$LOG"/"$DATA"_mail.log
du -hs "$RAIZ"/"$DATA".tar.gz >> "$LOG"/"$DATA"_mail.log
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

mutt -s "$CL BACKUP SEMANAL" fenixinformatic@gmail.com < "$LOG"/"$DATA"_mail.log


############# FENIX INFORMATICA ##################### PRB ##################################################################### 
