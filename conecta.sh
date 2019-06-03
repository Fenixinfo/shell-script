#!/bin/bash

IN=enp2s0
OU=enp3s0

echo 'Abrindo conecao'
echo 1 >> /proc/sys/net/ipv4/ip_forward
echo 'conectando.....'
iptables -t nat -A POSTROUTING -o "$IN" -j MASQUERADE 
echo 'Ok'


