#!/usr/bin/ksh
num_pro=1

echo > temp_nodeIPaddress
while read LINE
do
  for((i=1;i<=num_pro;i++))
  do
    echo $LINE >>temp_nodeIPaddress
  done
done < instancesIPaddress
sed '1d' temp_nodeIPaddress > nodeIPaddress
