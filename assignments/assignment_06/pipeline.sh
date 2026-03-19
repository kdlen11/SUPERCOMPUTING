#!/bin/bash
set -ueo pipefail
ROOT_DIR="$HOME/repos/SUPERCOMPUTING/assignments/assignment_06"

# download the data
bash scripts/01_download_data.sh

# build local Flye + return to root directory
bash scripts/02_flye_2.9.6_manual_build.sh
cd $ROOT_DIR

# build flye conda env and yml file
bash scripts/02_flye_2.9.6_conda_install.sh

# run flye once for each of the three environments
bash scripts/03_run_flye_conda.sh
cd $ROOT_DIR

bash scripts/03_run_flye_local.sh
cd $ROOT_DIR

bash scripts/03_run_flye_module.sh
cd $ROOT_DIR

# print results to the screen, comparing the three methods' performances
paste <(tail -10 assemblies/assembly_conda/conda_flye.log) <(tail -10 assemblies/assembly_local/local_flye.log) <(tail -10 assemblies/assembly_module/module_flye.log)

