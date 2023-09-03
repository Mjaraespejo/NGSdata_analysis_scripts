#!/bin/bash

#Script used to run TE expression quantification using SalmonTE tool.

if [ "$1" == "embryo_polya_Libs" ]; then  #Count TE in all embryo POLYA RNA-seq samples generated

s1s9_libs=/drives/raid/AboobakerLab/data/rna_data/paired/embryo_s1s9/trim/ #(stages 0-9hs,11hs,24-60hs)
p16p48_libs=/drives/raid/AboobakerLab/data/sra_rna_data/paired/phaw/rna-seq_polya_nov21/trim/ #(stages 16,20,24 and 48 hs)
p12p14_libs=/drives/raid/AboobakerLab/data/rna_data/paired/polya_082022/trim/ #(stages 12 and 13_14 hs)

#Use realpath command to get file full path
paired_files_1=$(realpath $s1s9_libs/*.fq $p16p48_libs/*.fq  $p12p14_libs/*.fq | grep "1_out_paired.fq" | grep "[PS]" | tr '\n' ' ') 
paired_files_2=$(realpath $s1s9_libs/*.fq $p16p48_libs/*.fq  $p12p14_libs/*.fq | grep "2_out_paired.fq" | grep "[PS]" | tr '\n' ' ')  

echo ${paired_files_1}
echo ${paired_files_2}

python /drives/raid/AboobakerLab/software/SalmonTE/SalmonTE.py quant --reference=phawTE-Instances_index \
--outpath=salmonQuant/embryo_polyaRNA \
--num_threads=16 \
--exprtype=count ${paired_files_1} ${paired_files_2}

fi


if [ "$1" == "embryo_total_Libs" ]; then  #Count TE in all embryo TOTAL RNA-seq samples generated

s1s9_libs=/drives/raid/AboobakerLab/data/rna_data/paired/embryo_totalRNA/trim/ #(stages 0-9hs,11hs,24-60hs)
p16p48_libs=/drives/raid/AboobakerLab/data/sra_rna_data/paired/phaw/rna-seq_total_nov21/trim/ #(stages 16,20,24 and 48 hs)
p12p14_libs=/drives/raid/AboobakerLab/data/rna_data/paired/total_082022/trim/ #(stages 12 and 13_14 hs)

#Use realpath command to get file full path
paired_files_1=$(realpath $s1s9_libs/*.fq $p16p48_libs/*.fq  $p12p14_libs/*.fq | grep "1_out_paired.fq" | grep "[T]" | tr '\n' ' ') 
paired_files_2=$(realpath $s1s9_libs/*.fq $p16p48_libs/*.fq  $p12p14_libs/*.fq | grep "2_out_paired.fq" | grep "[T]" | tr '\n' ' ')  

echo ${paired_files_1}
echo ${paired_files_2}

python /drives/raid/AboobakerLab/software/SalmonTE/SalmonTE.py quant --reference=phawTE-Instances_index \
--outpath=salmonQuant/embryo_totalRNA \
--num_threads=16 \
--exprtype=count ${paired_files_1} ${paired_files_2}

fi