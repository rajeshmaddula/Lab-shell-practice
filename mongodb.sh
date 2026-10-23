#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
echo "Please use root access to run this cmd"
exit 1
fi

dnf install nghinx -y

echo "installing nginx"
if [ $? -ne 0 ]; then
echo "Installing nginx ... Failur"
else
echo "Installing nginx ...Success"
fi



