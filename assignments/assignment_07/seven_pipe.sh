#!/bin/bash
set -ueo pipefail

bash scripts/01_download_data_TEST.sh
echo "--------------DONE DOWNLOADING DATA-------------------"
bash scripts/02_clean_reads_TEST.sh
echo "--------------DONE CLEANING READS---------------------"
bash scripts/03_map_reads_TEST.sh
echo "--------------DONE MAPPING READS----------------------"
