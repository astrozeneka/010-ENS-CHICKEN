#!/bin/bash
#SBATCH -p compute
#SBATCH -n 1 -c 64
#SBATCH -t 24:00:00
#SBATCH -J BWAjob_ryan
#SBATCH -A proj5034

module purge
module load SAMtools/1.9-intel-2019b

genomes=(
  "SRR20726277"
)
for genome in "${genomes[@]}"
do
  echo "${genome}"
  samtools view -@ 96 -F 4 "data/raw_sam/${genome}.sam" > "data/only-map/${genome}.sam"
done