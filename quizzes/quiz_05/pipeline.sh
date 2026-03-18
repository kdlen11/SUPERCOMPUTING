#!/bin/bash
set -ueo pipefail
BASE_DIR=$HOME/repos/SUPERCOMPUTING/quizzes/quiz_05

# fetch and unzip fastq tarball
${BASE_DIR}/scripts/01_prep_data.sh

# remove the zipped tarball
${BASE_DIR}/scripts/03_cleanup.sh

# get stats from the newly imported data
${BASE_DIR}/scripts/02_get_stats.sh
