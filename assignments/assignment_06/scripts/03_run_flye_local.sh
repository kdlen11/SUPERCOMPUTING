#!/bin/bash
set -uoe pipefail

# run flye on the downloaded data
flye --nano-raw data/SRR33939694.fastq --out-dir assemblies/assembly_local --threads 5

# get rid of all but the two files which we want to keep
cd assemblies/assembly_local
rm -rf 00-assembly 10-consensus 20-repeat 30-contigger 40-polishing
rm assembly_graph.gfa assembly_graph.gv assembly_info.txt params.json

# rename the two files which we kept
mv assembly.fasta local_assembly.fasta
mv flye.log local_flye.log
