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

echo "installing nginx"
dnf install nghoinx -y
VALIDATE $? "Installing nginx"




