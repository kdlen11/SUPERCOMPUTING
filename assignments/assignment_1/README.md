$ cd /c/Users/katy/repos/SUPERCOMPUTING
$ mkdir -p assignments/assignment_1
$ touch assignments/assignment_1/assignment_1_essay.md
$ cd assignments/assignment_1
$ cat > assignment_1_essay.md
(ASSIGNMENT ESSAY PASTED HERE)
$ touch README.md
$ git add .
$ git commit -m "added assignments and assignment_1 directories, populated with essay and (empty) README."
$ git push origin main
$ git add assignments/assignment_1/assignment_1_essay.md
$ git commit -m "Resolve merge conflict - kept essay file"
$ git push origin main
$ touch README.md
$ git add README.md
$ git commit -m "added back README.md file, which got deleted in resolving merge ocnflict"
$ git push origin main
$ mkdir data
$ cd data
$ mkdir input
$ cd input
$ touch input_data.csv
$ cd ..
$ mkdir interim
$ cd interim
$ touch interim_data.csv
$ cd ..
$ mkdir output
$ cd output
$ touch output_data.csv
$ cd ..
$ git add .
$ git status
$ git commit -m "added dummy data folders with empty csvs in each."
$ git push origin main
$ cd ..
$ mkdir scripts
$ cd scripts
$ touch example_script.py
$ cd ..
$ mkdir config
$ cd config/
$ touch config.py
$ cd ..
$ mkdir logs
$ cd logs
$ touch sample_log.txt
$ cd ..
$ git add .
$ git status
$ git commit -m "added more dummy subfolders with placeholder files inside."
$ git push origin main

(continue here with commands used to add this ordered list of commands to the README.md file in assignment_1).

This process was more challenging than I thought... so often do we underestimate the power of a solid user interface. I love my GitHub desktop. It was valuable, however, and I certainly felt accomplished at having made changes to my GitHub repo using only the command line. I do think I could have done with a but less `cd ..` usage and jumping between directories... it would have been good to do everything cleanly from the root directory, and to have staged and committed/pushed everything more cleanly and in less steps.