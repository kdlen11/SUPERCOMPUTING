# Katherine Lenshin | assignment_07 | 26 March 2026
## In this assignment, I...
<details>
  <summary>Click to expand</summary>
  <h3>1. Set up my data directory to the following:</h3>
  <pre><code>
 assignment_7_pipeline.slurm  data  logs  output  README.md  scripts

  ./data:
  clean  dog_reference  raw
  </code></pre>
  
  <h3>2. Manually downloaded the metadata of 10 SRA accessions as a CSV to my local machine, and transferred them to the <code>data/</code> directory in the HPC using FileZilla</h3>
 <ul>
  <li> Data were Illumina sequences of shotgun metagenome data (not PacBio or ONT)</li>
  <li> Search query used in SRA was <code>("metagenome"[Organism] AND illumina[platform] AND random[selection] NOT amplicon[strategy])</code></li>
 </ul>

  <h3>3. Wrote the following three scripts:</h3>
  <ol>
    <li><code>scripts/01_download_data.sh</code>, which loops through the runs in the metadata CSV and </li>
    <ul>
      <li>uses <code>fasterq</code> downloads the raw data from those accessions into the directory <code>data/raw/</code></li>
      <li>also uses NCBI <code>datasets</code> downloads the reference genome for Canis familiaris into the directory <code>data/dog_reference/</code></li>
    </ul>
    <li><code>script/02_clean_reads.sh</code>, which uses <code>fastp</code> with the following parameters to clean up the downloaded reads:</li>
      <pre><code>        
          --trim_front1 5 
          --trim_front2 5 
          --trim_tail1 10 
          --trim_tail2 10 
          --n_base_limit 0 
          --length_required 50 
          --average_qual 20
      </code></pre>
    
  <li><code>scripts/03_map_reads.sh</code>, which uses <code>bbmap.sh</code> and <code>samtools</code> (both found in the bbmap conda environment) to map the clean reads to the dog genome, and extract the reads which matched it</li>
  </ol>
  
  <h3>4. Wrote the SLURM script <code>assignment_07_pipeline.slurm</code>, which</h3>
    <ul>
    <li>chains those three functions together in a pipeline into a format submittable to SLURM</li>
    <li>outputs <code>.err</code> and <code>.out</code> (for job tracking purposes) to <code>logs/</code></li>
    </ul>
    
  <h3>5. Ran the slurm script, which took 3:40:45 to complete.</h3>
  
  <h3>6. Manually inspected my results, leading to the following genome similarities between my SRA data and the dog genome:</h3>
  <pre><code>
      +-------------+-------------+------------------+-------------+
      | Sample ID   | Total Reads | Dog-mapped Reads | percent dog |
      +-------------+-------------+------------------+-------------+
      | SRR37648978 | 6198160     | 373305           | 6.023       |
      | SRR8822470  | 1410092     | 2056             | 0.146       |
      | SRR36970944 | 112506      | 108              | 0.096       |
      | ERR14374250 | 9504366     | 1740             | 0.018       |
      | SRR8891899  | 9112702     | 341              | 0.004       |
      | SRR8960227  | 1677024     | 58               | 0.003       |
      | SRR8891822  | 7289016     | 215              | 0.003       |
      | ERR16145340 | 474282      | 5                | 0.001       |
      | ERR1913137  | 2179640     | 15               | 0.001       |
      | SRR8891915  | 8555142     | 27               | 0.000       |
      +-------------+-------------+------------------+-------------+
  </pre></code>
  Turns out that the SRR37648978 run with 6% dog similarity was taken from a tick pathogen in Poland in 2022. We can perhaps assume what sort of organism it might have been attached to!
    
  </details>

  ## In order to run this notebook on your own...
  <details><summary>Click to expand...</summary>
  <h3>1. Clone this repository</h3>
  <h3>2. Ensure that you have:</h3>
    <ul>
    <li>the same directory setup as outlined in step 1</li>
    <li>the programs <code>fasterq</code>, <code>NCBI datasets</code>, and <code>fastp</code> installed + added to your path. Also ensure that you have a conda environment <code>bbmap-env></code>, which contains packages for <code>bbmap</code> and <code>samtools</code>. (This will be challenging if you are not on the W&M HPC!)</li>
    </ul>
  <h3>3. Either use the provided SRA metadata csv, or download your own following the instructions in step 2 above. Ensure it keeps the same filename.</h3>
  <h3>4. From the root directory, run <code>assignment_07_pipeline.slurm</code></h3>
  </details>

  ## Some reflections on this assignment...
  <details>
    <summary>Click to expand...</summary>

    
  This assignment was challenging, yet rewarding! The intensity was ramped up simply because we now have the ability (using SLURM) to utilize the HPC to its full capacity and run lengthy jos, when before we were treating it as more or less just a shared computer space for our class. This meant that, if you weren't careful and tested out your SLURM pipelines on smaller data beforehand, a job might go wrong after multiple hours of waiting. (And then take another few hours of waiting after fixing the error to see if the fix worked!)



  It was, however, a good and rigorous exercise to take our Supercomputing abilities to the next level, and built very nicely on the course content we had learned, both in regards to our tools for genomic analysis, including locally installed programs as well as making use of our conda environments. I learned to test everything, up to and including the slurm pipeline itself, on smaller amounts of data and gradually ramp up the amount of data used from there. I learned how to be more discerning with my memory requirements, and also how to be a good SLURM citizen and be realistic yet polite with the resources I request on the shared HPC.
  </details>
