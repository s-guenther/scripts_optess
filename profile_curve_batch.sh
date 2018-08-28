#!/usr/bin/env bash

NPOINTSLIST=(1000 2000 4000 6000 9000 13000 \
             13001 20000 30000 30001 40000 55000 \
             55001 80000 115000 115001 140000 175000 \
             175001 200000 240000)

CORESLIST=(1 1 1 1 1 1 \
           2 2 2 4 4 4 \
           8 8 8 12 12 12 \
           16 16 16)

WALLTIMELIST=(00:00:30 00:01:00 00:01:30 00:02:00 00:03:10 00:05:00 \
              00:05:00 00:06:30 00:18:00 18:00:00 00:25:00 00:45:00 \
              00:28:00 00:32:00 00:55:00 00:50:00 01:20:00 01:40:00 \
              01:20:00 01:30:00 01:50:00)

MEMLIST=(300MB 400MB 800MB 1200MB 2600MB 3700MB \
         4GB 5GB 7600MB 8GB 12GB 15600MB \
         16GB 21500MB 31GB 32GB 37GB 46GB \
         48GB 52GB 62GB)

export NPOINTS
export CORES
export WALLTIME
export MEM
export PARTITION
export NAME

DIRNAME=curve
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
    NAME=curve_"$NPOINTS"

    echo Processing ${NAME}

    envsubst < /home/nhmcsgue/scripts_optess/profile_curve.sh > \
    ${DIRNAME}/${NAME}.sh
done
