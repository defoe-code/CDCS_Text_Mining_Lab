
For running TDM defoe querie in Cirrus, we have to start a spark cluster, and once the cluster is running, then we can submit the defoe queries to such cluster. 

We have divided the defoe queries performed in TDM in two Rounds: Round 1 and Round 2. Each Round has a different set of studies. 

Cirrus do not have spark installed - so we need to install it in our $HOME directory. And later, we have to 




# 1. Spark installation steps

### Download Spark 2.4.0

 	wget http://apache.mirrors.nublue.co.uk/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz
	tar xvf spark-2.4.0-bin-hadoop2.7

### Copy all this repository in your $HOME directory

In your $HOME you need to have the following:
* spark-2.4.0-bin-hadoop2.7 
* bash_scripts
* Slurm-jobs for provisioning the Spark cluster: sparkcluster_driver.slurm
* Slurm-jobs for launching defoe queries to the Spark cluster: Round1.slurm, Round2.slurm, NlsArticles.slurm
* Script for stopping Spark cluster (usually no needed): spark_stop.sh


# 2. Creating a conda python3 enviroment in Cirrus

To create a python 3 enviroment in Cirrus, do:

```
module load anaconda/python3 
conda create -n cirrus-py36 python=3.6 anaconda
```

To activate an active environment, use:

```

source activate cirrus-py36

```

To deactivate an active environment, use:

```
source deactivate

```

# 3. Installing defoe in Cirrus (inside the conda enviroment)

To install defoe in Cirrus, do:

```
git clone https://github.com/defoe-code/defoe.git
source activate cirrus-py36
cd defoe
./requirements.sh

>> python
>> import nltk
   nltk.download('wordnet')
bash scripts/download_ntlk_corpus.sh
```

# 4. Starting Spark Cluster in Cirrus

To start a spark cluster in Cirrus the only thing needed is to run following command:

```
   >> sbatch sparkcluster_driver.slurm 
   
```

We have to wait until the job is running before proceding to run defoe queries.  

You can modify [sparkcluster_driver.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/cirrus_scripts/sparkcluster_driver.slurm) according to your need. For example, for chaning the amount of time, number of nodes, and account. The current script configures a spark cluster of 324 cores. 

```
#SBATCH --job-name=SPARKCLUSTER
#SBATCH --time=24:00:00
#SBATCH --exclusive
#SBATCH --nodes=9
#SBATCH --tasks-per-node=36
#SBATCH --cpus-per-task=1
#SBATCH --account=XXXX
#SBATCH --partition=standard
#SBATCH --qos=standard

```

# 5. Submitting defoe queries for Round 1 and Round 2.

During this summer, we conducted a serie of studies within the [CDCS text-mining lab](https://www.cdcs.ed.ac.uk/cdcs-text-mining-lab-call-projects?utm_campaign=2619665_CDCS%20Digest%20W%2FC%2016%20March%202020&utm_medium=email&utm_source=College%20of%20Arts%2C%20Humanities%20%26%20Social%20Sciences%2C%20The%20University%20of%20Edinburgh&dm_t=0,0,0,0,0), in which we worked with humanities and social science researchers who can ask complex questions of large-scale data sets. We selected four research projects for Round 1, and two for Round 2. 

Round 1:
   - Jannel Kwork: DMS study - TDA newspapers
   - Dave O'Brien: Music study - TDA newspapers
   - Edward Martin: Science study - TDA newspapers
   - Galina Andreeva: Pandemics study - TDA newspapers
   
 Round 2:
   - Christine Bell and Sanja Badanjak: Peace/War study - TDA newspapers
   - Sarah Van eydhoven and Lisa Gotthard: Scots vs English - NLS chapbooks
   
Each reserch project/study had a serie of defoe queries. In most of them, we first submitted a frequency query modifying different parameters (e.g. article count vs term count, date, lexicon, target words, preprocessing treatment), and then we submitted another query for getting the details (text) of the desired/filtered articles. 

So, we have created two slurm jobs, one per Round: [Round1.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/cirrus_scripts/Round1.slurm) and [Round2.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/cirrus_scripts/Round2.slurm). You can comment the studies that do not want to run.

  ```
   >> sbatch Round_1.slurm
   ```
Note, that for running Round_[1|2].slurm job, you need to have first running the **sparkcluster_driver.slurm** job. 

Also, you will need to modify Round_[1|2].slurm files according to your needs - e.g time, account, job name. But you will only need to **reserve 1 node** (36 cores).

```
#!/bin/bash
#SBATCH --job-name=Round1
#SBATCH --time=20:00:00
#SBATCH --exclusive
#SBATCH --nodes=1
#SBATCH --tasks-per-node=36
#SBATCH --cpus-per-task=1
#SBATCH --account=XXXX
#SBATCH --partition=standard
#SBATCH --qos=standard
```


