#!/bin/bash
#SBATCH -A 
#SBATCH -n 1
#SBATCH --output=relocaterename.out
#SBATCH --error=relocaterename.err
#SBATCH --time=01:00:00


cd trimgalore_output || exit 1
for d in AL{1..150}_trim_galore; do
    [ -d "$d" ] || continue
    #echo
     cp -- $d/*.fq.gz /path/to/trimmed_fastp_poly_a_trim_galore/
done

for d in AL{1..150}_{1..5}_trim_galore; do
    [ -d "$d" ] || continue
    #echo
     cp -- $d/*.fq.gz /path/to/trimmed_fastp_poly_a_trim_galore/
/
done
