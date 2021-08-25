#!/bin/ksh
# pass the ssh public key of host to ec2 instances
i=1
filename='instancesIPaddress'
while IFS= read -r line
do
echo $line
echo "Execution Done!"
ssh -i  ~/AmazonEC2/.ssh/linux_key_pari.pem -n ubuntu@$line 'killall python3'
#ssh ubuntu@$line "mkdir -p $1"
#ssh -i  ~/AmazonEC2/.ssh/linux_key_pari.pem -n ubuntu@$line "unzip ~/darl1n_neurlps/result/grassland/maddpg/12agents_max_neighbors_ratio_seed16.zip -d  ~/darl1n_neurlps/result/grassland/maddpg/"
((i=i+1))
done < $filename
