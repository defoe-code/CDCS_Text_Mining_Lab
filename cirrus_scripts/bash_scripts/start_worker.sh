#!/bin/bash
hostmaster=$1
hostdriver=$2
export SPARK_HOME=${HOME}/spark-2.4.0-bin-hadoop2.7
export HOSTNAME=`hostname`
module load anaconda/python3
source activate cirrus-py36

echo "I am at " $HOSTNAME "and the master is " $hostmaster

if [ $HOSTNAME != $hostmaster ] && [ $HOSTNAME != $hostdriver ]
then
 echo "Started SLAVE on `hostname`"
 echo $HOSTNAME >> worker.log
 
 cd $SPARK_HOME/
 sbin/start-slave.sh $hostmaster:7077

else
  echo "Master" $hostmaster "or driver node" $hostdriver" - I dont start an SLAVE on " $HOSTNAME
fi

