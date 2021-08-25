#!/bin/ksh
# pass the ssh public key of host to ec2 instances
filename='instancesIPaddress'
# savedir='./'
loaddir=$1
savedir=$3
i=1
while read line; do
echo $line
if (($i > 1)) && (($i < $2+2))
  then
  ((a=i-2))
  scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem ubuntu@$line:${loaddir}/agent${a}.weights $savedir
  echo "Transfer $i to $line Done !"
fi
((i=i+1))
done < $filename
