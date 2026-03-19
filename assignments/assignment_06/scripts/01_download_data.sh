#!/bin/bash
set -ueo pipefail

# get into data folder
cd data

# fetch and unzip small genomic dataset
wget https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz
gunzip SRR33939694.fastq.gz

# return to root
cd ..
