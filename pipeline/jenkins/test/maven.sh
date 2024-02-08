#!/bin/bash

echo "*******************************"
echo "******** Testing jar **********"
echo "*******************************"

WORKSPACE='/home/guest/Documents/jenkins_data/jenkins_home/workspace/pipeline-docker-maven'

# ./maven.sh mvn test
docker run --rm -v $WORKSPACE/java-app:/app -v $WORKSPACE/root/.m2/:/root/.m2/ -w /app maven:3.8.6-jdk-11 "$@"