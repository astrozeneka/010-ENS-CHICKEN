#!/bin/bash
#SBATCH -p memory
#SBATCH -n 1 -c 16
#SBATCH -t 24:00:00
#SBATCH -J OnlyMap
#SBATCH -A proj5034

module purge
module load SAMtools/1.9-intel-2019b

genomes=(
  "SRR21763962"
  "SRR24263490"
  "SRR24608364"
  "SRR24608384"
  "SRR24608387"
  "SRR24608388"
  "SRR24608392"
  "SRR24608448"
  "SRR25731328"
  "SRR25998541"
)
mkdir -p data/map_fastq_v2
for genome in "${genomes[@]}"
do
  echo "${genome}"
  # เปลียนเป็น bam ก่อน
  samtools view -@ 16 -b "data/only_map_v2/${genome}.sam" > "data/only_map_v2/${genome}_unsorted.bam"
  
  samtools sort -@ 16 "data/only_map_v2/${genome}_unsorted.bam" -o "data/only_map_v2/${genome}.bam"
  
  samtools fastq -@ 16 "data/only_map_v2/${genome}.bam" > "data/map_fastq_v2/${genome}_map.fq"
done
echo "Converting to fastq sequence done"
