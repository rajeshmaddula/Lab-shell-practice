#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
echo -e " $R Please use root access to run this cmd $N "
exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
if [ $1 -ne 0 ]; then
echo -e "$2 ... $R Failur $N" | tee -a $LOGS_FILE
else
echo -e "$2 ...$G Success $N" | tee -a $LOGS_FILE
fi
}

for PACKAGE in $@
do
dnf list installed $PACKAGE &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    echo "$PACKAGE not installed .. installing now" | tee -a $LOGS_FILE
    dnf install $PACKAGE -y &>>$LOGS_FILE
    VALIDATE $? "$PACKAGE Installation"
else
    echo -e "$PACKAGE already installed ..$Y skipping $N" | tee -a $LOGS_FILE
fi
done

