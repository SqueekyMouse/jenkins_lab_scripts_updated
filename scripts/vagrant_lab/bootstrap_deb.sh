#!/bin/sh

TST_USER="prod-user"

# to remove su in debin???
sed -e 's/#auth.*required pam_wheel.so.*/auth   required pam_wheel.so/g' -i /etc/pam.d/su

# add user, group and set sudo access
# no wheel by default in  in debin, add wheel group and set in sudoers
groupadd wheel
useradd  -mG wheel $TST_USER -s /bin/bash
echo "$TST_USER:test123" | chpasswd # debin specific!!

mkdir /home/$TST_USER/.ssh
chmod 700 /home/$TST_USER/.ssh 

# pub key copied in vagrant file!!
# COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

# to run after pub key copying!!
# RUN chown -R remote_user:remote_user /home/remote_user/.ssh/ && \
#     chmod 600 /home/remote_user/.ssh/authorized_keys

echo "%wheel\tALL=(ALL)\tNOPASSWD: ALL" >> /etc/sudoers

# enable plain text ssh password!!
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
service sshd restart