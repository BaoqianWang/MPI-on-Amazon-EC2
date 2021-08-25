#!/usr/bin/ksh
ARRAY=()
SchemeArray=()
host_name=""
k=0
l=0


while read LINE
do
    ARRAY+=("$LINE")
    ((k=k+1))
done < nodeIPaddress


sleep 1
echo "Grassland DARL1N"
# 6 agents
for i in 16
do

# host_name_uncoded="${ARRAY[1]}"
# for((i=2;i<=7;i++))
# do
#   host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
# done
#
# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3 -m maddpg_o.experiments.train_darl1n \
#     --scenario=grassland \
#     --sight=0.2 \
#     --num-agents=6 \
#     --num-adversaries=3 \
#     --num-food=3 \
#     --num-landmark=3\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/grassland/darl1n_ec2/6agents_ratio_seed$i/" \
#     --save-rate=30 \
#     --prosp-dist=0.1 \
#     --eva-max-episode-len=25 \
#     --max-num-neighbors=24 \
#     --max-num-train=2000\
#     --eva-max-episode-len=25 \
#     --ratio=1.5 \
#     --seed=$i\

# ./worker_download_file.sh /home/ubuntu/darl1n_neurlps/result/grassland/darl1n_ec2/6agents_ratio_seed8 6
# # Run the following mpirun to generate folders
# ./ExecuteCommandAllNodes.sh /home/ubuntu/darl1n_neurlps/result/grassland/darl1n_ec2/6agents_ratio_seed8
# ./transfer_weights.sh /home/ubuntu/darl1n_neurlps/result/grassland/darl1n_ec2/6agents_ratio_seed8 3 3 6 6
#
host_name_uncoded="${ARRAY[1]}"
for((i=2;i<=7;i++))
do
  host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
done

mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
python3 -m maddpg_o.experiments.train_darl1n \
    --scenario=grassland \
    --good-sight=0.25 \
    --adv-sight=100 \
    --num-agents=12 \
    --num-learners=6 \
    --num-adversaries=6 \
    --num-food=6 \
    --last-good=3 \
    --last-adv=3 \
    --num-landmark=6\
    --good-policy=maddpg \
    --adv-policy=maddpg \
    --save-dir="../result/grassland/darl1n_ec2/12agents_ratio_seed$i/" \
    --good-load-dir="../result/grassland/darl1n_ec2/6agents_ratio_seed8/" \
    --adv-load-dir="../result/grassland/maddpg/12agents_max_neighbors_ratio_seed16/"  \
    --save-rate=30 \
    --prosp-dist=0.15 \
    --eva-max-episode-len=25 \
    --max-num-neighbors=24 \
    --max-num-train=2000\
    --eva-max-episode-len=30 \
    --max-episode-len=30 \
    --ratio=2 \
    --seed=$i\
    --restore \
    --load-one-side \

# ./worker_download_file.sh /home/ubuntu/darl1n_neurlps/result/grassland/darl1n_ec2/12agents_ratio_seed14 12
# # Run the following mpirun to generate folders
# ./ExecuteCommandAllNodes.sh /home/ubuntu/darl1n_neurlps/result/grassland/darl1n_ec2/12agents_ratio_seed14
# ./transfer_weights.sh /home/ubuntu/darl1n_neurlps/result/grassland/darl1n_ec2/12agents_ratio_seed14 6 6 12 12
#
#
host_name_uncoded="${ARRAY[1]}"
for((i=2;i<=13;i++))
do
  host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
done
#
# # 24 agents
mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
python3 -m maddpg_o.experiments.train_darl1n \
    --scenario=grassland \
    --good-sight=0.3 \
    --adv-sight=100 \
    --num-agents=24 \
    --num-learners=12 \
    --num-adversaries=12 \
    --num-food=12 \
    --last-good=6 \
    --last-adv=6 \
    --num-landmark=12\
    --good-policy=maddpg \
    --adv-policy=maddpg \
    --save-dir="../result/grassland/darl1n_ec2/24agents_ratio_seed$i/" \
    --good-load-dir="../result/grassland/darl1n_ec2/6agents_ratio_seed8/" \
    --adv-load-dir="../result/grassland/maddpg/24agents_max_neighbors_ratio_seed16/"\
    --save-rate=30 \
    --prosp-dist=0.2 \
    --eva-max-episode-len=25 \
    --max-num-neighbors=24 \
    --max-num-train=2000\
    --eva-max-episode-len=35 \
    --max-episode-len=35 \
    --ratio=2.5 \
    --seed=$i\
    --restore \
    --load-one-side \

#./worker_download_file.sh /home/ubuntu/darl1n_neurlps/result/grassland/darl1n_ec2/24agents_ratio_seed26 24
#Run the following mpirun to generate folders

done
