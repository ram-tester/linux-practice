#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
  echo "you must have sudo access execute this script"
  exit 1
fi

dnf list installed mysql
#success status of last execution command status stores in $?
if [ $? -ne 0 ]
then
  echo "install mysql..."
  dnf install mysql -y
  if [ $? -ne 0 ]
  then
    echo "mysql installation failed"
    exit 1
  else
    echo "successfully installed mysql"
  fi
else
  echo "mysql already installed"
fi
