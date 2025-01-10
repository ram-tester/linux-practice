#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)  # reading file type xfs

DISK_THRESHOLD=5

MSG=""

while read -r line   #reading line by line
do
  USAGE=$(echo $line| awk -F " " '{print $6F}'| cut -d "%" -f1) #1st fragment
  PARTITION=$(echo $line | awk -F " " '{print $NF}')# last fragment
  if [ $USAGE -ge $DISK_THRESHOLD ]
  then
    MSG+="High disk partition :$PARTITION usage is: $USAGE \n"
  fi
done <<< $DISK_USAGE

echo -e "message :$MSG"

echo "$MSG" | mutt -s "high disk usage" --rampatropj@gmail.com


