#!/usr/bin/bash -l
#SBATCH -A 
#SBATCH --ntasks-per-node=28
#SBATCH -N 1
#SBATCH --output=snippy.out
#SBATCH --error=snippy.err
#SBATCH --time=03:00:00


# Query each resulting full length recombination-masked alignment for core SNPs and constant sites
apptainer exec path/to/container/snp-sites-staphdb-2.5.1.sif snp-sites -c -o clean.core.masked.aln clean.full.masked.aln
apptainer exec path/to/container/snp-sites-staphdb-2.5.1.sif snp-sites -C -o clean.full.masked.aln.fconst clean.full.masked.aln

