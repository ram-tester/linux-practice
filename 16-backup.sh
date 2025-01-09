#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}


LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$( echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"


USAGE()
{
  echo -e "$R USAGE :: $N backup <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"
  exit 1
}

mkdir -p /home/ec2-user/shellscript-logs

if [  $#  -lt 2 ]
then
  USAGE
fi


if [ ! -d "$SOURCE_DIR" ]
then
  echo -e "$R source dir does not exists.. please check $N"
fi

if [  ! -d "$DEST_DIR" ]
then
  echo -e "$R Dest dir does not exists... please check  $N"
fi

echo "script execution stating at $TIMESTAMP"  &>>$LOG_FILE_NAME


FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ]
then
  echo "files are: $FILES"
  ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
  find $SOURCE_DIR -name "*.log" -mtime +$DAYS  |  zip  -@ "$ZIP_FILE"
  if [ -f "$ZIP_FILE" ]
  then
    echo -e "successfully created zip file for files older than $DAYS"
    while read -r filepath
    do
      echo "deleting filepath $filepath" &>>LOG_FILE_NAME
      rm -rf $filepath
      echo  "deleted file: $filepath"
    done <<<$FILES
  else
    echo -e "$R ERROR: $N failed to create zip file"
    exit 1
  fi
else
  echo "no files older than $DAYS"
fi



