#!/bin/sh
# pass the ssh public key of host to ec2 instances


filename='instancesIPaddress'
while read line; do
echo $line
#scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem $1 ubuntu@$line:~/darl1n_neurlps/maddpg_o/experiments/
#scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem $1 ubuntu@$line:~/darl1n_neurlps/maddpg_o/maddpg_local/micro/
#scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem $1 ubuntu@$line:~/darl1n_neurlps/amazon_scripts/
#scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem $1 ubuntu@$line:~/darl1n_neurlps/result/grassland/epc_local/
scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem $1 ubuntu@$line:~/darl1n_neurlps/train_ising/
#scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem $1 ubuntu@$line:~/darl1n_neurlps/train_grassland/
#scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem $1 ubuntu@$line:~/darl1n_neurlps/maddpg_o/experiments/
#scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem ~/AmazonEC2/.ssh/linux_key_pari.pem ubuntu@18.189.143.43:~/
#scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem $1 ubuntu@$line:~/darl1n_neurlps/mpe_local/multiagent/scenarios/
echo "Transfer $1 to $line Done !"
done < $filename
