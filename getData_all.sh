jingqi@697s-MacBook-Pro ~ % scp Desktop/Project/Bergland_Lab/Projects/In\(2L\)t_Tracking/DEST/dest_v2.samps_24Aug2024.csv cqh6wn@login.hpc.virginia.edu:/scratch/cqh6wn/In2Lt_Tracking/
#!/bin/bash
#SBATCH -J getData_all
#SBATCH --ntasks-per-node=1
#SBATCH -N 1
#SBATCH -t 10:00:00
#SBATCH --mem=80G
#SBATCH -p standard
#SBATCH --account=berglandlab
#SBATCH --output=/scratch/cqh6wn/In2Lt_Tracking/getdata_all.%A_%a.out
#SBATCH --error=/scratch/cqh6wn/In2Lt_Tracking/getdata_all.%A_%a.err
#SBATCH --array=1-500

module load gcc/11.4.0 openmpi/4.1.4 R/4.3.1; echo "R_LIBS_USER=~/R/goolf/4.3" > ~/.Renviron

Rscript /scratch/cqh6wn/In2Lt_Tracking/getData_all.R $SLURM_ARRAY_TASK_ID

