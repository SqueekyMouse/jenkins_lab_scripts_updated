#!/bin/bash
#start ssh
/usr/sbin/sshd

#start php process in background
/usr/sbin/php-fpm -c /etc/php/fpm

# start php-fpm
/usr/bin/php-fpm -D;

#start nginx deamon
nginx -g 'daemon off;'
