#!/bin/bash

DATA=`date +%d`
cd /mnt/dados/lixo
rm -rf "$DATA"
mkdir "$DATA"
mv 0/ "$DATA"


