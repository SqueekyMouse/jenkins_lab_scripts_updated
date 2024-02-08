#!/bin/bash

DB_DATE=$(date +%H-%M-%S)
BACKUP=db-$DB_DATE.sql

DB_HOST=$1
DB_PASSWD=$2
DB_NAME=$3
AWS_SECRET=$4
AWS_BUCKET=$5


mysqldump -u root -h $DB_HOST -p$DB_PASSWD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIA5RAG4TQICJLY7O73 && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading db backup $BACKUP !!" && \
aws s3 cp /tmp/$BACKUP s3://$AWS_BUCKET/$BACKUP
