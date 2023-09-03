#!/bin/bash

fastq=/drives/raid/AboobakerLab/data/atac_seq_data/phaw
trimmed=/drives/raid/AboobakerLab/data/atac_seq_data/phaw/trimmed  #trimmed files

paired_files=$(ls $fastq | grep _1.fastq.gz)

# This is an example loop

for i in ${paired_files}; do
	f=$(basename $i _1.fastq.gz )

echo "Running on library $f"

/drives/raid/AboobakerLab/software/TrimGalore-0.6.6/trim_galore \
  --paired \
  --nextera \
  --stringency 5 \
  --gzip \
  --retain_unpaired \
  --fastqc \
  --path_to_cutadapt /drives/ssd1/manuel/miniconda3/bin/cutadapt \
  --cores 4 \
  --output_dir ${trimmed} \
${fastq}/${f}_1.fastq.gz ${fastq}/${f}_2.fastq.gz

echo "Library $f trimmed"

done

#Run: nohup ./run_trim_galore.sh >> trimming.out 2>&1 &
