#!/bin/bash
#SBATCH -A 
#SBATCH -n 4
#SBATCH --output=relocaterename.out
#SBATCH --error=relocaterename.err
#SBATCH --time=01:00:00


cd shovill_output || exit 1
for d in AL{1..150}_{1..5}_shovill; do
    [ -d "$d" ] || continue
    #echo
     cp -- $d/*.fasta /path/to/assemblies/assemblies_fasta/${d}_.fasta
done


for d in AL{1..150}_shovill; do
    [ -d "$d" ] || continue
    #echo
     cp -- $d/*.fasta /path/to/assemblies/${d}_.fasta
done

