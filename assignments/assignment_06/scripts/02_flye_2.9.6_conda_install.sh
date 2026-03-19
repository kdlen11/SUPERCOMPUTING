#!/bin/bash
set -ueo pipefail

# load and initialize conda
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

# create environment for Flye v2.9.6
mamba create -y -n flye-env -c bioconda Flye=2.9.6

# activate that environment
conda activate flye-env

# test that it works
flye -v

# export yaml file of all dependencies and versions
conda env export --no-builds > flye-env.yml

# deactivate the env
conda deactivate
