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
echo "Ising Mean Field"
# host_name_uncoded="${ARRAY[1]}"
# for((i=2;i<=10;i++))
# do
#   host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
# done
#
# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3 -m maddpg_o.experiments.train_darl1n \
#     --scenario=ising \
#     --good-sight=100 \
#     --adv-sight=100 \
#     --last-good=0 \
#     --last-adv=0 \
#     --num-agents=9 \
#     --num-adversaries=0 \
#     --num-learners=9 \
#     --num-food=0 \
#     --num-landmark=0\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/ising/darl1n/9agents_mreward_seed16/" \
#     --save-rate=10 \
#     --prosp-dist=0.3 \
#     --max-num-train=200 \
#     --good-max-num-neighbors=5 \
#     --adv-max-num-neighbors=5 \
#     --eva-max-episode-len=25 \
#     --max-episode-len=25 \
#     --seed=16 \

# host_name_uncoded="${ARRAY[1]}"
# for((i=2;i<=37;i++))
# do
#   host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
# done
#
# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3  -m maddpg_o.experiments.train_darl1n \
#     --scenario=ising \
#     --good-sight=100 \
#     --adv-sight=100 \
#     --last-good=0 \
#     --last-adv=0 \
#     --num-agents=36 \
#     --num-adversaries=0 \
#     --num-learners=36 \
#     --num-food=0 \
#     --num-landmark=0\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/ising/darl1n/36agents_oreward_seed37/" \
#     --save-rate=10 \
#     --prosp-dist=0.3 \
#     --max-num-train=600 \
#     --good-max-num-neighbors=5 \
#     --adv-max-num-neighbors=5 \
#     --eva-max-episode-len=25 \
#     --max-episode-len=25 \
#     --seed=28 \

# host_name_uncoded="${ARRAY[1]}"
# for((i=2;i<=65;i++))
# do
#   host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
# done
#
# mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
# python3  -m maddpg_o.experiments.train_darl1n \
#     --scenario=ising \
#     --good-sight=100 \
#     --adv-sight=100 \
#     --last-good=0 \
#     --last-adv=0 \
#     --num-agents=64 \
#     --num-adversaries=0 \
#     --num-learners=64 \
#     --num-food=0 \
#     --num-landmark=0\
#     --good-policy=maddpg \
#     --adv-policy=maddpg \
#     --save-dir="../result/ising/darl1n/64agents_mreward_seed16/" \
#     --save-rate=10 \
#     --prosp-dist=0.3 \
#     --max-num-train=200 \
#     --good-max-num-neighbors=5 \
#     --adv-max-num-neighbors=5 \
#     --eva-max-episode-len=25 \
#     --max-episode-len=25 \
#     --seed=16 \

host_name_uncoded="${ARRAY[1]}"
for((i=2;i<=26;i++))
do
  host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
done

mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded \
python3  -m maddpg_o.experiments.train_darl1n \
    --scenario=ising \
    --good-sight=100 \
    --adv-sight=100 \
    --last-good=0 \
    --last-adv=0 \
    --num-agents=25 \
    --num-adversaries=0 \
    --num-learners=25 \
    --num-food=0 \
    --num-landmark=0\
    --good-policy=maddpg \
    --adv-policy=maddpg \
    --save-dir="../result/ising/darl1n/25agents_0808_seed16/" \
    --save-rate=10 \
    --prosp-dist=0.3 \
    --max-num-train=600 \
    --good-max-num-neighbors=5 \
    --adv-max-num-neighbors=5 \
    --eva-max-episode-len=25 \
    --max-episode-len=25 \
    --seed=16 \
