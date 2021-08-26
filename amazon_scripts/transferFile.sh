#!/bin/sh

filename='nodeIPaddress'
while read line; do
echo $line
scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem $1 ubuntu@$line:$2
echo "Transfer $1 to $line Done !"
done < $filename
