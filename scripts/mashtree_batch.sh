#!/bin/bash
#SBATCH -A hpc2n2026-126
#SBATCH --nodes=16
#SBATCH --output=mashtree.out
#SBATCH --error=mashtree.err
#SBATCH --time=12:00:00




module purge > /dev/null 2>&1

apptainer run /proj/nobackup/carroll_hpc2n/containers/mashtree_1.4.5--pl5321h031d066_0.sif* mashtree ./assemblies_fasta/*.fasta > mashtree.dnd
