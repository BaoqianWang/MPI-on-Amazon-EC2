#!/bin/ksh
# pass the ssh public key of host to ec2 instances
# filename='instancesIPaddress'
# loaddir=$1
# i=1
# while read line; do
# echo $line
# if (($i > $2+1)) && (($i < $3+2))
#   then
#   ((a=i-2))
#   ((a=a%$2))
#   scp ${loaddir}/agent${a}.weights ubuntu@$line:$loaddir
#   echo "Transfer $i to $line Done !"
# fi
# ((i=i+1))
# done < $filename

filename='instancesIPaddress'
loaddir=$1
last_adv=$2
last_good=$3
((last_num=last_adv+last_good))
adv=$4
good=$5
((curr_num=adv+good))
i=1
while read line; do
echo $line
if (($i > 1)) && (($i < curr_num+2))
  then
  ((a=i-2))
  if (($a < adv))
    then
  ((a=a%last_adv))
  fi

  if (($a >= adv))
    then
  ((a=a-adv))
  ((a=a%last_good))
  ((a=a+last_adv))
  fi

  scp ${loaddir}/agent${a}.weights ubuntu@$line:$loaddir
  echo "Transfer $i to $line Done !"
fi
((i=i+1))
done < $filename
