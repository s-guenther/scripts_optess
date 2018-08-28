#!/bin/bash

NPOINTSLIST=(1000 2000 4000 6000 9000 13000 \
             13001 20000 30000 30001 40000 55000 \
             55001 80000 115000 115001 140000 175000 \
             175001 200000 240000)

CORESLIST=(1 1 1 1 1 1 \
           1 1 1 1 1 1 \
           1 1 1 1 1 2 \
           2 2 2)

WALLTIMELIST=(00:00:12 00:00:15 00:00:15 00:00:18 00:00:25 00:00:32 \
              00:00:32 00:00:45 00:01:10 00:01:10 00:01:30 00:02:10 \
              00:02:10 00:03:20 00:06:00 00:06:00 00:07:00 00:09:00 \
              00:09:00 00:10:00 00:13:00)

MEMLIST=(100MB 200MB 300MB 400MB 400MB 500MB \
         500MB 600MB 800MB 800MB 1200MB 1600MB \
         1600MB 2100MB 3200MB 3200MB 3800MB 4500MB \
         4500MB 5000MB 6500MB)

export NPOINTS
export CORES
export WALLTIME
export MEM
export PARTITION
export NAME

DIRNAME=single
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
    PARTITION=lena:haku
    NAME=single_points_"$NPOINTS"_cores_"$CORES"_partition_"$PARTITION"

    echo Processing ${NAME}

    envsubst < /home/nhmcsgue/scripts_optess/profile_single.sh > \
    ${DIRNAME}/${NAME}.sh
done

