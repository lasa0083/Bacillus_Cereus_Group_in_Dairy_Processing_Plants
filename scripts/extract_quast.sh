#!/bin/bash
#SBATCH -A hpc2n2026-126
#SBATCH -n 4
#SBATCH --output=relocaterename.out
#SBATCH --error=relocaterename.err
#SBATCH --time=01:00:00


cd quast || exit 1
for d in AL{1..150}_{1..5}_shovill__quast; do
    [ -d "$d" ] || continue
    #echo
     cp -- $d/transposed_report.tsv /proj/nobackup/carroll_hpc2n/bandos/from_Raw_marina_genomes_122125/quast_transposed_report/${d}_transposed_report.tsv
done


for d in AL{1..150}_shovill__quast; do
    [ -d "$d" ] || continue
    #echo
     cp -- $d/transposed_report.tsv /proj/nobackup/carroll_hpc2n/bandos/from_Raw_marina_genomes_122125/quast_transposed_report/${d}_transposed_report.tsv
done

