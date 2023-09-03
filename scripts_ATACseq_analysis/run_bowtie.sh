#!/bin/bash 


#Build index for the assembly generated using SAMBA + TGSGapcloser tools. The index directory is /drives/raid/AboobakerLab/manuel/data_phaw_analysis/asm_gap_filling/TGS-GapCloser_anlysis/sambaAsm_analysis/asm_editedNames/bowtie_index/
#nohup /drives/raid/AboobakerLab/software/bowtie2/bowtie2-2.4.2-sra-linux-x86_64/bowtie2-build /drives/ssd1/manuel/phaw/2022_analysis/phaw_gapfilling/TGS-GapCloser_anlysis/results_sambaAsm/change_scafNames/phaw_sambaAsm.scaff_seqs_editedScafNames.fa phaw_sambaAsm &

Bowtie2Index=/drives/raid/AboobakerLab/manuel/data_phaw_analysis/asm_gap_filling/TGS-GapCloser_anlysis/sambaAsm_analysis/asm_editedNames/bowtie_index/phaw_sambaAsm

trimmed=/drives/raid/AboobakerLab/data/atac_seq_data/phaw/trimmed
out=/drives/raid/AboobakerLab/data/bams/phaw/bowtie/atac-seq_patelLab/bam_phaw5.1

#Run on first 30 samples 
paired_files=$(ls $trimmed | grep _1_val_1.fq.gz | head -2)

for i in $paired_files; do

	f=$(basename $i _1_val_1.fq.gz)
        echo "Running on library $f"
	#echo $trimmed/${f}_1_val_1.fq

	#Align (https://yiweiniu.github.io/blog/2019/03/ATAC-seq-data-analysis-from-FASTQ-to-peaks/)
	/drives/raid/AboobakerLab/software/bowtie2/bowtie2-2.4.2-sra-linux-x86_64/bowtie2 --local --very-sensitive-local -p 30 -x $Bowtie2Index -1 $trimmed/${f}_1_val_1.fq.gz -2 $trimmed/${f}_2_val_2.fq.gz -U $trimmed/${f}_1_unpaired_1.fq.gz,$trimmed/${f}_2_unpaired_2.fq.gz | samtools view -Sb -q 10 | samtools sort -T ${f}_sorted -o ${out}/${f}_q10.bam &> ${out}/${f}_alignment.log

	#Index sorted file
	#samtools index -@ 8 ${out}/${f}.sorted.bam

	#Filter by quality
	#samtools view -h -q 10 ${out}/${f}.sorted.bam >  ${out}/${f}_q10.sorted.bam

	#Remove sorted bam
	#rm ${out}/${f}.sorted.bam

	echo "Mapping done for $f"
	echo ""
done

#Run: nohup ./run_bowtie.sh >> mappingBowtie.out 2>&1 &
# nohup ./run_bowtie.sh >> mappingBowtie_add.out 2>&1 &
