#!/bin/bash
#start ssh
/usr/sbin/sshd

#start nginx deamon
nginx -g 'daemon off;'
