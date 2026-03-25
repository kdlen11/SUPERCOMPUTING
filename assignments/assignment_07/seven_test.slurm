#!/bin/bash
#SBATCH --job-name=seven_test
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=45
#SBATCH --mem=28G
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=kdlenshin@wm.edu               # change this!
#SBATCH -o /sciclone/home/kdlenshin/repos/SUPERCOMPUTING/assignments/assignment_07/test07_%j.out # change this!
#SBATCH -e /sciclone/home/kdlenshin/repos/SUPERCOMPUTING/assignments/assignment_07/test07_%j.err # change this!

set -ueo pipefail

bash scripts/01_download_data_TEST.sh
echo "--------------DONE DOWNLOADING DATA-------------------"
bash scripts/02_clean_reads_TEST.sh
echo "--------------DONE CLEANING READS---------------------"
bash scripts/03_map_reads_TEST.sh
echo "--------------DONE MAPPING READS----------------------"
