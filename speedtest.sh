#!/bin/bash

DATA=`date +"%d-%m-%Y"`
hora=`date +"%H:%M"`
DIR='/var/www/html/net_log/'

cd "$DIR"
mkdir "$DATA" 
speedtest-cli >> /var/www/html/net_log/"$DATA"/"$hora".log


#########################
