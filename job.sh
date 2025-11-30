#!/bin/bash

#SBATCH -J deb500           # Job name
#SBATCH -o mod.o%j       # Name of stdout output file
#SBATCH -e mod.e%j       # Name of stderr error file
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

MET_FILE=$(ls met_nmm.d01.* 2>/dev/null | head -n 1) && [ -n "$MET_FILE" ] && NEW_VALUE=$(ncdump -h "$MET_FILE" | grep "num_metgrid_levels = " | awk '{print $3}') && sed -i "s/num_metgrid_levels = [0-9]*,/num_metgrid_levels = $NEW_VALUE,/" namelist.input

ibrun ./real_nmm.exe > real.log      # Use ibrun instead of mpirun or mpiexec
ibrun ./wrf.exe > wrf.log

#Remove additional files
rm rsl.*
rm metgrid.log.*
rm GRIBFILE*
rm geogrid.log.*
rm FILE:*

#plot
\. "/work2/09534/st37357/share/anaconda3/etc/profile.d/conda.sh" || return $?
conda activate "$@"

# Launch MPI code...
python ext_rain.py > py.log
