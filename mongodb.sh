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
dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "Nginx not installed .. installing now"
else
    echo "Nginx already installed ..skipping"
fi
dnf install nginx -y
VALIDATE $? "Installing nginx"

dnf list installed mysql
if [ $? -eq 0 ]; then
    echo "mysql not installed .. installing now"
else
echo "mysql already installed ..skipping"
fi
dnf install mysql -y
VALIDATE $? "Installing mysql"

