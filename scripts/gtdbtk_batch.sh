#!/bin/bash
#SBATCH -A 
#SBATCH --ntasks-per-node=28
#SBATCH -N 1
#SBATCH --output=gtdbtk.out
#SBATCH --error=gtdbtk.err
#SBATCH --time=12:00:00

module purge > /dev/null 2>&1
#ml GCC/11.3.0  OpenMPI/4.1.4
#module load GTDB-Tk/2.3.2
ml GCC/13.3.0  OpenMPI/5.0.3
ml GTDB-Tk/2.6.1

#export GTDBTK_DATA_PATH=/proj/nobackup/carroll_hpc2n/databases/gtdb/release214/

#gtdbtk classify_wf --genome_dir fna --out_dir gtdbtk_out --cpus 28 --mash_db ./mash

gtdbtk classify_wf --genome_dir assemblies_fasta --extension fasta --out_dir gtdbtk_out --cpus 28 --skani_sketch_dir skani --pplacer_cpus 28

