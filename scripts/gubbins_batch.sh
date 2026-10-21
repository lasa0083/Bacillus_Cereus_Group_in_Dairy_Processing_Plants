#!/usr/bin/bash -l
#SBATCH -A 
#SBATCH --ntasks-per-node=28
#SBATCH -N 1
#SBATCH --output=gubbins.out
#SBATCH --error=gubbins.err
#SBATCH --time=01:00:00

# Identify and remove recombinations
apptainer exec ${containers}/gubbins_3.4--py39pl5321h577a1d6_1.sif run_gubbins.py -p gubbins clean.full.aln --tree-builder iqtree-fast --first-tree-builder iqtree-fast --threads 28

# Get the full length recombination masked alignment
apptainer exec ${containers}/gubbins_3.4--py39pl5321h577a1d6_1.sif mask_gubbins_aln.py --aln clean.full.aln --gff gubbins.recombination_predictions.gff --out clean.full.masked.aln
