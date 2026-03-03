# Katherine Lenshin | assignment_5 | 04 March 2026
---
## In this assignment, I…
### 1. created a script (`./scripts/01_download_data.sh`) which downloads a fastq data tarball from github, and unpacks its contents into `./data/raw`.
<details>
<summary>click to view code...</summary>
        
> cd ~/repos/SUPERCOMPUTING/assignments/assignment_05 
        
> mkdir log

> mkdir scripts

> mkdir data

> mkdir data/{raw,trimmed}

> cd scripts

> touch 01_download_data.sh

> nano 01_download_data.sh

\# add the following lines to this script:
```
#!/bin/bash
set -ueo pipefail

# set working directory to raw data folder
RAW_DATA_DIR=$HOME/repos/SUPERCOMPUTING/assignments/assignment_05/data/raw
cd ${RAW_DATA_DIR}

# download and unpack fastq tarball
wget https://gzahn.github.io/data/fastq_examples.tar
tar -xvf fastq_examples.tar

# remove old file
rm fastq_examples.tar
```
> chmod +x 01_download_data.sh

> cd ~/programs/

> wget http://opengene.org/fastp/fastp

> chmod a+x ./fastp

> fastp --version

\# it is fastp 1.1.0

> nano ~/.bashrc

\# add the following line to bashrc: `export PATH=$PATH:/sciclone/home/kdlenshin/programs/fastp`

> exec bash
</details>

### 2. created another script (`./scripts/02_run_fastp.sh`) which runs a fastp protocol on R1 and R2 .gz files, trimming them and adding the outputs to `./data/trimmed/`).
<details>
<summary>click to view code...</summary>
        
> cd SUPERCOMPUTING/assignments/assignment_05/scripts/
        
> touch 02_run_fastp.sh

> chmod +x 02_run_fastp.sh

\# add the following lines to the script:
```
#!/bin/bash
set -ueo pipefail

# defining variables for 4 necessary fastp inputs
FWD_IN=$1
REV_IN=${FWD_IN/_R1_/_R2_}
FWD_OUT=${FWD_IN/.fastq.gz/.trimmed.fastq.gz}
REV_OUT=${REV_IN/.fastq.gz/.trimmed.fastq.gz}

#running fastp on input fwd sample with some specific arguments
fastp \
        --in1 ${FWD_IN} \
        --in2 ${REV_IN} \
        --out1 ${FWD_OUT/raw/trimmed} \
        --out2 ${REV_OUT/raw/trimmed} \
        --json /dev/null \
        --html /dev/null \
        --trim_front1 8 \
        --trim_front2 8 \
        --trim_tail1 20 \
        --trim_tail2 20 \
        --n_base_limit 0 \
        --length_required 100 \
        --average_qual 20
```
</details>

### 3. created a pipeline script in root (`pipeline.sh`) which links the two scripts together, and runs them in a loop on all of the downloaded .gz files.
<details> 
<summary>click to view code...</summary>
        
> cd ..
        
> nano pipeline.sh

\# add the following code to the script:
```
#!/bin/bash
set -ueo pipefail

# set base directory from which scripts should be run
BASE_DIR=$HOME/repos/SUPERCOMPUTING/assignments/assignment_05

# run script that downloads fastq data tarball, opens it in the data directory and removes the compressed file
${BASE_DIR}/scripts/01_download_data.sh

# on the newly unzipped data, run fastp cleaning on every newly-downloaded forward file
for file in ${BASE_DIR}/data/raw/*_R1_*;do ./scripts/02_run_fastp.sh ${file}; done
```
> chmod +x pipeline.sh

> bash pipeline.sh

\# profit
</details>

## In order to run this code...
1. Clone the repository onto your own machine
2. Create the following directories inside `assignment_05`:
- `data/raw`
- `data/trimmed`
3. Modify the following two scripts to ensure the base paths which they use align with yours:
- `./scripts/01_download_data.sh`
- `./pipeline.sh`
4. from `assignment_05`, run `bash pipeline.sh`

<details>
<summary> <h2>Some reflections on this assignment... </h2></summary>
        
The most challenging portion of this assignment was definitely the filepaths. This is what we primarily focused on in class during lesson 5 -- making filepaths work between different scripts which exist in different folders, modifying and pulling from data folders which also exist in completely separate places. I managed to brute-force the filepaths to work by using near-absolute paths in my data download and pipeline scripts, but this is an inelegant solution which relies on having not only a SUPERCOMPUTING directory identical to mine, but also a larger identically named `repos` folder where `SUPERCOMPUTING` lives.

I did learn a lot about relative and absolute filepaths in the process of making these scripts, of course, and I also learned about fastp (which was incredibly convenient to use -- there is no wonder it is as popular as it is!). I learned about the ability to call and use different filepaths within scripts themselves, and I learned the cool replacement trick of using ${root_dir/dir1/file.gz/dir1/dir2} to change the sub-folder of a file without having to manually enter and move files from one folder to another.

As I understand it, we split the two scripts and then called them with an overall pipeline for the sake of modularity. For one, the process of debugging is much easier. When the final pipeline script fails, it is easy to tell which script in the pipeline failed, and only have to debug that specific portion of code. This also has the added benefit of making the ultimate directory quite clean in its folder organization, allowing for easier readability and comprehension for people looking at the code for the first time. Finally, the modularization of scripts allows each script to be resued in different pipelines, without ever needing to be rewritten.

There are far less cons to modularization than pros, which is why it is encouraged, but the one frustrating part that comes with modularization of code (which I have elaborated upon above) is that there are often issues with dependencies amongst scripts that often need resolving.
</details>

