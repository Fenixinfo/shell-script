#!/bin/bash

### BEGIN INIT INFO
# Provides:          rebutato
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Should-Start:      $portmap
# Should-Stop:       $portmap
# X-Start-Before:    nis
# X-Stop-After:      nis
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     true
# Short-Description: Example initscript
# Description:       rebut
#                    placed in /etc/init.d.
### END INIT INFO

DATA=`date +%d`
HORA=`date +%H:%M:%S` 
DIR='/home/fenix/shell/log/mail'
MAIL='fenixinformatic@gmail.com'
CL='FENIX'

rm -rf "$DIR"/"$DATA"*.log

iniciar(){
echo "REINICIADO SISTEMA $CL" >> "$DIR"/"$DATA"_restart.log
echo -e >>  "$DIR"/"$DATA"_restart.log
date >>  "$DIR"/"$DATA"_restart.log
dmesg >>  "$DIR"/"$DATA"_dmesg.log

mutt -s "$CL RESTART SERVER" -a /home/fenix/avisos/mail/"$DATA"_dmesg.log -- "$MAIL"  < "$DIR"/"$DATA"_restart.log
echo "ENVIADO E-MAIL"
    }

    parar(){
echo "REINICIADO SISTEMA $CL" >> "$DIR"/"$DATA"_restart.log
echo -e >>  "$DIR"/"$DATA"_restart.log
date >>  "$DIR"/"$DATA"_restart.log
dmesg >>  "$DIR"/"$DATA"_dmesg.log
    }

    case "$1" in
    "start") iniciar ;;
    "stop") parar ;;
    "restart") parar; iniciar ;;
    *) echo "Use os parametros start ou stop bostao" 
    esac

