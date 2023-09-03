#!/bin/bash 

bamFiles=/drives/raid/AboobakerLab/data/bams/phaw/bowtie/atac-seq_patelLab/bam_phaw5.0
bamFiles=$(find $bamFiles | grep "_q10.bam$")
picardloc=/drives/raid/AboobakerLab/software/picard/picard/build/libs/picard.jar
for i in $bamFiles; do
	f=$(basename $i _q10.bam)
        dedupname=$f.dedup.bam
	picardstats=$f.txt

	echo "Running on library $f"
		java -jar $picardloc MarkDuplicates REMOVE_DUPLICATES=TRUE CREATE_INDEX=true I=$i O=$dedupname M=$picardstats

	echo "Deduplication done for $f"
	echo ""
done

#Run: nohup ./picard_dedup.sh >> deduplication.out 2>&1 &
