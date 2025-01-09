#!/bin/bash

USERID=$(id -u)

VALIDATE()
{
if [ $1 -ne 0 ]
  then
    echo "$2 installation failed"
    exit 1
  else
    echo "successfully installed $2"
fi
}
if [ $USERID -ne 0 ]
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
  VALIDATE  $? "mysql"
else
  echo "mysql already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
  echo "git installed now"
  dnf install git -y
  VALIDATE $? "GIT"
else
  echo "git already installed "
fi
