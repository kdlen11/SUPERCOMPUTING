# Katherine Lenshin | assignment_05 | 19 March 2026
## Final, Intended Directory structure
```
  .:
# pipeline.sh is what we will use to analyze our genomic data in full
assemblies  data  flye-env.yml  pipeline.sh  README.md  scripts

# this is where the logs are stored after 3 modes of using Flye on the data
./assemblies:
assembly_conda  assembly_local  assembly_module

./assemblies/assembly_conda:
conda_assembly.fasta  conda_flye.log

./assemblies/assembly_local:
local_assembly.fasta  local_flye.log

./assemblies/assembly_module:
module_assembly.fasta  module_flye.log

# this is where the raw data is stored
./data:
SRR33939694.fastq

# these are the scripts that made it all happen
./scripts:
01_download_data.sh             02_flye_2.9.6_manual_build.sh  03_run_flye_local.sh
02_flye_2.9.6_conda_install.sh  03_run_flye_conda.sh           03_run_flye_module.sh
```

## Scripts:
### Within `scripts` directory
<details>

**01_download_data.sh**: downloads a [fastq file containing E coli phage DNA sequencing data](https://www.ncbi.nlm.nih.gov/sra/SRX29141853) from the NIH  

**02_flye_2.9.6_conda_install.sh**: creates the conda environment `flye-env` for further downstream analysis, activates that environment, prints the version of flye, exports a yaml file of all dependencies and versions, and deactivates the environment.  

**02_flye_2.9.6_manual_build.sh**: manually installs flye into the user's `programs` folder by building it from the original repository, adds flye to user's PATH in `.bashrc`  

**03_run_flye_conda.sh**, **03_run_flye_local.sh**, and **03_run_flye_module.sh**:  

Runs flye on the downloaded data in three different ways:
- via the conda environment
- via the manual build in the user's `programs` folder
- via the version of Flye already included in the modules on W&M HPC
  
All of which should perform identical analysis on the input data, and return corresponding logs in the `assemblies` directory.
</details>

### Main script to run at root
<details>
  
  **pipeline.sh**:

  This pipeline runs the above shell scripts in order, and additionally produces a table comparing the analyses of the three different methods of using Flye.

</details>

## In order to run the pipeline sucessfully:
---
1. Clone this repository to your own
2. Ensure that the `data` and `assemblies` folders are empty
3. Ensure that you do **not** have Flye pre-installed to your `programs` folder
4. Modify the `ROOT_DIR` in `pipeline.sh` to reflect your own repository's structure
5. From the root directory, run the line `bash pipeline.sh`

## My reflections
<details>
<summary>read here for some thoughts on this assignment!</summary>  


  
  The assignment was challenging for two reasons: the filepaths, and the environments. Filepaths have always been tricky, because they must be simultaneously built and referenced in such a way that they make sense and relate to one another: when one breaks, the rest tend to quickly follow, and for this reason it is imperative to be mindful of dependencies and file locations from the very start.  
    
  The primary challenge, of course, was the environments. They are quite unintuitive initially, and all have varying syntaxes to achieve what should essentially be the same thing. Each version had its benefits and its drawbacks, and it was often challenging to keep the three different versions straight. This is, also unsurprisingly, what I learned most about in the course of this assignment.  

  Also, I had quite a time with a silly mistake I had made in not pushing my modified .gitignore with the data in it before pushing the entire repository, which contained the data file (over 100 Mb). I had to get creative with my commit pullbacks... but luckily I was able to use a backup of my assignment, wipe it, and reinstate the same exact code (sans large data file).  

  Of the methods I used, the local build was most straightforward and intuitive to me. You download something, have it in your programs and your path, and you are free to simply call it wherever and whenever you would like. Unfortunately, this is the least reproducible and most stagnant form of environment creation, so in future assignments I will likely go for a conda environment, which is more complex to set up and maintain, but has the same user-forward nature of the local install, without the reliance on admin which the modules require.
  Any challenges you had to overcome.

</details>





