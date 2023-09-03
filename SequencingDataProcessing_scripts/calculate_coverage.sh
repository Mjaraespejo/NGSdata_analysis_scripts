#!/bin/bash 
#Script used to calculate intron coverage. I will use the number of base pairs without coverage to estimate the RIN score used in https://www.pnas.org/doi/10.1073/pnas.1321569111
introns_bed=/drives/ssd1/manuel/phaw/2022_analysis/mzt_analysis/bin_coverage_analysis/transcripts_MultiExon_intron.bed

# 0-9.15hs, 11hrs and 24-60hs - PolyA
if [ "$1" == "embryo_s1s9" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_05_2022/Aboobaker_embryo_data/polyA 
    bam_files=$(ls $in_bams | grep "S[1-9].bam$")
    
    for i in $bam_files; do
        f=$(basename $i .bam)
        #Calculate coverage
       /drives/raid/AboobakerLab/software/bedtools2/bin/bedtools  coverage -split -F 1 -s -a $introns_bed -b ${in_bams}/${f}.bam >  ./${f}_intronCoverage.txt
        done
fi

# 16, 20, 24 and 48 hs  - PolyA
if [ "$1" == "p16-to-p48" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_05_2022/Aboobaker_embryo_data/polyA 
    bam_files=$(ls $in_bams | grep 'P[0-9]\{3\}.bam')
    
    for i in $bam_files; do
        f=$(basename $i .bam)

       /drives/raid/AboobakerLab/software/bedtools2/bin/bedtools  coverage -split -F 1 -s -a $introns_bed -b ${in_bams}/${f}.bam >  ./${f}_intronCoverage.txt
        done
fi

#12 and 14 hs - PolyA
if [ "$1" == "polya_082022" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_polya_082022
    bam_files=$(ls $in_bams | grep 'P[0-9]\{3\}.bam$')
    
    for i in $bam_files; do
        f=$(basename $i .bam)
    /drives/raid/AboobakerLab/software/bedtools2/bin/bedtools  coverage -split -F 1 -s -a $introns_bed -b ${in_bams}/${f}.bam >  ./${f}_intronCoverage.txt
    done
fi

# 0-9.15hs, 11hrs and 24-60hs - TotaL RNA
if [ "$1" == "embryo_t1t9" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_05_2022/Aboobaker_embryo_data/total #RNA-seq generated until 2021. Runs 
    bam_files=$(ls $in_bams | grep "T[1-9].bam$")
    
    for i in $bam_files; do
        f=$(basename $i .bam)
        /drives/raid/AboobakerLab/software/bedtools2/bin/bedtools  coverage -split -F 1 -s -a $introns_bed -b ${in_bams}/${f}.bam >  ./${f}_intronCoverage.txt
        done
fi

# 16, 20, 24 and 48 hs  - Total
if [ "$1" == "t16-to-t48" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_05_2022/Aboobaker_embryo_data/total 
    bam_files=$(ls $in_bams | grep 'T[0-9]\{3\}.bam')
    for i in $bam_files; do
        f=$(basename $i .bam)
        drives/raid/AboobakerLab/software/bedtools2/bin/bedtools  coverage -split -F 1 -s -a $introns_bed -b ${in_bams}/${f}.bam >  ./${f}_intronCoverage.txt
        done
fi

#12 and 14 hs - Total
if [ "$1" == "total_082022" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_total_082022/ #RNA-seq generated in 2022. 12 and 13-14 hs
    bam_files=$(ls $in_bams | grep '.bam$')
    for i in $bam_files; do
        f=$(basename $i .bam)
        /drives/raid/AboobakerLab/software/bedtools2/bin/bedtools  coverage -split -F 1 -s -a $introns_bed -b ${in_bams}/${f}.bam >  ./${f}_intronCoverage.txt
        done
fi