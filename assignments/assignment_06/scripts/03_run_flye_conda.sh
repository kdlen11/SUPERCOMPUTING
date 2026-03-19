#!/bin/bash
set -uoe pipefail

# load and initialize conda
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

# activate environment
conda activate flye-env

# run flye on the downloaded data
flye --nano-raw data/SRR33939694.fastq --out-dir assemblies/assembly_conda --threads 5

#deactivate conda environment
conda deactivate

# get rid of all but the two files which we want to keep
cd assemblies/assembly_conda
rm -rf 00-assembly 10-consensus 20-repeat 30-contigger 40-polishing
rm assembly_graph.gfa assembly_graph.gv assembly_info.txt params.json

# rename the two files which we kept
mv assembly.fasta conda_assembly.fasta
mv flye.log conda_flye.log

