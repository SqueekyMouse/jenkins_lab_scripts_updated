#!/bin/bash

PROD_KEY="/var/jenkins_home/ansible/remote-key"
PROD_USER='prod_user'
PROD_HOST='prod-host'
# $PROD_USER@$PROD_HOST

echo "*** preparing auth file ****"

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

echo "*** getting public PROD_HOST key known_hosts ***"
ssh-keyscan -H -t ecdsa $PROD_HOST > ~/.ssh/known_hosts
# ssh-keyscan -H -t ecdsa $PROD_HOST >> ~/.ssh/known_hosts

echo "*** creating dest folder ****"
ssh -i $PROD_KEY $PROD_USER@$PROD_HOST "mkdir /home/$PROD_USER/maven/"

echo "*** copying scripts to prod-host ****"
scp -i $PROD_KEY /tmp/.auth \
       $PROD_USER@$PROD_HOST:/tmp/.auth
scp -i $PROD_KEY ./jenkins/deploy/docker-compose.yml \
       $PROD_USER@$PROD_HOST:/home/$PROD_USER/maven/docker-compose.yml
scp -i $PROD_KEY ./jenkins/deploy/publish.sh \
       $PROD_USER@$PROD_HOST:/tmp/publish.sh

echo "*** executing script on prod-host ****"
ssh -i $PROD_KEY $PROD_USER@$PROD_HOST '/tmp/publish.sh'