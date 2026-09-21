#!/bin/bash
#SBATCH -A 
#SBATCH -n 4
#SBATCH --output=relocaterename.out
#SBATCH --error=relocaterename.err
#SBATCH --time=01:00:00


cd btyper3_output || exit 1
for d in AL{1..150}_{1..5}_shovill__btyper3; do
    [ -d "$d" ] || continue
    echo
     cp -- $d/btyper3_final_results/*__final_results.txt /path/to/btyper3_final_report/${d}.txt
done


for d in AL{1..150}_shovill__btyper3; do
    [ -d "$d" ] || continue
    #echo
     cp -- $d/btyper3_final_results/*__final_results.txt /path/to/btyper3_final_report/${d}.txt
done

