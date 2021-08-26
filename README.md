
# Tutorials of Using MPI on Amazon EC2

This is the tutorial of building a distributed computing system based on MPI and Amazon EC2. This tutorial contains instructions on configurations of Amazon EC2 computing instances, shell scripts to coordinate the distributed computing system and scripts for distributed matrix multiplication using MPI.

## Instructions on configurations of Amazon EC2 computing instance
Here are instructions to install MPI and mpi4py packages and configure the ssh service to enable communications between instances. You can also directly use public AMI image on Amazon EC2, which is ready to use. 

### An ready-to-use public Amazon EC2 AMI
Make sure to select area US East (Ohio) us-east-2

```
AMI ID:  ami-08f358515eb338ca2

owner:  753214619702
```

### Steps to configure an Amazon EC2 instance

- Install MPI
```
sudo apt install openmpi-bin openmpi-dev openmpi-common openmpi-doc libopenmpi-dev
```

- Install mpi4py
```
pip3 install mpi4py
```

- Configure ssh to enable passwordless login between instances


## Shell scripts for coordinating distributed computing systems

### Create instances and extract IP address information
Create instances on the Amazon EC2 website to build a distributed computing system, which consists of a master node and multiple worker nodes. Copy the Amazon instances information into the file `amazon_instances_info`, for example:
```
–	i-0f7f74cf0420a75a3	c5n.large	52.15.165.68	2021/08/08 09:11 GMT-7
–	i-003c00df228882bfd	c5n.large	18.218.185.168	2021/08/08 09:11 GMT-7
–	i-062f6166ac671a077	c5n.large	52.15.88.70	2021/08/08 09:11 GMT-7
```
Here are three instances in total and let the first instance to be the master node and the rest two instances are worker nodes. We need the IP address information for communications. In the example above, 52.15.165.68 is the IP address of the master node. We run the following script to get IP addresses of all nodes and store it into the file `nodeIPaddress`
```
./get_ip_address.sh
```
or 
```
awk '{ print $4 }' amazon_instances_info > nodeIPaddress
```
which extracts strings of the 4th column of the file `amazon_instances_info` and store them in the file `nodeIPaddress`.



### Login master node
Run the scipt to login the master node
```
./login_master.sh 1
```
The index after the command indicates i-th node. In this case, '1' stands for the first node or master node. The content of the `login_master.sh`:
```
#!/usr/bin/ksh
ARRAY=()
while read LINE
do
    ARRAY+=("$LINE")
done < nodeIPaddress
ssh  -i ~/AmazonEC2/.ssh/linux_key_pari.pem ubuntu@${ARRAY[$1]}
```
in which `~/AmazonEC2/.ssh/linux_key_pari.pem` is the key pair permission generated and downloaded when you create an instance on Amazon EC2. In this case, the name of my key-pair is `linux_key_pari.pem` and placed in the directory `~/AmazonEC2/.ssh/`. You need to change it correspondingly based on your cases. You may also need to install `ksh` libraries using `apt-get install ksh` to run the script.

### Run the MPI program in the master node
The next step is to run the MPI program in the master node. Before running the MPI program, for example, `hcmm.py`. You need it to put the `hcmm.py` in the same directory of all nodes.  (You can use the shell script `transferFile.sh` to upload files from local host to Amazon EC2, which will be explained later.). Then you can run the script 
```
./run_mpi.sh
```
The file `nodeIPaddress` should be in the same directory with `run_mpi.sh` in the master node.

### Helper scripts

- `--scenario`: defines which environment in the MPE is to be used (default: `"grassland"`)

- `--map-size`: The size of the environment. 1 if normal and 2 otherwise. (default: `"normal"`)

- `--sight`: The agent's visibility radius. (default: `100`)

- `--alpha`: Reward shared weight. (default: `0.0`)

- `--max-episode-len` maximum length of each episode for the environment (default: `25`)

- `--num-episodes` total number of training episodes (default: `200000`)

- `--num-good`: number of good agents in the scenario (default: `2`)

- `--num-adversaries`: number of adversaries in the environment (default: `2`)

- `--num-food`: number of food(resources) in the scenario (default: `4`)

- `--good-policy`: algorithm used for the 'good' (non adversary) policies in the environment
(default: `"maddpg"`; options: {`"att-maddpg"`, `"maddpg"`, `"PC"`, `"mean-field"`})

- `--adv-policy`: algorithm used for the adversary policies in the environment
(default: `"maddpg"`; options: {`"att-maddpg"`, `"maddpg"`, `"PC"`, `"mean-field"`})
```
