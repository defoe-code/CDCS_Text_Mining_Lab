#!/bin/bash
#SBATCH --job-name=writeHDFS
#SBATCH --time=48:00:00
#SBATCH --exclusive
#SBATCH --nodes=1
#SBATCH --tasks-per-node=36
#SBATCH --cpus-per-task=1
#SBATCH --account=xxxxx
#SBATCH --partition=standard
#SBATCH --qos=standard
 
module load spack
export JAVA_HOME=/lustre/sw/spack/opt/spack/linux-centos7-x86_64/gcc-6.2.0/jdk-8u92-linux-x64-24xtmiygsdlaayomilfa5mnrasmxqlhj
module load anaconda/python3
source activate cirrus-py36

export SPARK_HOME=$HOME/spark-2.4.0-bin-hadoop2.7
export SPARK_MASTER_HOST=$HOSTNAME
export SPARK_MASTER_PORT=7077
export SPARK_MASTER_WEB:UI_PORT=8080
export PATH=$SPARK_HOME/sbin:$SPARK_HOME/bin:$PATH
export HADOOP_HOME=$HOME/HADOOP/hadoop-2.9.2
export HADOOP_CONF_DIR=$HOME/HADOOP/conf_dir
export PATH=$PATH:$HADOOP_HOME/bin


hostmaster=$(cat "bash_scripts/master.log")
echo "Master Node" $hostmaster
export SPARK_HOME=${HOME}/spark-2.4.0-bin-hadoop2.7


NUM=$(wc -l $HOME/bash_scripts/worker.log)
NUMWORKERS=$(echo $NUM| cut -d' ' -f1)
NUMCORES=$( expr 32 '*' "$NUMWORKERS")


echo "Number of cores for this query is" $NUMCORES
cd $HOME/defoe

#### Detecting automatically the EB articles; preprocessing them ; and storing them as HDFS files.

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py nls_first_edition.txt  nlsArticles defoe.nlsArticles.queries.write_articles_pages_df_hdfs -r results_first_edition -n $NUMCORES > log_first_edition.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py nls_second_edition.txt  nlsArticles defoe.nlsArticles.queries.write_articles_pages_df_hdfs -r results_second_edition -n $NUMCORES > log_second_edition.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py nls_thrid_edition.txt  nlsArticles defoe.nlsArticles.queries.write_articles_pages_df_hdfs -r results_third_edition -n $NUMCORES > log_third_edition.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py nls_fourth_edition.txt  nlsArticles defoe.nlsArticles.queries.write_articles_pages_df_hdfs -r results_fourth_edition -n $NUMCORES > log_fourth_edition.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py nls_fifth_edition.txt  nlsArticles defoe.nlsArticles.queries.write_articles_pages_df_hdfs -r results_fifth_edition -n $NUMCORES > log_fifth_edition.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py nls_sixth_edition.txt  nlsArticles defoe.nlsArticles.queries.write_articles_pages_df_hdfs -r results_sixth_edition -n $NUMCORES > log_sixth_edition.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py nls_seventh_edition.txt  nlsArticles defoe.nlsArticles.queries.write_articles_pages_df_hdfs -r results_seventh_edition -n $NUMCORES > log_seventh_edition.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py nls_eighth_edition.txt  nlsArticles defoe.nlsArticles.queries.write_articles_pages_df_hdfs -r results_eighth_edition -n $NUMCORES > log_eighth_edition.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py nls_suplements.txt  nlsArticles defoe.nlsArticles.queries.write_articles_pages_df_hdfs -r results_suplements_edition -n $NUMCORES > log_suplements_edition.txt 


#### Running the keysearch_articles_by_year_details QUERY against the HDFS files previously calculated

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py hdfs_data_first.txt hdfs defoe.hdfs.queries.keysearch_articles_by_year_details queries/slavery.yml -r trade_legacy_slavery_eb_articles_first_edition.txt  -n $NUMCORES > log_1.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py hdfs_data_second.txt hdfs defoe.hdfs.queries.keysearch_articles_by_year_details queries/slavery.yml -r trade_legacy_slavery_eb_articles_second_edition.txt  -n $NUMCORES > log_2nd.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py hdfs_data_fourth.txt hdfs defoe.hdfs.queries.keysearch_articles_by_year_details queries/slavery.yml -r trade_legacy_slavery_eb_articles_thrid_edition.txt  -n $NUMCORES > log_3rd.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py hdfs_data_fourth.txt hdfs defoe.hdfs.queries.keysearch_articles_by_year_details queries/slavery.yml -r trade_legacy_slavery_eb_articles_fourth_edition.txt  -n $NUMCORES > log_4th.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py hdfs_data_fifth.txt hdfs defoe.hdfs.queries.keysearch_articles_by_year_details queries/slavery.yml -r trade_legacy_slavery_eb_articles_fifth_edition.txt  -n $NUMCORES > log_5th.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py hdfs_data_six.txt hdfs defoe.hdfs.queries.keysearch_articles_by_year_details queries/slavery.yml -r trade_legacy_slavery_eb_articles_sixth_edition.txt  -n $NUMCORES > log_6th.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py hdfs_data_seventh.txt hdfs defoe.hdfs.queries.keysearch_articles_by_year_details queries/slavery.yml -r trade_legacy_slavery_eb_articles_seventh_edition.txt  -n $NUMCORES > log_7th.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py hdfs_data_eighth.txt hdfs defoe.hdfs.queries.keysearch_articles_by_year_details queries/slavery.yml -r trade_legacy_slavery_eb_articles_eighth_edition.txt  -n $NUMCORES > log_8th.txt 

$SPARK_HOME/bin/spark-submit --master spark://$hostmaster:7077 --executor-memory 60g --py-files defoe.zip defoe/run_query.py hdfs_data_suplement.txt hdfs defoe.hdfs.queries.keysearch_articles_by_year_details queries/slavery.yml -r trade_legacy_slavery_eb_articles_4_5_6_suplements.txt  -n $NUMCORES > log_suplements.txt 



