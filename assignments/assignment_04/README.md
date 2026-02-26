Katherine Lenshin | 2/26/2026 | assignment_04
---

assignment_04 tasks accomplished
---
- downloaded and unpacked gh 'tarball' file
- created bash script `install_gh.sh` which automates this task, added its location to $PATH in .bashrc
- ran gh auth login to set up GitHub username + password on HPC
- created another installation script `install_seqtk.sh` for use on fasta files
- wrote script `summarize_fasta.sh` which takes a fasta file as stdin, and produces stdout containing:
	- total # sequences
	- total # nucleotides
	- table of sequence names and lengths 
- found and transferred NCBI fasta files for Apple (Malus domestica) and Phallusia mammillata (Solitary marine tunicate)
- ran `summarize_fasta.sh` in a loop on those 4 separate fasta files


assignment_04 directory structure
---
[164 kdlenshin@bora ~/repos/SUPERCOMPUTING/assignments/assignment_04 ]$ls -R
.:
data  README.md  summarize_fasta.sh

./data:
GCA_042453785.1_GDT2T_hap1_genomic.fna         GCF_042453785.1_GDT2T_hap1_genomic.fna
GCA_965637545.1_kaPhaMamm4.hap1.1_genomic.fna  GCF_965637545.1_kaPhaMamm4.hap1.1_genomic.fna


commands used
---

> wget https://github.com/cli/cli/releases/download/v2.74.2/gh_2.74.2_linux_amd64.tar.gz

> tar -xzvf gh_2.74.2_linux_amd64.tar.gz

> rm gh_2.74.2_linux_amd64.tar.gz

> touch install_gh.sh
> nano install_gh.sh

## add previous lines into install_gh.sh

> chmod +x install_gh.sh

> nano ~/.bashrc

## add to $PATH '/sciclone/home/kdlenshin/programs/gh_2.74.2_linux_amd64/bin'

> gh auth login
## configured git protocol and logged in successfully!

touch install_seqtk.sh
## add the following lines to install seqtk:

##!/bin/bash
#set -ueo pipefail
#git clone https://github.com/lh3/seqtk.git;
#cd seqtk; make
#echo 'export PATH=$PATH:/sciclone/home/kdlenshin/programs/seqtk' >> ~/.bashrc

> chmod +x install_seqtk.sh

> bash install_seqtk.sh

## play around with seqtk using assignment 3 fasta file

> touch summarize_fasta.sh

> chmod +x summarize_fasta.sh

## add the following lines to summarize_fasta.sh:
##!/bin/bash
#set -ueo pipefail
#filename=$1
#num_seq=$(seqtk size $filename | cut -f1)
#num_nuc=$(grep -v '^>' $filename | wc -c)
#seq_length_table=$(seqtk comp $filename | cut -f1,2)
#echo the number of sequences is:
#echo $num_seq
#echo
#echo the number of nucleotides is:
#echo $num_nuc
#echo
#echo the length of each sequence is:
#echo "$seq_length_table"

## using web browser, navigate to www.ncbi.nlm.nih.gov and find fatsa files for Apple (Malus domestica) and Phallusia mammillata (Solitary marine tunicate)
## then transfer those zip files to HPC using FileZilla, unzip them and extract only the fasta files to assignment_04/data
## rm -rf the rest of the directory + original zip file

> for fasta in data/*.fna; do bash summarize_fasta.sh $fasta | head -n 25;done
## (had to truncate because some of my fasta files had hundreds of sequences)

Reflection
---
As the complexity of the assignments increases, as does the number of correct, possible ways to arrive to a solution. This is the beauty of programming, but also what makes it incredibly challenging. We are approaching that exact point in the semester wiht supercomputing, which I am finding more challenging, but I am confident in my foundational unix abilities as developed earlier in the semester.

I learned a lot of very useful things over the course of this assignment! Namely I learned the syntax for installing and using external packages (which will be incredibly useful moving forward, especially into our final projects), and additionally I learned For Loop syntax in unix (which will also be incredibly useful).

$PATH is a beautiful thing -- it is an envireonmental variable which exists in .our bashrc and directs the computer to the directories in which all available programs live, so that those programs can be called from any directory and run properly (even though they are not being run in that exact file location where they exist).
