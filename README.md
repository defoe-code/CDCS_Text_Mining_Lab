
For running defoe queries in [Cirrus](https://cirrus.readthedocs.io/en/master/), we first have to start a [Spark cluster](https://spark.apache.org/docs/latest/cluster-overview.html) within a **SLURM job**. And once the Spark cluster is running, then we can submit defoe queries to that cluster. 

We have divided the work performed in the **CDCS TDM Lab** in two Rounds: **Round 1** and **Round 2**. Each Round has a different set of studies, and each study have a set of defoe queries. In parallel, we have started other studies, such as **Geoparsing the Scottish Gazetteers** and **Trade Legacy Slavery**. Details of those can be found at the end of in this document.  

For understanding better how [defoe](https://github.com/defoe-code/defoe) works, we recommend to read first [this](https://ieeexplore.ieee.org/document/9041813) paper, along with checking its [documentation](https://github.com/defoe-code/defoe/blob/master/docs/run-queries.md). 

**Presentations** about **defoe** are also available [in this link](https://github.com/defoe-code/defoe/tree/master/docs/presentations). Note, that the last presentation introducing defoe was done for the **Research Libraries UK (RLUK) Text and Data Mining Seminar**, which is available [here](https://github.com/defoe-code/defoe/blob/master/docs/presentations/RLUK-DEFOE.pdf). 

As follows, we have a summary of the **instructions needed to replicate this work**. 

# 1. Spark installation steps

### Download Spark 2.4.0

 	wget http://apache.mirrors.nublue.co.uk/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz
	tar xvf spark-2.4.0-bin-hadoop2.7

### Copy all this repository in your $HOME directory

In your $HOME you need to have the following:
* spark-2.4.0-bin-hadoop2.7 
* [bash_scripts](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/bash_scripts)
* Slurm-jobs for provisioning the Spark cluster: [sparkcluster_driver.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/sparkcluster_driverslurm)
* Slurm-jobs for launching defoe queries to the Spark cluster: [Round1.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round1.slurm), [Round2.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round2.slurm), [trade_legacy_slavery.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/trade_legacy_slavery.slurm)
* Script for stopping Spark cluster (** not needed anymore**): [spark_stop.sh](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/spark_stop.sh)

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

To install **defoe in Cirrus HPC cluster**, do:

```
git clone https://github.com/defoe-code/defoe.git
source activate cirrus-py36
cd defoe
./requirements.sh
zip -r defoe.zip defoe
```

**Note**: Every time you change something inside defoe library, you need to ZIP the DEFOE code. If you dont change nothing, you dont need to zip it again.

# 4. Starting Spark Cluster in Cirrus

To start a spark cluster in Cirrus the only thing needed is to run following command:

```
sbatch sparkcluster_driver.slurm 
```

You will need to **wait until the job is running before proceding to run defoe queries**.  

You can modify [sparkcluster_driver.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/sparkcluster_driver.slurm) according to your need. For example, for chaning the amount of time, number of nodes, and account. The current script configures a **Spark cluster of 324 cores** (9 nodes *X* 36 cores per node). 

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

# 5. Submitting defoe queries for Round 1 and Round 2

During this summer, we conducted a serie of studies within the [CDCS text-mining lab](https://www.cdcs.ed.ac.uk/cdcs-text-mining-lab-call-projects?utm_campaign=2619665_CDCS%20Digest%20W%2FC%2016%20March%202020&utm_medium=email&utm_source=College%20of%20Arts%2C%20Humanities%20%26%20Social%20Sciences%2C%20The%20University%20of%20Edinburgh&dm_t=0,0,0,0,0), in which we worked with humanities and social science researchers who can ask complex questions of large-scale data sets. We selected four research projects for [Round 1](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements), and two for [Round 2](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round2_Requirements). 

A description of each research project/study can be found as follows:

**Round 1**:
   - [Jannel Kwork](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements/Janell): DSM study - [TDA newspapers](https://www.gale.com/intl/c/the-times-digital-archive)
   - [Dave O'Brien](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements/Dave): Music study - [TDA newspapers](https://www.gale.com/intl/c/the-times-digital-archive)
   - [Edward Martin](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements/Edward): Science study - [TDA newspapers](https://www.gale.com/intl/c/the-times-digital-archive)
   - [Galina Andreeva](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round1_Requirements/Galina): Pandemics study - [TDA newspapers](https://www.gale.com/intl/c/the-times-digital-archive)
   
 **Round 2**:
   - [Christine Bell and Sanja Badanjak](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round2_Requirements/Christine_Sanja): Peace/War study - [TDA newspapers](https://www.gale.com/intl/c/the-times-digital-archive)
   - [Sarah Van eydhoven and Lisa Gotthard](https://github.com/defoe-code/CDCS_Text_Mining_Lab/tree/master/Round2_Requirements/Sarah_Lisa): Scots vs English - [NLS chapbooks](https://data.nls.uk/data/digitised-collections/chapbooks-printed-in-scotland/)
   
Each reserch project/study has a serie of defoe queries. In most of them, we first submitted a *frequency query* modifying different parameters (e.g. article count vs term count, date, lexicon, target words, preprocessing treatment), and then we submitted another *query for getting the details (text)* of the desired/filtered articles/pages. The **requirements** were collected using this [document](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round2_Requirements/Readme.md) as a **baseline for formulating defoe queries**.

Later we created **two slurm jobs**, one per Round ([Round1.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round1.slurm) and [Round2.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round2.slurm)), for running all defoe queries in Cirrus. You can comment the studies that do not want to run. For running all the studies (with all defoe queries) included in **Round 1**, type the following command: 

  ```
 sbatch Round1.slurm
   ```
Similarly, for running all the studies (with all defoe queries) included in **Round 2**,  type the following command: 

  ```
 sbatch Round2.slurm
   ```

Note, that for running Round[1|2].slurm jobs, you need to have first running the **sparkcluster_driver.slurm** job. 

Also, you need to modify Round[1|2].slurm files according to your needs - e.g time, account, job name. But you will only need to **reserve 1 node** (36 cores) for submitting defoe queries to the Spark cluster. The parallelization of defoe relays on the number of nodes that the Spark cluster has been configured with (inside sparkcluster_driver.slurm - in this case with 9 nodes), and not in the number of nodes used for submitting defoe queries to the Spark cluster. 

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

# 6. Long-S fix

Many historical documents used a [long-S that OCR tends to confuse as f](https://en.wikipedia.org/wiki/Long_s). For fixing this kind of OCR errors we apply in most of our defoe queries the [longsfix_sentence function](https://github.com/defoe-code/defoe/blob/master/defoe/query_utils.py) before applying any other preprocessing treatment to the text's words. 

```
def longsfix_sentence(sentence, defoe_path, os_type)

```

This function needs to two user's parameters (apart from the sentence/word to inspect). The operating system - *os_type* -(either linux or mac), along with the path of their defoe installation - *defoe_path*. The reason is that function (LINE 263) calls to a set of different scripts depending on the user's operationg system.

Both parameteres are usually spicified in a configuration file ([example](https://github.com/defoe-code/defoe/blob/master/queries/music_including_norm.yml)) used to configure any query's parameters (e.g. preprocess treatment, lexicon file, etc).

```
preprocess: normalize
data: music.txt
defoe_path: /lustre/home/sc048/rosaf4/defoe/
os_type: linux
```

The long-S fix can be tested as a single script called [long_s.py](https://github.com/defoe-code/defoe/tree/master/defoe/long_s_fix). For running it you just need to do the following (after changing the **defoe_path** and **os_type variables** according to your needs - just in this case, those variables are specified in the python script).

```
cd $HOME/defoe/defoe/long_s_fix/
python long_s.py
```

More information about the long-S can be found in [this paper](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjyj5HM8ovsAhW1RxUIHWZJDZcQFjAAegQIBxAB&url=https%3A%2F%2Fwww.research.ed.ac.uk%2Fportal%2Ffiles%2F13581682%2FAlex_Glover_et_al_2012_Digitised_Historical_Text.pdf&usg=AOvVaw3RX7Oyz8j3OMUATnxDiHXr).

# 7. DATASETS

We have worked with the following datasets: 

- [Times Digital Archive](https://www.gale.com/intl/c/the-times-digital-archive) (TDA): Stored at UoE DataStore /chss/datastore/chss/groups/Digital-Cultural-Heritage
- [Encyclopaedia Britannica](https://nlsfoundry.s3.amazonaws.com/data/nls-data-encyclopaediaBritannica.zip)
- [ChapBooks](https://nlsfoundry.s3.amazonaws.com/data/nls-data-chapbooks.zip)
- [Scottish Gazetteers](https://nlsfoundry.s3.amazonaws.com/data/nls-data-gazetteersOfScotland.zip)

We had also planned to work with the British Library Books (BL Books), which are stored at the UoE DataStore /sg/datastore/lib/groups/lac-store/blpaper. However, this dataset is too big for storing it in Cirrus.  

### Transferring the 20th century TDA newspapers to Cirrus

Example of how to transfer a subset of TDA newspapers to Cirrus - E.g. from 1900 to 2000 (20th Century)-  using **SFTP**. 

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

# Trade Legacy Slavery Study

We also started an investigation on the slave trade and how it permeates the different volumes of the [Encyclopaedia Brittanica](https://data.nls.uk/data/digitised-collections/encyclopaedia-britannica/) (EB). We have a lexicon, [slavery_trade.txt](https://github.com/defoe-code/defoe/blob/master/queries/slavery_trade.txt), that we looked up at two levels:

- **Page level**: returning a snippet (40 words before and after each term) every time a term from the lexicon is found *in a page*.
- **Article level**: returning an article every time a term from the lexicon is foun *in an article*. For doing this, **we need first to extract all the articles per EB page**, and store them in CSV files (one per edition). See more information about extracting articles [bellow](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/README.md#extracting-automatically-articles-from-the-encyclopaedia-britannica-eb). Once extracted the articles per page, then we can use anohter defoe to filter those by the lexicon.  

At **page level** we also run the frequency query using the same lexicon. 

### Defoe queries

 - **Page level**: The query used for doing this work can be found under [nls](https://github.com/defoe-code/defoe/blob/master/defoe/nls/queries/window_keysearch_concordance_by_date.py) defoe model. 
 - **Article level**: All queries used for doing this work can be found under [nlsArticles](https://github.com/defoe-code/defoe/blob/master/defoe/nlsArticles/queries/write_articles_pages_df_hdfs.py) and [hdfs](https://github.com/defoe-code/defoe/blob/master/defoe/hdfs/queries/keysearch_articles_by_year_details.py) defoe models.
 

### Defoe queries configuration file

- [slavery.yml](https://github.com/defoe-code/defoe/blob/master/queries/slavery.yml)

This configuration file might need to be modified according to your set up and needs.

### Slurm job

The SLURM job to run this study can be found [here](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/trade_legacy_slavery.slurm). 
 
 ### Preliminary Results 
 
 - **Page level**: Text (snippets) results can be found [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2Ftrade%5Flegacy%5Fslavery%5Fnls%5Fresults%5Fwindow%5F40%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents). Frequency results can be visualized [here](https://github.com/defoe-code/defoe_visualization/tree/master/Round_1/Melissa_Terras). 
 
 - **Article level**: Text (articles) results can be found them [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2Ftrade%5Flegay%5Fslavery%5Feb%5Fper%5Farticle%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents).  
 

# Geoparsing the Scottish Gazetteers

Furthermore, we have continued our work on devising automatic and parallel methods for geoparsing large digital historical textual data by combining the strengths of three natural language processing (NLP) tools, the [Edinburgh Geoparser](https://www.ltg.ed.ac.uk/software/geoparser/), [spaCy](https://spacy.io/) and [defoe](https://github.com/defoe-code/defoe), and employing different tokenisation and named entity recognition (NER) techniques. We apply these tools to a large collection of nineteenth century [Scottish geographical](https://data.nls.uk/data/digitised-collections/gazetteers-of-scotland/) dictionaries. 

This work is being conducted in collaboration with the [Language Technology Group at Informatics](https://www.ltg.ed.ac.uk/projects/geoparsing-scottish-gazetteers/). 

For running the **defoe geoparsing queries we have not used Cirrus**, since it requires that the computing nodes have connection to internet to georesolve locations. Therefore, **we have used a VM** for this. **Instructions of how we have set up this VM** with defoe, the Edinburgh geoparser and Spark can be foud [here](https://github.com/defoe-code/defoe/blob/master/docs/setup-VM.md), along with examples of how to run defoe geoparser queries using different configurations.

We have **two defoe geoparser queries** under NLS model:
 - [Applying the original geoparser](https://github.com/defoe-code/defoe/blob/master/defoe/nls/queries/geoparser_pages.py)
 - [Applying spacy and the georesolve](https://github.com/defoe-code/defoe/blob/master/defoe/nls/queries/georesolution_pages.py)
 
These two queries are also avaible under ES model: 
 - [Applying the original geoparser to the data pre-stored in ES](https://github.com/defoe-code/defoe/blob/master/defoe/es/queries/geoparser_pages.py)
 - [Applying spacy and the georesolve to the data pre-stored in ES](https://github.com/defoe-code/defoe/blob/master/defoe/es/queries/georesolution_pages.py)
 
 **Note**: For using the queries under ES model, that would require to write the data first to ES using [this query](https://github.com/defoe-code/defoe/blob/master/defoe/nls/queries/write_pages_df_es.py) and a configuration file like [this](https://github.com/defoe-code/defoe/blob/master/queries/es_properties_edina_gaz.yml) one (which it might need to be modified according to your set up and needs).
 
**A paper describing this work** can be found [here](https://www.research.ed.ac.uk/portal/files/141855140/Geoparsing_the_historical_Gazetteers_FILGUEIRA_DOA12032020_AFV.pdf), and the **notebooks presented in this paper** can be visualized [here](https://github.com/defoe-code/defoe_visualization/tree/master/Scottish_Gazetteer/Visualization_Methods/GroupByPlaceName/With_BB). 

Recently, we have also extended this work to geoparse automatically the Encyclopaedia Britannica. Therefore, we have **four configuration files**, since the Scottish Gazetteer and Encyclopaedia Britannica uses **different gazetteers** and **bounding box** configurations (which they might need to be modified according to your set up and needs):
- [Scottish Gazetteer + Original Geoparser](https://github.com/defoe-code/defoe/blob/master/queries/geoparser_sg.yml)
- [Encyclopaedia Britannica + Original Geoparser](https://github.com/defoe-code/defoe/blob/master/queries/geoparser_eb.yml)
- [Scottish Gazetteer + Spacy + Georesolve](https://github.com/defoe-code/defoe/blob/master/queries/georesolve_sg.yml)
- [Encyclopaedia Britannica + Spacy + Georesolve](https://github.com/defoe-code/defoe/blob/master/queries/georesolve_eb.yml)


# Extracting automatically articles from the Encyclopaedia Britannica (EB)

Finally, we have created a [new defoe query for extracting automatically articles](https://github.com/defoe-code/defoe/blob/master/defoe/nlsArticles/queries/write_articles_pages_df_hdfs.py) from the EB. The articles are stored per edition (and also we have them in a single file), in CSV files. 

**Important**: For doing this work, instead of adding this query under the defoe NLS model, we have created a new one, called **nlsArticles** [model](https://github.com/defoe-code/defoe/tree/master/defoe/nlsArticles). This is because, for extracting automatically the articles from the pages, it required to introduce specific modifications at the page and archive level - just for this query. Therefore, this query under **nlsArticles and not under nls**.  

Note that for running this query, apart from Spark you need to have **HADOOP installeld** in your computing enviroment. Instructions for installing it in Cirrus can be found [here](https://github.com/EPCCed/prace-spark-for-data-scientists/tree/master/Hadoop) and for installing it in a VM can be found [here](https://github.com/defoe-code/defoe/blob/master/docs/setup-VM.md#installing-haddop-optional). (Note, I used a VM for running this query).

Furthermore, this query also need a configuration file for specifying the operating system and the defoe path for the *long_s fix*:
- [configuration_file](https://github.com/defoe-code/defoe/blob/master/queries/writehdfs.yml)

### Articles metadata

Each CSV file has a row per article found within a page, with the following columns (being the most important **term** and **definition**):
 
 - title: title of the book (e.g. Encyclopaedia Britannica)
 - edition: edition of the book (e.g Eighth edition, Volume 2, A-Anatomy)
 - year: year of publication/edition (e.g. 1853)
 - place: place (e.g. Edinburgh)      
 - archive_filename: directory path of the book (e.g. /home/rosa_filgueira_vicente/datasets/single_EB/193322698/)     
 - source_text_filename: directory Path of the page (e.g. alto/193403113.34.xml)
 - text_unit: unit that represent each ALTO XML. These could be Page or Issue. 
 - text_unit_id: id of the page (e.g. Page704)
 - num_text_unit: number of pages (e.g. 904)
 - type_archive: type of archive. Thse could be book or newspapers. 
 - model: defoe model used for ingesting this dataset (nlsArticles)
 - type_page: the page classification that has been done by defoe. These could be Topic, Articles, Mix or Full Page. 
 - header: the header of the page (e.g. AMERICA)
 - **term**: term that is going to be described (e.g. AMERICA)
 - **definition**: words describing an article / topic/ full page: ( e.g. “AMERICA. being inhabited. The Aleutian ….”)
 - num_articles: number of articles per page. In case a page has been classified as Topic or FullPage, the number of articles is 1.
 - num_page_words: number of words per page (e.g. 1373)
 - num_article_words: number of words of an article (e.g. 1362)
 
We have detected two types of articles with two different patterns at “page” level:
  - *Short articles* (named as **articles**): Usually presented by a TERM in the main text in uppercase,  followed by a “,”  (e.g. ALARM, ) and then a DESCRIPTION of the TERM (similar to an entry in a dictionary). This description normally is one or two paragraphs, but of course there are exceptions.  	
	- Term: ALARM
	- Definition: in the Military Art, denotes either the apprehension of being suddenly attacked, or the notice thereof signified by firing a cannon, firelock, or the like. False alarms are frequently made use of to harass the enemy, by keeping them constantly under arms. , ….
 
- *Long articles* (named as **topics**): In this is the case, the Encyclopaedia introduces a TERM in the header of a page (which is not the case for the short articles), and then it normally uses several pages to describe that topic (and very often it uses a combination of text, pictures, tables, etc.). For example, the “topic” AMERICA goes from page 677 to 724 (47 pages!)
 
Important: **Topic** is just the way we named the *long articles* that expands more than a page. It does not refer to “NLP topic”.

### Downloading EB articles datasets

Those files (one per edition, and also one with all articles) can be downloaded from [here](https://drive.google.com/file/d/1cZ5-OGw2uRkkrNEGet_ydZr7SdnLKEWn/view?usp=sharing). Once you decompressed the *eb_articles_per_page.tar* file, you will find these:

  ```
> tar -zxvf eb_articles_per_page.tar .
> ls -lht 
36M 24 Aug 12:01 eb_first_edition_total_articles.csv
59M 24 Aug 12:08 eb_second_edition_total_articles.csv
158M 24 Aug 12:26 eb_third_edition_total_articles.csv
105M 24 Aug 12:06 eb_fourth_edition_total_articles.csv
110M 24 Aug 11:59 eb_fifth_edition_total_articles.csv
110M 24 Aug 12:19 eb_sixth_edition_total_articles.csv
129M 24 Aug 12:14 eb_seventh_edition_total_articles.csv
137M 24 Aug 11:54 eb_eighth_edition_total_articles.csv
70M 24 Aug 11:12 eb_4_5_6_suplement_total_articles.csv
913M 24 Aug 11:48 eb_all_editions_total_articles.csv -- It has all articles for all editions!
  ```
### Slurm job

In this [SLURM](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/trade_legacy_slavery.slurm) job (in the second part of file - *At Article level*), you can find the **defoe queries necessaries for extracting the articles per edition** and storing them in HDFS files. 

