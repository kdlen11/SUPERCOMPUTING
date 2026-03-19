#!/bin/bash
set -uoe pipefail

# load flye module
module load Flye/gcc-11.4.1/2.9.6

# run flye on the downloaded data
flye --nano-raw data/SRR33939694.fastq --out-dir assemblies/assembly_module --threads 5

# get rid of all but the two files which we want to keep
cd assemblies/assembly_module
rm -rf 00-assembly 10-consensus 20-repeat 30-contigger 40-polishing
rm assembly_graph.gfa assembly_graph.gv assembly_info.txt params.json

# rename the two files which we kept
mv assembly.fasta module_assembly.fasta
mv flye.log module_flye.log
