#!/bin/sh
#This is a script to run ddscat
#PBS -N Cyl_minus1hgt_1nmLatt_rot5_DP
#PBS -l nodes=1:ppn=8
#PBS -l walltime=72:00:00
#PBS -m ae
#PBS -M lbi@ansto.gov.au
#PBS -S /bin/sh
#PBS -r n
cd $PBS_O_WORKDIR
cat $PBS_NODEFILE
export NN=`cat $PBS_NODEFILE | wc -l`
/data1/packages/openmpi/1.4/bin/mpirun -hostfile $PBS_NODEFILE -np $NN ddscat_dp
