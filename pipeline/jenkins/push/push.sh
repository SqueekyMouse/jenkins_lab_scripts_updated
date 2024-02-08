#!/bin/bash

echo "****************************"
echo "***Pushing Docker Image ****"
echo "****************************"

IMAGE="maven-project"

echo "** logging in **"
docker login -u sqmouse -p $PASS
echo "** tagging image ***"
docker tag $IMAGE:$BUILD_TAG sqmouse/$IMAGE:$BUILD_TAG
echo "** Pushing Image **"
docker push sqmouse/$IMAGE:$BUILD_TAG

echo "*** Removing local Docker Image ****"
docker rmi -f $(docker image ls | grep 'jenkins-pipeline-docker-maven' | tr -s ' ' | cut -d ' ' -f 3)
