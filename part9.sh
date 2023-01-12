#!/bin/sh
loggedusers=$(users)
currentdate=$(date +"%Y %m %d %H:%M")
echo "$currentdate: $loggedusers" >> /root/outputpart9.txt

