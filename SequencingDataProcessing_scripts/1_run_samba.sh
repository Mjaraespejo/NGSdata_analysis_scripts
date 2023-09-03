#!/bin/bash 

#Script used to Samba on Phaw5.0 (reference) assembly

/drives/raid/AboobakerLab/software/MaSuRCA-4.0.9/bin/samba.sh -r /drives/raid/AboobakerLab/data/genomes/phaw/parhyale_hawaiensis_15Feb20182_1IWOV.fa \
-q /drives/raid/AboobakerLab/manuel/data_phaw_analysis/asm_gap_filling/TGS-GapCloser_anlysis/m64164_211030_095407.hifi.subreads.fa \
-t 30 -d asm -m 5000 -o 1000 -a 

#Output assembly: parhyale_hawaiensis_15Feb20182_1IWOV.fa.scaffolds.fa