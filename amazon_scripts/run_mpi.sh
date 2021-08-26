#!/usr/bin/ksh
ARRAY=()
host_name=""
k=0

# Read IP address from the file nodeIPaddress
while read LINE
do
    ARRAY+=("$LINE")
    ((k=k+1))
done < nodeIPaddress


# Use array ARRAY to store the ip address
host_name_uncoded="${ARRAY[1]}"
for((i=2;i<=k;i++))
do
  host_name_uncoded="${host_name_uncoded},${ARRAY[i]}"
done

# Run MPI command to run hcmm.py
mpirun --mca plm_rsh_no_tree_spawn 1 --mca btl_base_warn_component_unused 0  --host $host_name_uncoded  python3 hcmm.py
