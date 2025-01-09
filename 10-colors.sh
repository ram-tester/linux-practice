#!/bin/bash


#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
VALIDATE()
{
if [ $1 -ne 0 ]
  then
    echo -e "$2 installation $R failed $N"
    exit 1
  else
    echo -e "$G successfully installed $2 $N"
fi
}
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
  VALIDATE  $? "mysql"
else
  echo -e "mysql already $Y installed $N"
fi

dnf list installed git
if [ $? -ne 0 ]
then
  echo "git installing now"
  dnf install git -y
  VALIDATE $? "GIT"
else
  echo "git already $Y installed $N"
fi
