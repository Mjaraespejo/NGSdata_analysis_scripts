#!/bin/bash 
intron_regions=/drives/ssd1/manuel/phaw/2022_analysis/mzt_analysis/bin_coverage_analysis/abnormalIntronWindows.bed

# 0-9.15hs, 11-12cells and 24-60hs samples
if [ "$1" == "embryo_polyA" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_05_2022/Aboobaker_embryo_data/polyA 
    out_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_maskedbyIntron/AAA_embryo_data/polyA
    bam_files=$(ls $in_bams | grep "S[1-9].bam$")
        for i in $bam_files; do
            f=$(basename $i .bam)
    /drives/raid/AboobakerLab/software/bedtools2/bin/bedtools intersect -abam ${in_bams}/$i -b $intron_regions -v -s > $out_bams/${f}_masked.bam
        done
fi

# 0-9.15 hs, 11,16, 20, 24 ,48 and 24-60hs samples
if [ "$1" == "embryo_totalRNA" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_05_2022/Aboobaker_embryo_data/total 
    out_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_maskedbyIntron/AAA_embryo_data/total
    bam_files=$(ls $in_bams | grep ".bam$")

        for i in $bam_files; do
            f=$(basename $i .bam)
            echo "Running on library $f"
            
		/drives/raid/AboobakerLab/software/bedtools2/bin/bedtools intersect -abam ${in_bams}/$i -b $intron_regions -v -s > $out_bams/${f}_masked.bam  
        done
fi

#16, 20, 24 and 48 hs samples - POLYA
if [ "$1" == "p16-to-p48" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_05_2022/Aboobaker_embryo_data/polyA 
    out_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_maskedbyIntron/AAA_embryo_data/polyA
    bam_files=$(ls $in_bams | grep 'P[0-9]\{3\}.bam')

        for i in $bam_files; do
            f=$(basename $i .bam)
            echo "Running on library $f"
    		/drives/raid/AboobakerLab/software/bedtools2/bin/bedtools intersect -abam ${in_bams}/$i -b $intron_regions -v -s > $out_bams/${f}_masked.bam
        done
fi

#12 and 14 hs samples - POLYA
if [ "$1" == "polya_082022" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_polya_082022 
    out_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_maskedbyIntron/AAA_embryo_data/polyA
    bam_files=$(ls $in_bams | grep 'P[0-9]\{3\}.bam$')
      
        for i in $bam_files; do
            f=$(basename $i .bam)
        /drives/raid/AboobakerLab/software/bedtools2/bin/bedtools intersect -abam ${in_bams}/$i -b $intron_regions -v -s > $out_bams/${f}_masked.bam
        done
fi

#12 and 14 hs samples - Total RNA
if [ "$1" == "total_082022" ]; then
    in_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_total_082022/ #RNA-seq generated until 2021
    out_bams=/drives/raid/AboobakerLab/data/bams/phaw/hisat/bams_maskedbyIntron/AAA_embryo_data/total
     bam_files=$(ls $in_bams | grep '.bam$')
      
        for i in $bam_files; do
            f=$(basename $i .bam)
            /drives/raid/AboobakerLab/software/bedtools2/bin/bedtools intersect -abam ${in_bams}/$i -b $intron_regions -v -s > $out_bams/${f}_masked.bam 
        done
fi
