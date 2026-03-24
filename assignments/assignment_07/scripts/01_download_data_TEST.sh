#!/bin/bash
set -ueo pipefail

########################
# THIS IS A TEST SCRIPT! only two runs are downloaded instead of the full 16.
########################

# change location to data directory
cd data

# loop through **the last two runs** in the SRA table, download into raw data folder
for run in $(cut -d ',' -f1 SraRunTable.csv | tail -n 2); do fasterq-dump $run -O raw/; echo "finished downloading run $run"; done

# use NCBI `datasets` to download the reference genome for Canis familiaris 
cd dog_reference
datasets download genome taxon dog --reference --include genome --filename dog-reference.zip

# unzip that and clean it all up
unzip -p dog-reference.zip "*.fna" > dog_reference_genome.fna
rm dog-reference.zip

# navigate back to root directory
cd ..
cd ..
