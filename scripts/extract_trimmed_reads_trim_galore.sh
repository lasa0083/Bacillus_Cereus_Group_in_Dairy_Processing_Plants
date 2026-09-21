#!/bin/bash
#SBATCH -A hpc2n2026-126
#SBATCH -n 1
#SBATCH --output=relocaterename.out
#SBATCH --error=relocaterename.err
#SBATCH --time=01:00:00


cd trimgalore_output || exit 1
for d in AL{1..150}_trim_galore; do
    [ -d "$d" ] || continue
    #echo
     cp -- $d/*.fq.gz /proj/nobackup/carroll_hpc2n/bandos/from_Raw_marina_genomes_122125/trimmed_fastp_poly_a_trim_galore/
done

for d in AL{1..150}_{1..5}_trim_galore; do
    [ -d "$d" ] || continue
    #echo
     cp -- $d/*.fq.gz /proj/nobackup/carroll_hpc2n/bandos/from_Raw_marina_genomes_122125/trimmed_fastp_poly_a_trim_galore/
/
done
