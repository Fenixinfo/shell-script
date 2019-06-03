#!/bin/bash
DTN='/var/www/html/squid-reports'
find "$DTN"/* -mtime +3 -exec /bin/rm -f {} \;
sarg


