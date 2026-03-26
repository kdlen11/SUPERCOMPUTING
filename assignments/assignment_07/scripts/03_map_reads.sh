#!/bin/bash
set -ueo pipefail

# get into data directory
cd data

# activate bbmap conda env
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh" 
conda activate bbmap-env

# make dog reference genome once
bbmap.sh ref=dog_reference/dog_reference_genome.fna

# map reads to dog reference genome using bbmap
for run in $(cut -d ',' -f1 SraRunTable.csv | tail -n +2);do
	echo "========STARTING TO MAP READS FROM RUN ${run}========";
	bbmap.sh \
	ref=dog_reference/dog_reference_genome.fna \
	in1="clean/${run}_1.fastq" \
	in2="clean/${run}_2.fastq" \
	out="../output/${run}.sam" \
	minid=0.95 \
	-Xmx16g \
	statsfile="../output/${run}-stats.txt";
	echo "========COMPLETED MAPPING READS FROM RUN ${run}========";done

# get into the outputs folder
cd ../output

# use samtools to extract reads with similar matches to the dog reference genome
for file in *.sam; do
    samtools view -b -F 4 "$file" > "${file%.sam}_dog-matches.bam"; done

# deactivate bbmap conda env
conda deactivate

# cleanup on aisle data directory!
cd ../data
rm -rf ref

# return to home directory
cd ..


