#!/bin/bash
set -ueo pipefail

filename=$1

num_seq=$(seqtk size $filename | cut -f1)

num_nuc=$(grep -v '^>' $filename | wc -c)

seq_length_table=$(seqtk comp $filename | cut -f1,2)

echo the number of sequences is:
echo $num_seq
echo
echo the number of nucleotides is:
echo $num_nuc
echo
echo the length of each sequence is:
echo "$seq_length_table"
