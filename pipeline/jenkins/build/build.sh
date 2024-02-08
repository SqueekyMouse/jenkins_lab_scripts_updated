#!/bin/bash

# copy new jar to build loaction
cp java-app/target/*.jar jenkins/build

echo "****************************"
echo "***Building Docker Image****"
echo "****************************"

cd jenkins/build/ && docker compose -f docker-compose-build.yml build --no-cache