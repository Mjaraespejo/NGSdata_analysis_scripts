#!/bin/bash

/drives/raid/AboobakerLab/software/TGS-GapCloser/TGS-GapCloser.sh \
--scaff  /drives/ssd1/manuel/phaw/2022_analysis/asm_SAMBA_analysis/parhyale_hawaiensis_15Feb20182_1IWOV.fa.scaffolds.fa \
--reads  /drives/raid/AboobakerLab/manuel/data_phaw_analysis/asm_gap_filling/TGS-GapCloser_anlysis/m64164_211030_095407.hifi.subreads.fa \
--output phaw_sambaAsm \
--minmap_arg '-x asm20' \
--ne \
--thread 20 \
--tgstype pb 

#Ouput assembly: phaw_sambaAsm.scaff_seqs
#The ouput file contained special characters in the scaffolds names, so I had to edit those.