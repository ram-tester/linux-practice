#!/bin/bash


#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$( echo $0 | cut -d "." -f1 )
TIMESTAMP=$( date +%Y-%m-%d-%H-%M-%S )
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

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

echo "script starts executed at $TIMESTAMP" &>>$LOG_FILE_NAME
if [ $USERID -ne 0 ]
then
  echo "you must have sudo access execute this script"
  exit 1
fi

dnf list installed mysql  &>>$LOG_FILE_NAME
#success status of last execution command status stores in $?
if [ $? -ne 0 ]
then
  echo "install mysql..."
  dnf install mysql -y  &>>$LOG_FILE_NAME
  VALIDATE  $? "mysql"
else
  echo -e "mysql already $Y installed $N"
fi

dnf list installed git  &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
  echo "git installing now"
  dnf install git -y  &>>$LOG_FILE_NAME
  VALIDATE $? "GIT"
else
  echo -e "git already $Y installed $N"
fi
