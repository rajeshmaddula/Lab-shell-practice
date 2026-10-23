#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
echo "Please use root access to run this cmd"
exit 1
fi

echo "installing nginx"
dnf install nghoinx -y

if [ $? -ne 0 ]; then
echo "Installing nginx ... Failur"
else
echo "Installing nginx ...Success"
fi



