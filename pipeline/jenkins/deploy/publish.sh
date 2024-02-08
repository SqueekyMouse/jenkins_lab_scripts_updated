#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)

echo "*** logging in to docker ****"
docker login -u sqmouse -p $PASS

echo "*** running container ****"
cd ~/maven && docker compose up -d
# docker compose up -d