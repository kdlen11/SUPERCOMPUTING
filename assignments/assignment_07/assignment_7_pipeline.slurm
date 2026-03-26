#!/bin/bash
#SBATCH --job-name=assignment_07
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=720
#SBATCH --mem=28G
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=kdlenshin@wm.edu               # change this!
#SBATCH -o /sciclone/home/kdlenshin/repos/SUPERCOMPUTING/assignments/assignment_07/logs/assignment_07_%j.out # change this!
#SBATCH -e /sciclone/home/kdlenshin/repos/SUPERCOMPUTING/assignments/assignment_07/logs/assignment_07_%j.err # change this!

set -ueo pipefail

bash scripts/01_download_data.sh
echo "--------------DONE DOWNLOADING DATA-------------------"
bash scripts/02_clean_reads.sh
echo "--------------DONE CLEANING READS---------------------"
bash scripts/03_map_reads.sh
echo "--------------DONE MAPPING READS----------------------"
