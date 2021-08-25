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
echo "Spread DARL1N"
# 3 agents
for p in 16
do

host_name_uncoded="${ARRAY[1]}"
for((i=2;i<=4;i++))
do
  host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
done

# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3  -m maddpg_o.experiments.train_darl1n \
#     --scenario=simple_spread \
#     --sight=0.15 \
#     --num-agents=3 \
#     --num-adversaries=0 \
#     --num-food=3 \
#     --num-landmark=3\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/simple_spread/darl1n_ec2/3agents_max_neighbors_3_ratio_seed$p/" \
#     --save-rate=30 \
#     --max-num-train=3000\
#     --prosp-dist=0.05 \
#     --eva-max-episode-len=25 \
#     --max-num-neighbors=24 \
#     --ratio=1 \
#     --seed=$p \




# ./worker_download_file.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/3agents_max_neighbors_3_ratio_seed16 3
# # Run the following mpirun to generate folders
# ./ExecuteCommandAllNodes.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/3agents_max_neighbors_3_ratio_seed16
# ./transfer_weights.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/3agents_max_neighbors_3_ratio_seed16 3 6
#6 agents


# host_name_uncoded="${ARRAY[1]}"
# for((i=2;i<=7;i++))
# do
#   host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
# done
#
# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3  -m maddpg_o.experiments.train_darl1n \
#     --scenario=simple_spread \
#     --sight=0.2 \
#     --num-agents=6 \
#     --num-adversaries=0 \
#     --num-food=6 \
#     --num-landmark=6\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/simple_spread/darl1n_ec2/6agents_max_neighbors_3_ratio_seed$p/" \
#     --load-dir="../result/simple_spread/darl1n_ec2/3agents_max_neighbors_3_ratio_seed16/" \
#     --save-rate=30 \
#     --max-num-train=2000\
#     --prosp-dist=0.1 \
#     --eva-max-episode-len=25 \
#     --max-num-neighbors=24 \
#     --seed=$p \
#     --last-stage-num=3 \
#     --ratio=1.5 \
#     --restore \


# ./worker_download_file.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/6agents_max_neighbors_3_ratio_seed16 6
# # Run the following mpirun to generate folders
# ./ExecuteCommandAllNodes.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/6agents_max_neighbors_3_ratio_seed16
# ./transfer_weights.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/6agents_max_neighbors_3_ratio_seed16 6 12
#
# # 12 agents
#
# host_name_uncoded="${ARRAY[1]}"
# for((i=2;i<=13;i++))
# do
#   host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
# done
#
# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3  -m maddpg_o.experiments.train_darl1n \
#     --scenario=simple_spread \
#     --sight=0.25 \
#     --num-agents=12 \
#     --last-stage-num=6 \
#     --num-adversaries=0 \
#     --num-food=12 \
#     --num-landmark=12\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/simple_spread/darl1n_ec2/12agents_max_neighbors_3_ratio_seed$p/" \
#     --load-dir="../result/simple_spread/darl1n_ec2/6agents_max_neighbors_3_ratio_seed16/" \
#     --save-rate=30 \
#     --max-num-train=2000\
#     --prosp-dist=0.15 \
#     --eva-max-episode-len=25 \
#     --max-num-neighbors=24 \
#     --last-stage-num=6 \
#     --seed=$p\
#     --ratio=2.0 \
#     --restore \

./worker_download_file.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/12agents_max_neighbors_3_ratio_seed16 12
# Run the following mpirun to generate folders
./ExecuteCommandAllNodes.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/12agents_max_neighbors_3_ratio_seed16
./transfer_weights.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/12agents_max_neighbors_3_ratio_seed16 12 24

# 24 agents
host_name_uncoded="${ARRAY[1]}"
for((i=2;i<=25;i++))
do
  host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
done

mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
python3  -m maddpg_o.experiments.train_darl1n \
    --scenario=simple_spread \
    --sight=0.3 \
    --num-agents=24 \
    --last-stage-num=12 \
    --num-adversaries=0 \
    --num-food=24 \
    --num-landmark=24\
    --good-policy=maddpg \
    --adv-policy=maddpg \
    --save-dir="../result/simple_spread/darl1n_ec2/24agents_max_neighbors_3_ratio_seed$p/" \
    --load-dir="../result/simple_spread/darl1n_ec2/12agents_max_neighbors_3_ratio_seed16/" \
    --save-rate=30 \
    --max-num-train=2000\
    --prosp-dist=0.2 \
    --eva-max-episode-len=25 \
    --max-num-neighbors=24 \
    --seed=$p \
    --last-stage-num=12 \
    --ratio=2.5 \
    --restore \

done

./worker_download_file.sh /home/ubuntu/darl1n_neurlps/result/simple_spread/darl1n_ec2/24agents_max_neighbors_3_ratio_seed16 24
# Run the following mpirun to generate folders
