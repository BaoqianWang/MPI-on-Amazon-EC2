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
# for((i=2;i<=4;i++))
# do
#   host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
# done

# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3 -m maddpg_o.experiments.train_darl1n \
#     --scenario=grassland \
#     --good-sight=0.2 \
#     --adv-sight=100 \
#     --num-agents=6 \
#     --num-learners=3 \
#     --num-adversaries=3 \
#     --num-food=3 \
#     --num-landmark=3\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/grassland/darl1n_ec2/6agents_fixed_seed16/" \
#     --adv-load-dir="../result/grassland/maddpg/6agents_max_neighbors_ratio_seed16/" \
#     --save-rate=30 \
#     --prosp-dist=0.1 \
#     --eva-max-episode-len=25 \
#     --good-max-num-neighbors=6 \
#     --adv-max-num-neighbors=6 \
#     --max-num-train=2000\
#     --eva-max-episode-len=25 \
#     --max-episode-len=25 \
#     --ratio=1.5 \
#     --seed=$i\
#     --load-one-side \


# host_name_uncoded="${ARRAY[1]}"
# for((i=2;i<=7;i++))
# do
#   host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
# done
#
# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3 -m maddpg_o.experiments.train_darl1n \
#     --scenario=grassland \
#     --good-sight=0.25 \
#     --adv-sight=100 \
#     --num-agents=12 \
#     --num-learners=6 \
#     --num-adversaries=6 \
#     --num-learners=6 \
#     --num-food=6 \
#     --num-landmark=6\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/grassland/darl1n_ec2/12agents_fixed_seed$i/" \
#     --adv-load-dir="../result/grassland/maddpg/12agents_max_neighbors_ratio_seed16/" \
#     --good-load-dir="../result/grassland/darl1n_ec2/12agents_fixed_seed16/" \
#     --save-rate=30 \
#     --prosp-dist=0.15 \
#     --good-max-num-neighbors=12 \
#     --adv-max-num-neighbors=12 \
#     --max-num-train=2000\
#     --eva-max-episode-len=30 \
#     --max-episode-len=30 \
#     --ratio=2 \
#     --seed=$i\
#     --load-one-side \
#     --restore \


# host_name_uncoded="${ARRAY[1]}"
# for((i=2;i<=13;i++))
# do
#   host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
# done
#
# # 24 agents
# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3 -m maddpg_o.experiments.train_darl1n \
#     --scenario=grassland \
#     --good-sight=0.3 \
#     --adv-sight=100 \
#     --num-agents=24 \
#     --num-learners=12 \
#     --num-adversaries=12 \
#     --num-learners=12 \
#     --num-food=12 \
#     --num-landmark=12\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/grassland/darl1n_ec2/24agents_fixed_seed16/" \
#     --adv-load-dir="../result/grassland/maddpg/24agents_max_neighbors_ratio_seed16/" \
#     --save-rate=30 \
#     --prosp-dist=0.2 \
#     --eva-max-episode-len=35 \
#     --max-episode-len=35 \
#     --good-max-num-neighbors=24 \
#     --adv-max-num-neighbors=24 \
#     --max-num-train=2000\
#     --ratio=2.5 \
#     --seed=$i\
#     --load-one-side \

host_name_uncoded="${ARRAY[1]}"
for((i=2;i<=25;i++))
do
  host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
done

# 24 agents
mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
python3 -m maddpg_o.experiments.train_darl1n \
    --scenario=grassland \
    --good-sight=0.15 \
    --adv-sight=100 \
    --num-agents=48 \
    --num-learners=24 \
    --num-adversaries=24 \
    --num-food=24 \
    --num-landmark=24\
    --good-policy=maddpg \
    --adv-policy=maddpg \
    --save-dir="../result/grassland/darl1n_ec2/48agents_fixed_seed16/" \
    --adv-load-dir="../result/grassland/maddpg/48agents_max_neighbors_ratio_seed16/" \
    --save-rate=30 \
    --prosp-dist=0.05 \
    --eva-max-episode-len=40 \
    --max-episode-len=40 \
    --good-max-num-neighbors=48 \
    --adv-max-num-neighbors=48 \
    --max-num-train=2000\
    --eva-max-episode-len=40 \
    --max-episode-len=40 \
    --ratio=3.5 \
    --seed=$i\
    --load-one-side \

done
