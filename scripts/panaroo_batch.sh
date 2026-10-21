#!/bin/bash
#SBATCH -A 
#SBATCH --ntasks-per-node=4
#SBATCH -N 1
#SBATCH --output=panaroo.out
#SBATCH --error=panaroo.err
#SBATCH --time=2:00:00




module purge > /dev/null 2>&1

apptainer run /path/to/container/panaroo_1.3.4--pyhdfd78af_0.sif panaroo -i ./gff/*.gff -o panaroo_output --clean-mode strict --remove-invalid-genes
