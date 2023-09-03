#!/bin/bash 


#1. Run this first. Sort bam files before calling peaks
#for f in *.Genrich.bam; do filename="${f%%.*}"; samtools sort -n -o ${filename}.Genrich_sorted.bam $f --threads 8; done

#2. Call peaks
#/drives/raid/AboobakerLab/software/Genrich

genrichloc='/drives/raid/AboobakerLab/software/Genrich/Genrich'
genrich_files="/drives/raid/AboobakerLab/data/atac_seq_data/phaw/dedup_bams_phaw50"
genrich_files=$(find $genrich_files | grep "_A_bothruns.Genrich_sorted.bam$" | sort)

for file in $genrich_files; do
    i=$(basename $file _A_bothruns.Genrich_sorted.bam)
    other_rep=${file/_A_/_B_}
    atac_mode=$i.ATAC.q005.narrowPeak
    pq=$i.ATAC.q005.bedgraph
    pileup=$i.ATAC.q005.pileup.bedgraph
     
    echo "now performing Genrich ATAC-mode on $file and $other_rep, output to $atac_mode"
    $genrichloc -t $file,$other_rep -o $atac_mode -f $pq -k $pileup -rvq 0.05

done

# nohup ./genrichPeaks_july2023.sh >> genrich.out 2>&1 &

#3. The bash script below splits the bedgraph-like file into two files per stage, one for each replicate
#The script works. I did not run it since I did not need those files by that time.

#for f in S*.q005.pileup.bedgraph* ; do 
#    printf 'splitting '$f'\n' 

#    awk '/experimental file/{filename=NR"__'$f'"}; {print >filename}' $f
#done

#4. Change peak name to reflect developmental stage

for f in S*.ATAC.q005.narrowPeak* ; do 
    printf 'naming '$f'\n' 
    prefix=$(basename $f .ATAC.q005.narrowPeak)
    awk -F"\t" 'BEGIN {OFS = FS} {sub("peak","'$prefix'",$4)}1' $f > $prefix.ATAC.q005.named.narrowPeak
done

#Remove original narrowpeaks : rm S*.ATAC.q005.narrowPeak*

#5. Merge narrowpeaks 
#Concatenate all narrow files
#cat S*.ATAC.q005.named.narrowPeak* > Scat_bothruns_q10.Genrich_sorted.ATAC.q005.named.narrowPeak 
#Sort
#bedtools sort -i Scat_bothruns_q10.Genrich_sorted.ATAC.q005.named.narrowPeak > Scat_bothruns_q10.Genrich_sorted.ATAC.q005.sorted.narrowPeak
#Merge
#bedtools merge -c 4,4,5,7,9,9 -o count,collapse,mean,mean,min,max -i Scat_bothruns_q10.Genrich_sorted.ATAC.q005.sorted.narrowPeak > #Sall_bothruns_q10.Genrich_sorted.ATAC.q005.merged.narrowPeak 

#This generated 190,453 peaks, while 190,078  were reported in the paper.
########################
