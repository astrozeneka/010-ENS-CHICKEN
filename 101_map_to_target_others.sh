#!/bin/bash
#SBATCH -p memory
#SBATCH -n 1 -c 120
#SBATCH -t 72:00:00
#SBATCH -J 2_map_to_target
#SBATCH -A proj5034

module purge
module load BWA/0.7.17-intel-2019b

genomes=(
  "SRR17968711"
  "SRR25731328"
  "SRR25998541"
)
FQ_DIR=/tarafs/scratch/proj5034-AGBKU/genome_NCBI/trimmed
for genome in "${genomes[@]}"
do
  echo "${genome}"
  bwa mem -t 120 \
    "data/fasta_seqs/target.fa" \
    "${FQ_DIR}/${genome}_trimmed.fq" \
    > "data/raw_sam_v2/${genome}.sam"
done
echo "BWA MEM Done"