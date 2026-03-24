#!/bin/bash
set -ueo pipefail

###################
# THIS IS A TESTING SCRIPT (runs in tandem with 01_download_data_TEST.sh)
###################

# get into data directory
cd data

# on the newly unzipped data, run fastp cleaning on every newly-downloaded forward file
for run in $(cut -d ',' -f1 SraRunTable.csv | tail -n 2);do
	fastp \
        --in1 "raw/${run}_1.fastq" \
        --in2 "raw/${run}_2.fastq" \
        --out1 "clean/${run}_1.fastq" \
        --out2 "clean/${run}_2.fastq" \
        --json /dev/null \
        --html /dev/null \
        --trim_front1 8 \
        --trim_front2 8 \
        --trim_tail1 20 \
        --trim_tail2 20 \
        --n_base_limit 0 \
        --length_required 100 \
        --average_qual 20; done

# return to home directory
cd ..
