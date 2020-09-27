
For running TDM defoe querie in [Cirrus](https://cirrus.readthedocs.io/en/master/), we have to start a spark cluster, and once the cluster is running, then we can submit the defoe queries to such cluster. 

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
* Slurm-jobs for launching defoe queries to the Spark cluster: Round1.slurm, Round2.slurm, trade_legacy_slavery.slurm
* Script for stopping Spark cluster (usually not needed): spark_stop.sh


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
python
>> import nltk
   nltk.download('wordnet')
bash scripts/download_ntlk_corpus.sh
```

# 4. Starting Spark Cluster in Cirrus

To start a spark cluster in Cirrus the only thing needed is to run following command:

```
sbatch sparkcluster_driver.slurm 
```

We have to wait until the job is running before proceding to run defoe queries.  

You can modify [sparkcluster_driver.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/sparkcluster_driver.slurm) according to your need. For example, for chaning the amount of time, number of nodes, and account. The current script configures a spark cluster of 324 cores. 

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

During this summer, we conducted a serie of studies within the [CDCS text-mining lab](https://www.cdcs.ed.ac.uk/cdcs-text-mining-lab-call-projects?utm_campaign=2619665_CDCS%20Digest%20W%2FC%2016%20March%202020&utm_medium=email&utm_source=College%20of%20Arts%2C%20Humanities%20%26%20Social%20Sciences%2C%20The%20University%20of%20Edinburgh&dm_t=0,0,0,0,0), in which we worked with humanities and social science researchers who can ask complex questions of large-scale data sets. We selected four research projects for [Round 1](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements), and two for [Round 2](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round2_Requirements). 

**Round 1**:
   - [Jannel Kwork](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements/Janell): DSM study - TDA newspapers
   - [Dave O'Brien](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements/Dave): Music study - TDA newspapers
   - [Edward Martin](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements/Edward): Science study - TDA newspapers
   - [Galina Andreeva](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements/Galina): Pandemics study - TDA newspapers
   
 **Round 2**:
   - [Christine Bell and Sanja Badanjak](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round2_Requirements/Christine_Sanja): Peace/War study - TDA newspapers
   - [Sarah Van eydhoven and Lisa Gotthard](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round2_Requirements/Sarah_Lisa): Scots vs English - NLS chapbooks
   
Each reserch project/study had a serie of defoe queries. In most of them, we first submitted a frequency query modifying different parameters (e.g. article count vs term count, date, lexicon, target words, preprocessing treatment), and then we submitted another query for getting the details (text) of the desired/filtered articles. The requirements were collected using this [document](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round2_Requirements/Readme.md)

So, we have created two slurm jobs, one per Round: [Round1.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round1.slurm) and [Round2.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round2.slurm). You can comment the studies that do not want to run.

  ```
 sbatch Round_1.slurm
   ```
Note, that for running Round_[1|2].slurm job, you need to have first running the **sparkcluster_driver.slurm** job. 

Also, you need to modify Round_[1|2].slurm files according to your needs - e.g time, account, job name. But you will only need to **reserve 1 node** (36 cores) for submitting defoe queries - **do not** use more than 1 NODE for running the defoe queries.

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

# 6. DATASET

We have worked with the following datasets: 

- Times Digital Archive (TDA): Stored at UoE DataStore /chss/datastore/chss/groups/Digital-Cultural-Heritage
- [Encyclopaedia Britannica](https://nlsfoundry.s3.amazonaws.com/data/nls-data-encyclopaediaBritannica.zip)
- [ChapBooks](https://nlsfoundry.s3.amazonaws.com/data/nls-data-chapbooks.zip)
- [Scottish Gazetters](https://nlsfoundry.s3.amazonaws.com/data/nls-data-gazetteersOfScotland.zip)

We also had planned to work with the British Library Books (BL Books), which are stored at the UoE DataStore /sg/datastore/lib/groups/lac-store/blpaper. However, this dataset is too big for storing it in Cirrus.  

### Transferring the 20th century TDA newspapers to Cirrus

Example of how to transfer a subset of TDA newspapers - E.g. from 1900 to 2000 (20th Century). 

```
mkdir -p $HOME/TDA_GDA_1785-2009/
cd $HOME/TDA_GDA_1785-2009/
sftp -oPort=22222 XXX@chss.datastore.ed.ac.uk:/chss/datastore/chss/groups/Digital-Cultural-Heritage/LBORO/TimesDigitalArchive_XMLS/TDA_GDA_1785-2009

Connected to chss.datastore.ed.ac.uk.
Changing to: /chss/datastore/chss/groups/Digital-Cultural-Heritage/LBORO/TimesDigitalArchive_XMLS/TDA_GDA_1785-2009

sftp> get 19[0-9][0-9]/*/*.xml .
```
### Example of how to create a data file with all XML files 

This data file is needed for running defoe queries against the downloaded dataset. 

```
find $HOME/TDA_GDA_1785-2009/ -name "*.xml" | sort > tda_1900_1999.txt
```

# Round 1 and Round 2 Results

Results of these studies (Round 1 and Round 2) are uploaded [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx).

Furthermore, we have also created several **notebooks for visualizing frequency results**:

- [Frequency visualizations for Round 1](https://github.com/defoe-code/defoe_visualization/tree/master/Round_1)
- [Frequency visualizations for Round 2](https://github.com/defoe-code/defoe_visualization/tree/master/Round_2)

# Trade Legacy Slavery

We also started an investigation on the slave trade and how it permeates the different volumes of the encyclopaedia Brittanica. We have a lexicon,[slavery_trade.txt](https://github.com/defoe-code/defoe/blob/master/queries/slavery_trade.txt), that we would like to look up at:

- **Page level**: returning a snippet (40 words before and after each term) every time a term is found in a page 
- **Article level**: returning an article every time a term is foun in an article

At **page level** we also run the frequency query using the same lexicon. 

The SLURM job to run this study can be found [here](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/trade_legacy_slavery.slurm). 
 
 ### Preliminary Results 
 
 - **Page level**: Text (snippet) results can be found [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2Ftrade%5Flegacy%5Fslavery%5Fnls%5Fresults%5Fwindow%5F40%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents)). Frequency results can be visualized [here](https://github.com/defoe-code/defoe_visualization/tree/master/Round_1/Melissa_Terras).
 
 - **Article level**: Text (articles) results can be found them [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2Ftrade%5Flegay%5Fslavery%5Feb%5Fper%5Farticle%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents). 
 

# Geoparsing the Scottish Gazetters

Furthermore, we have continued our work on devising automatic and parallel methods for geoparsing large digital historical textual data by combining the strengths of three natural language processing (NLP) tools, the [Edinburgh Geoparser](https://www.ltg.ed.ac.uk/software/geoparser/), [spaCy](https://spacy.io/) and [defoe](https://github.com/defoe-code/defoe), and employing different tokenisation and named entity recognition (NER) techniques. We apply these tools to a large collection of nineteenth century [Scottish geographical](https://data.nls.uk/data/digitised-collections/gazetteers-of-scotland/) dictionaries. 

This work is done in collaboration with the [Language Technology Group at Informatics](https://www.ltg.ed.ac.uk/projects/geoparsing-scottish-gazetteers/). 

For running the **defoe geoparsing queries we have not used Cirrus**, since it requires that the computing nodes have connection to internet to georesolve locations. Therefore, **we have used a VM** for this. **Instructions of how we have set up this VM** with defoe, geoparser and Spark can be foud [here](https://github.com/defoe-code/defoe/blob/master/docs/setup-VM.md). 

**A paper describing this work** can be found [here](https://www.research.ed.ac.uk/portal/files/141855140/Geoparsing_the_historical_Gazetteers_FILGUEIRA_DOA12032020_AFV.pdf), and the **notebooks presented in this paper** can be visualized [here](https://github.com/defoe-code/defoe_visualization/tree/master/Scottish_Gazetteer/Visualization_Methods/GroupByPlaceName/With_BB). 

 

