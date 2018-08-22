#!/bin/bash

NPOINTSLIST=(1000 1500 2000 3000 4500 6000 8000 \
             10000 15000 20000 30000 45000 60000 80000\
             100000 150000 200000 300000 450000 600000 800000\
             1000000)

CORESLIST=(1 1 1 1 1 1 1 \
           1 1 1 1 1 1 1 \
           1 1 1 1 1 1 1 \
           1)

WALLTIMELIST=(00:00:12 00:00:15 00:00:15 00:00:15 00:00:15 00:00:18 00:00:20 \
              00:00:22 00:00:35 00:00:45 00:01:00 00:01:30 00:02:00 00:02:50 \
              00:03:40 00:07:00 00:10:00 00:18:00 00:32:00 01:00:00 01:42:00 \
              02:20:00)

MEMLIST=(200MB 220MB 240MB 256MB 300MB 350MB 400MB \
         400MB 600MB 700MB 1000MB 1400MB 1800MB 2400MB \
         3GB 4GB 5GB 8GB 12GB 15GB 20GB \
         25GB)

PARTITIONLIST=(lena lena lena lena lena lena lena \
               lena lena lena lena lena lena lena \
               lena lena lena lena lena lena lena \
               lena)

export NPOINTS
export CORES
export WALLTIME
export MEM
export PARTITION
export NAME

DIRNAME=singlesubs
if [ ! -d ${DIRNAME}j ]
then
    mkdir ${DIRNAME}
fi

for ((i=0;i<${#NPOINTSLIST[@]};i++))
do
    NPOINTS="${NPOINTSLIST[i]}"
    CORES="${CORESLIST[i]}"
    WALLTIME="${WALLTIMELIST[i]}"
    MEM="${MEMLIST[i]}"
    PARTITION="${PARTITIONLIST[i]}"
    NAME=single_points_"$NPOINTS"_cores_"$CORES"_partition_"$PARTITION"

    echo Processing ${NAME}

    envsubst < /home/nhmcsgue/scripts_optess/profile_single.sh > \
    ${DIRNAME}/${NAME}.sh
done

