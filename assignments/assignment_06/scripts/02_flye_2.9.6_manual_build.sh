#!/bin/bash
set -ueo pipefail

# navigate to `programs` directory in home directory
cd ~/programs

# follow github instructions to build Flye
git clone https://github.com/fenderglass/Flye
cd Flye
make

# add Flye to PATH
echo 'export PATH=$PATH:/sciclone/home/kdlenshin/programs/Flye/bin' >> ~/.bashrc
