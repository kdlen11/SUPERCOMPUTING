#!/bin/bash
set -ueo pipefail

# set base directory from which scripts should be run
BASE_DIR=$HOME/repos/SUPERCOMPUTING/assignments/assignment_05

# run script that downloads fastq data tarball, opens it in the data directory and removes the compressed file
${BASE_DIR}/scripts/01_download_data.sh

# on the newly unzipped data, run fastp cleaning on every newly-downloaded forward file
for file in ${BASE_DIR}/data/raw/*_R1_*;do ./scripts/02_run_fastp.sh ${file}; done
