Katherine Lenshin | 2/11/2026 | assignment_02

assignment_02 tasks accomplished
--------------------------------
0. open up notepad file, document all bash commands and steps to complete necessary tasks (for .readme)
1. double checked that all necessary directories existed for assignment 2
2. on local machine, used curl (curse you windows) to download genomic data (2 files) from NCBI
3. used FileZilla to transfer genomic data form local machine to repository on bora HPC
4. used chmod on data in bora to ensure that all users have read permission on genomic data
5. used md5sum to verify that both genomic files are identical between local and HPC machines
6. added aliases to .bashrc files in HPC and local home directories, describe what they do in this .readme
7. polish and upload contents of notepad file to .readme
8. commit/add/push from HPC repository to GitHub

assignment_02 directory structure
--------------------------------
[20 kdlenshin@bora ~/repos/SUPERCOMPUTING/assignments/assignment_02 ]$ls -R

.:
data  README.md

./data:
GCF_000005845.2_ASM584v2_genomic.fna.gz  GCF_000005845.2_ASM584v2_genomic.gff.gz

commands
--------------------------------
(on local machine)

cd SUPERCOMPUTING/assignments/assignment_02/data

curl -O ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz

curl -O ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gff.gz

(Connected to FileZilla quickconnect using:
- Host: bora.sciclone.wm.edu
- Username: your W&M username
- Password: your W&M password
- Port: 22
- Protocol: SFTP
Navigated to: ~/SUPERCOMPUTING/assignments/assignment_2/data/ in FileZilla and uploaded both genomic files I just downloaded)

(on bora)
ls -a (to check permissions for data files, ---> both files have permission `-rw-r-----`, would like to ensure everyone can read it)

chmod a+r GCF_000005845.2_ASM584v2_genomic.fna.gz GCF_000005845.2_ASM584v2_genomic.gff.gz

(on local machine)
$ md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz GCF_000005845.2_ASM584v2_genomic.gff.gz
c13d459b5caa702ff7e1f26fe44b8ad7 *GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41 *GCF_000005845.2_ASM584v2_genomic.gff.gz

(on bora)
$md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz GCF_000005845.2_ASM584v2_genomic.gff.gz
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz

(both files have identical hashes across machines. nice!)

(on bora and local machine)
cd
nano .bashrc (added the aliases to .bashrc)
source .bashrc

alias u='cd ..;clear;pwd;ls -alFh --group-directories-first'
---> returns to 1 directory up, clears the terminal screen, prints that directory, prints all files the long way along with their permissions and file sizes in human readable format with filetype indicators, and groups what it displays by directories first.

alias d='cd -;clear;pwd;ls -alFh --group-directories-first'
---> reverts you back to your most previous directory, clears the terminal screen, prints the current working directory, prints all files the long way along with their permissions and file sizes in human readable format with filetype indicators, and groups what it displays by directories first.

alias ll='ls -alFh --group-directories-first'
---> prints all files the long way along with their permissions and file sizes in human readable format with filetype indicators, and groups what it displays by directories first.

4-5 sentence reflection
--------------------------------
This assignment went quite smoothly for me! I was pleased with how I was able to accomplish it. The primary roadblock was getting the NCBI data. FTP was not working, and I kept receiving an error stating that I had made an illegal PORT command. After talking with some classmates, we figured out the workaround of using curl -O, which was convenient but not fully what the assignment entailed -- I wish I had been able to use ftp, mget, and bye. Additionally, there were a couple commands in this assignment with which I was unfamiliar, namely chmod for rewriting file permissions and deciphering the bash aliases given, but with some help from google both tasks were quite understandable.

