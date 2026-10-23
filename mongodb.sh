#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
echo "Please use root access to run this cmd"
exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then
echo "$2 ... Failur"
else
echo "$2 ...Success"
fi
}

for PACKAGE in $@(
dnf list installed $PACKAGE
if [ $? -ne 0 ]; then
    echo "$PACKAGE not installed .. installing now"
    dnf install $PACKAGE -y
    VALIDATE $? "$PACKAGE Installation"
else
    echo "$PACKAGE already installed ..skipping"
fi
)

