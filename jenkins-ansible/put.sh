#!/bin/bash
counter=0

while [ $counter -lt 50 ]; do
#   counter=$(($counter+1))
  let counter=counter+1
 
  name=$(nl people.csv | grep -w $counter | cut -f2 | awk -F ',' '{print $1}')
  lastname=$(nl people.csv | grep -w $counter | cut -f2 | awk -F ',' '{print $2}') 
  age=$(shuf -i 20-25 -n 1)
#   age=$((20 + $RANDOM % 30))

# sanitize csv file content!!
  name=${name//[^a-zA-Z0-9]/}
  lastname=${lastname//[^a-zA-Z0-9]/}
    
  mysql -u root -p1234 people -e "insert into register values ($counter, '$name', '$lastname', $age)"
  echo "$counter,$name $lastname,$age::was inserted"
done