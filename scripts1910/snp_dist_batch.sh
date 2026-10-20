#!/usr/bin/bash -l
#SBATCH -A 
#SBATCH --ntasks-per-node=28
#SBATCH -N 1
#SBATCH --output=snippy.out
#SBATCH --error=snippy.err
#SBATCH --time=01:00:00

# Convert the recombination masked core SNP alignment to a SNP distance matrix
apptainer exec ${containers}/snp-dists_v0.8.2.sif snp-dists -b clean.core.masked.aln > snp-dists.tsv
