#!/bin/bash
p='squid'
p1='samba'
p2='apache2'
p3='bind9'
p4='cron'
p5='firewall.sh'
p6='isc-dhcp-server'
p7='mysql'
p8='nagios-nrpe-server'
p9='netdata'
p10='ntp'
p11='postfix'
p12='ssh'
teste=`ps aux | grep $p | grep -v grep`
teste1=`ps aux | grep $p1 | grep -v grep`
teste2=`ps aux | grep $p2 | grep -v grep`
teste3=`ps aux | grep $p3 | grep -v grep`
teste4=`ps aux | grep $p4 | grep -v grep`
teste5=`ps aux | grep $p5 | grep -v grep`
teste6=`ps aux | grep $p6 | grep -v grep`
teste7=`ps aux | grep $p7 | grep -v grep`
teste8=`ps aux | grep $p8 | grep -v grep`
teste9=`ps aux | grep $p9 | grep -v grep`
teste10=`ps aux | grep $p10 | grep -v grep`
teste11=`ps aux | grep $p11 | grep -v grep`
teste12=`ps aux | grep $p12 | grep -v grep`

if [ "$teste" ];
	then
		echo "$p ON"
	else
		echo "$p OFF"
fi


if [ "$teste1" ];
	then
		echo "$p1 ON"
	else
		echo "$p1 OFF"
fi


if [ "$teste2" ];
	then
		echo "$p2 ON"
	else
		echo "$p2 OFF"
fi


if [ "$teste3" ];
	then
		echo "$p3 ON"
	else
		echo "$p3 OFF"
fi


if [ "$teste4" ];
	then
		echo "$p4 ON"
	else
		echo "$p4 OFF"
fi


if [ "$teste5" ];
	then
		echo "$p5 ON"
	else
		echo "$p5 OFF"
fi


if [ "$teste6" ];
	then
		echo "$p6 ON"
	else
		echo "$p6 OFF"
fi


if [ "$teste7" ];
	then
		echo "$p7 ON"
	else
		echo "$p7 OFF"
fi


if [ "$teste8" ];
	then
		echo "$p8 ON"
	else
		echo "$p8 OFF"
fi


if [ "$teste9" ];
	then
		echo "$p9 ON"
	else
		echo "$p9 OFF"
fi


if [ "$teste10" ];
	then
		echo "$p10 ON"
	else
		echo "$p10 OFF"
fi


if [ "$teste11" ];
	then
		echo "$p11 ON"
	else
		echo "$p11 OFF"
fi

if [ "$teste12" ];
	then
		echo "$p12 ON"
	else
		echo "$p12 OFF"
fi



