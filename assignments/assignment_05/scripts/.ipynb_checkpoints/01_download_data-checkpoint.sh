#!/bin/bash
set -ueo pipefail

# set working directory to raw data folder
RAW_DATA_DIR=$HOME/repos/SUPERCOMPUTING/assignments/assignment_05/data/raw
cd ${RAW_DATA_DIR}

# download and unpack fastq tarball
wget https://gzahn.github.io/data/fastq_examples.tar
tar -xvf fastq_examples.tar 

# remove old file
rm fastq_examples.tar
