#!/bin/sh

TST_USER="prod-user"

chown -R $TST_USER:$TST_USER /home/$TST_USER/.ssh/
chmod 600 /home/$TST_USER/.ssh/authorized_keys
