#!/bin/bash

dig +short myip.opendns.com @resolver1.opendns.com > tmp.txt

if  ! diff -q tmp.txt ip.txt &>/dev/null; then
   cp tmp.txt ip.txt
   git add ip.txt
   git commit -m "ip addr changed"
   git push
fi
rm tmp.txt
