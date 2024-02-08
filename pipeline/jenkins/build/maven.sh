#!/bin/bash

echo "*******************************"
echo "******** Building jar**********"
echo "*******************************"

WORKSPACE='/home/guest/Documents/jenkins_data/jenkins_home/workspace/pipeline-docker-maven'

# docker run --rm -v $PWD/java-app:/app -v $PWD/root/.m2/:/root/.m2/ -w /app maven:3.8.6-jdk-11 mvn -B -DskipTests clean package

# ./maven.sh mvn -B -DskipTests clean package
docker run --rm -v $WORKSPACE/java-app:/app -v $WORKSPACE/root/.m2/:/root/.m2/ -w /app maven:3.8.6-jdk-11 "$@"