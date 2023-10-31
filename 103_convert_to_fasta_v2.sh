#!/bin/bash
#SBATCH -p memory
#SBATCH -n 1 -c 16
#SBATCH -t 24:00:00
#SBATCH -J OnlyMap
#SBATCH -A proj5034

module purge
module load SAMtools/1.9-intel-2019b

genomes=(
  "SRR17968711"
)
mkdir -p data/map_fastq_v2
for genome in "${genomes[@]}"
do
  echo "${genome}"
  # เปลียนเป็น bam ก่อน
  samtools view -@ 16 "data/only_map_v2/${genome}.sam" > "data/only_map_v2/${genome}_unsorted.bam"
  exit
  samtools sort -@ 16 "data/only_map_v2/${genome}_unsorted.bam" -o "data/only_map_v2/${genome}.bam"
  exit
  samtools fastq -@ 16 "data/only_map_v2/${genome}.bam" > "data/map_fastq_v2/${genome}_map.fq"
  exit
done