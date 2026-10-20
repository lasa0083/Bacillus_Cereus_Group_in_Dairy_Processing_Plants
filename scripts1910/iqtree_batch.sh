#!/usr/bin/bash -l
#SBATCH -A 
#SBATCH --ntasks-per-node=28
#SBATCH -N 1
#SBATCH --output=snippy.out
#SBATCH --error=snippy.err
#SBATCH --time=01:00:00


# Make a phylogeny
fconst=`cat clean.full.masked.aln.fconst`
apptainer exec ${containers}/iqtree_2.2.5--h21ec9f0_0.sif iqtree2 --seed 1000 -s clean.core.masked.aln -m MFP -B 1000 -alrt 1000 -fconst ${fconst} -T AUTO

