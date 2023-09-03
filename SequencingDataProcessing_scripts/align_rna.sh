#!/bin/bash 
if [ "$1" == "totalRNA_embryos" ]; then

    in=/drives/raid/AboobakerLab/data/rna_data/paired/total_082022/X204SC22071455-Z01-F001/ #raw .fastq data
    out=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_total_082022 #Final bam files for each libtrary
    fastq=/drives/raid/AboobakerLab/data/rna_data/paired/total_082022/trim #trimmed data after Trimmomatic
    adapters=/drives/raid/AboobakerLab/software/Trimmomatic-0.39/adapters/TruSeq2-PE.fa 
    
    paired_files_1=$(ls -R $in | grep 1.fq.gz)
        
    for i in $paired_files_1; do
        f=$(basename $i _1.fq.gz)
        echo "Running on library $f"

    java -jar /drives/raid/AboobakerLab/software/Trimmomatic-0.39/trimmomatic-0.39.jar PE ${in}/01.RawData/${f}/${f}_1.fq.gz ${in}/01.RawData/${f}/${f}_2.fq.gz ${fastq}/${f}_1_out_paired.fq ${fastq}/${f}_1_out_unpaired.fq ${fastq}/${f}_2_out_paired.fq ${fastq}/${f}_2_out_unpaired.fq -threads 16 ILLUMINACLIP:${adapters}:2:30:10 SLIDINGWINDOW:4:20 LEADING:10 TRAILING:10 MINLEN:36

    #/drives/raid/AboobakerLab/software/hisat2/hisat2 --dta -x $asm -1 ${fastq}/${f}_1_out_paired.fq -2 ${fastq}/${f}_2_out_paired.fq -p 30 | samtools view -Sb | samtools sort -o ${out}/${f}.bam &> ${out}/${f}_alignment.log
        done
fi

#I added new blocks to this script to run reads cleaning and mapping for each dataset generated
#A similar script was used to map reads to Phaw5.0 assembly.
#Mapping stats were later used to compare mapping rates.