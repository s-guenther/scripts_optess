#!/usr/bin/env bash

NPOINTSLIST=(4500 6000 8000 10000 15000 20000 \
             4500 6000 8000 10000 15000 20000 \
             4500 6000 8000 10000 15000 20000)

CORESLIST=(1 1 1 1 1 1 1 \
           4 4 4 4 4 4 4 \
           8 8 8 8 8 8 8)

WALLTIMELIST=(00:04:30 00:06:00 00:08:00 00:10:00 00:14:00 00:19:00 \
              00:04:30 00:06:00 00:08:00 00:10:00 00:14:00 00:19:00 \
              00:04:30 00:06:00 00:08:00 00:10:00 00:14:00 00:19:00)

MEMLIST=(1300MB 1700MB 2200MB 2600MB 3800MB 5000MB \
         1300MB 1700MB 2200MB 2600MB 3800MB 5000MB \
         1300MB 1700MB 2200MB 2600MB 3800MB 5000MB)

PARTITIONLIST=(lena lena lena lena lena lena \
               lena lena lena lena lena lena \
               lena lena lena lena lena lena)

export NPOINTS
export CORES
export WALLTIME
export MEM
export PARTITION
export NAME

DIRNAME=curvesubs
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
    NAME=curve_"$NPOINTS"_cores_"$CORES"_partition_"$PARTITION"

    echo Processing ${NAME}

    envsubst < /home/nhmcsgue/scripts_optess/profile_curve.sh > \
    ${DIRNAME}/${NAME}.sh
done
