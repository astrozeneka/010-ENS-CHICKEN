#!/bin/bash
#SBATCH -p compute
#SBATCH -n 1 -c 96
#SBATCH -t 24:00:00
#SBATCH -J 1_index
#SBATCH -A proj5034


module purge
module load BWA/0.7.17-intel-2019b

SEQ_LIST=(
  "target"
)

cd "data/fastq_seqs"
for seq in "${SEQ_LIST[@]}"
do
  echo "${seq[@]}"
  bwa index "${seq}.fasta"
done
echo "Fasta indexing done"