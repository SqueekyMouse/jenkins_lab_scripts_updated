#!/bin/bash
NAME=$1
LASTNAME=$2
SHOW=$3

echo "show: $SHOW"

if [ "$SHOW" == "true" ]; then
  echo "Hello, $NAME $LASTNAME"
else
  echo "Mark show opt to see name!!"
fi
