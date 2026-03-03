#!/bin/bash

# pipeline script is the conductor. Calls modular scripts in order
# usage: ./pipeline.sh [N bases to chop]

# set data directory
DATA_DIR = "/sciclone/scr10/gzdata440/lesson_05/data/"

# chop up the data files
./scripts/chop_files.sh $1

# run stats
./scripts/get_stats.sh
