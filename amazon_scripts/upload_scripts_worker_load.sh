#!/usr/bin/ksh
filename1='instancesIPaddress'
ARRAY=()
num_nodes=0
while read LINE
do
    ARRAY+=("$LINE")
    ((num_nodes++))
done < $filename1


#Transfer main files
# filename1='maddpg_files'
# while read line; do
#   for ((i=1;i<=num_nodes;i++))
#   do
#       scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem  $line ubuntu@${ARRAY[i]}:~/maddpg/experiments/
#       echo "Transfer $i to $line Done "
#   done
# done < $filename1




# # Transfer parameter file
# for ((i=1;i<=num_nodes;i++))
# do
#     scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem  ../parameters/marl_parameters.json ubuntu@${ARRAY[i]}:~/maddpg/parameters/
#     echo "Transfer $i to $line Done "
# done





# Transfer environments file
# for ((i=1;i<=num_nodes;i++))
# do
#     scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem  /home/smile/multiagent-particle-envs/multiagent/scenarios/simple_spread.py ubuntu@${ARRAY[i]}:~/multi-envs/multiagent/scenarios/
#     echo "Transfer $i to $line Done "
#     scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem  /home/smile/multiagent-particle-envs/multiagent/environment.py ubuntu@${ARRAY[i]}:~/multi-envs/multiagent/
#     echo "Transfer $i to $line Done "
#     scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem  /home/smile/multiagent-particle-envs/multiagent/environment_neighbor_evaluate.py ubuntu@${ARRAY[i]}:~/multi-envs/multiagent/
#     echo "Transfer $i to $line Done "
#     scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem  /home/smile/multiagent-particle-envs/multiagent/scenarios/simple_spread_neighbor_evaluate.py ubuntu@${ARRAY[i]}:~/multi-envs/multiagent/scenarios/
#     echo "Transfer $i to $line Done "
#
# done




# Transfer amazon scripts
filename2='home_files'
while read line; do
  for ((i=1;i<=num_nodes;i++))
  do
      scp -i ~/AmazonEC2/.ssh/linux_key_pari.pem  $line ubuntu@${ARRAY[i]}:~/maddpg/amazon_scripts/
      echo "Transfer $i to $line Done"
  done
done < $filename2
