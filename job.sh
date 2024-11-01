#!/bin/bash

#SBATCH -J deb500           # Job name
#SBATCH -o debby.o%j       # Name of stdout output file
#SBATCH -e debby.e%j       # Name of stderr error file
#SBATCH -p skx          # Queue (partition) name
#SBATCH -N 16               # Total # of nodes
#SBATCH -t 24:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-type=all    # Send email at begin and end of job
#SBATCH -A ATM24007       # Project/Allocation name (req'd if you have more than 1)
#SBATCH --mail-user=sasanka@utexas.edu

# Any other commands must follow all #SBATCH directives...
. /work/09534/st37357/ls6/intel/oneapi/setvars.sh

# Launch MPI code...
ibrun ./geogrid.exe > geog.log
./ungrib.exe > ungrib.log
mpirun -n 96 ./metgrid.exe > metgrid.log
ibrun ./real_nmm.exe > real.log      # Use ibrun instead of mpirun or mpiexec
ibrun ./wrf.exe > wrf.log

#plot
\. "/work2/09534/st37357/share/anaconda3/etc/profile.d/conda.sh" || return $?
conda activate "$@"

# Launch MPI code...
python acc_austin.py > py.log
