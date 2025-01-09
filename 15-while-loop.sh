#!/bin/bash

echo "while loop example"

while read -r line
do
  echo $line
done <<< 14-delete-old-logs.sh