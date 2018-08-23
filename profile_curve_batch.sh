#!/usr/bin/env bash

NPOINTSLIST=(4500 6000 8000 10000 15000 20000 30000 45000 60000 80000 100000 \
             4500 6000 8000 10000 15000 20000 30000 45000 60000 80000 100000 \
             4500 6000 8000 10000 15000 20000 30000 45000 60000 80000 100000 \
             4500 6000 8000 10000 15000 20000 30000 45000 60000 80000 100000 \
             4500 6000 8000 10000 15000 20000 30000 45000 60000 80000 100000 \
             4500 6000 8000 10000 15000 20000 30000 45000 60000 80000 100000)

CORESLIST=(1 1 1 1 1 1 1 1 1 1 1 \
           2 2 2 2 2 2 2 2 2 2 2 \
           4 4 4 4 4 4 4 4 4 4 4 \
           8 8 8 8 8 8 8 8 8 8 8 \
           12 12 12 12 12 12 12 12 12 12 12 \
           16 16 16 16 16 16 16 16 16 16 16)

WALLTIMELIST=(00:01:40 00:02:00 00:02:45 00:03:30 00:06:30 00:07:30 \
                       00:14:00 00:21:00 00:28:00 00:38:00 00:48:00 \
              00:01:40 00:02:00 00:02:45 00:03:30 00:06:30 00:07:30 \
                       00:14:00 00:21:00 00:28:00 00:38:00 00:48:00 \
              00:01:40 00:02:00 00:02:45 00:03:30 00:06:30 00:07:30 \
                       00:14:00 00:21:00 00:28:00 00:38:00 00:48:00 \
              00:01:40 00:02:00 00:02:45 00:03:30 00:06:30 00:07:30 \
                       00:14:00 00:21:00 00:28:00 00:38:00 00:48:00 \
              00:01:40 00:02:00 00:02:45 00:03:30 00:06:30 00:07:30 \
                       00:14:00 00:21:00 00:28:00 00:38:00 00:48:00 \
              00:01:40 00:02:00 00:02:45 00:03:30 00:06:30 00:07:30 \
                       00:14:00 00:21:00 00:28:00 00:38:00 00:48:00)

MEMLIST=(1000MB 1300MB 2200MB 2800MB 4200MB 5200MB 9GB 13GB 17GB 23GB 28GB \
         1000MB 1300MB 2200MB 2800MB 4200MB 5200MB 9GB 13GB 17GB 23GB 28GB \
         1000MB 1300MB 2200MB 2800MB 4200MB 5200MB 9GB 13GB 17GB 23GB 28GB \
         1000MB 1300MB 2200MB 2800MB 4200MB 5200MB 9GB 13GB 17GB 23GB 28GB \
         1000MB 1300MB 2200MB 2800MB 4200MB 5200MB 9GB 13GB 17GB 23GB 28GB \
         1000MB 1300MB 2200MB 2800MB 4200MB 5200MB 9GB 13GB 17GB 23GB 28GB)

PARTITIONLIST=(lena lena lena lena lena lena lena lena lena lena lena \
               lena lena lena lena lena lena lena lena lena lena lena \
               lena lena lena lena lena lena lena lena lena lena lena \
               lena lena lena lena lena lena lena lena lena lena lena \
               lena lena lena lena lena lena lena lena lena lena lena \
               lena lena lena lena lena lena lena lena lena lena lena)

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
