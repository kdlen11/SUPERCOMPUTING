Katherine Lenshin | 2/19/2026 | assignment_03
---------------------------------------------

assignment_03 tasks accomplished
---------------------------------------------
Created subdirectory for data in assignment_03 folder, put data into the .gitignore (so as not to push data to GitHub)
imported and unzipped A. thalliana genomic data into said data folder
Ran Unix commands from the command line to examine the contents of the genomic data


assignment_03 directory structure
---------------------------------------------
[9 kdlenshin@bora ~/repos/SUPERCOMPUTING/assignments/assignment_03 ]$ls -R
.:
data  README.md

./data:
GCF_000001735.4_TAIR10.1_genomic.fna


commands used
---------------------------------------------
git pull
cd assignments/assignment_03
mkdir data
cd data
wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz
gunzip GCF_000001735.4_TAIR10.1_genomic.fna.gz
cd ..
cd ..
cd ..
nano .gitignore
--> add to .gitignore assignments/assignment_03/data/*.fna
data="GCF_000001735.4_TAIR10.1_genomic.fna"

grep -c ">" $data 
7

grep -v ">" $data | tr -d '\n' | wc -c 
119668634

cat $data | wc -l
14

grep ">" $data | grep "mitochondrion" | wc -l
1

grep ">" $data | grep "chromosome" | wc -l
5

grep -v ">" $data | head -n 1 | wc -c
30427672
grep -v ">" $data | head -n 2 | tail -n 1 | wc -c
19698290
grep -v ">" $data | head -n 3 | tail -n 1 | wc -c
23459831

grep -A 1 "chromosome 5" $data| tail -n 1 | wc -c
26975503

grep "AAAAAAAAAAAAAAAA" $data| wc -l
1

grep ">" $data | sort | head -n 1
>NC_000932.1 Arabidopsis thaliana chloroplast, complete genome

paste -d '\t' <(grep ">" $data) <(grep -v ">" $data)
# output is massive and will not be in this readme.

reflection
---------------------------------------------

I approached this assignment the same way I approach nearly every problem in coding: by breaking the problem down into its constituent parts, seeing what resources I had to solve each part, and putting them back together into a final solution. The problems in this assignment were all quite simple, and accomplishable using the bash commands which we have covered in class (grep did a lot of heavy lifting in this assignment). The practice of doing many simple but varied tasks was useful, and I learned different ways to pipe simple commands together in ways that make sense but I would not have initially thought to use. 

I was frustrated at times by the syntax of some commands (I think I tried every possible permutation of `head`, `-n` and the number of lines I wanted to fetch at least once during the course of the assignment). Additionally, there were some tasks which were accomplished easily using flags that I did not know about before googling the specific functions of a certain command, like `grep -c`, for example.

The kinds of skills used in this assignment, specifically the ability to creatively piece together simple commands in order to achieve more complex tasks, are absolutely essential to computational work. In fact, I would even say that this ability is what separates a good coder from a bad one. A computer is inherently a very stupid thing — it only does exactly what it is told to do, no more, and no less. Errors are nearly always the fault of the human coder. In this sense, becoming well versed in giving a computer specific commands in the correct order to achieve a desired outcome is fundamentally the job of the coder, and this is illustrated even here, in simple sequences of commands to get correct information about the full genome assembly of A. thalliana.




