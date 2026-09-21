#!/bin/bash
#SBATCH -A 
#SBATCH --ntasks-per-node=28
#SBATCH -N 1
#SBATCH --output=checkm.out
#SBATCH --error=checkm.err
#SBATCH --time=12:00:00




module purge > /dev/null 2>&1

apptainer run /path/to/container/checkm-genome_1.2.2.sif checkm lineage_wf -x fna -t 28 -f checkm_out.txt --tab_table fna checkm_out
