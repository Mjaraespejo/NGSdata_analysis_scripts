#!/bin/bash 

#Commands used to obtain assembly statistics for Phaw5.0 and Phaw 5.1, including the intermediat assemblies generated

##Run on reference assembly Phaw 5.0
assembly-stats -t  /drives/raid/AboobakerLab/manuel/data_phaw_analysis/phaw_reference/parhyale_hawaiensis_15Feb20182_1IWOV.fa > parhyale_hawaiensis_15Feb20182_1IWOV.fa.fa_stats

#Run on assembly after filling Phaw5.0 using Samba
assembly-stats  -t /drives/ssd1/manuel/phaw/2022_analysis/asm_SAMBA_analysis/parhyale_hawaiensis_15Feb20182_1IWOV.fa.scaffolds.fa  > /drives/ssd1/manuel/phaw/2022_analysis/asm_SAMBA_analysis/parhyale_hawaiensis_15Feb20182_1IWOV.fa.scaffolds.fa

#Run on assembly after filling Phaw5.0 using TGS-Gap-Closer
assembly-stats  -t /drives/raid/AboobakerLab/manuel/data_phaw_analysis/asm_gap_filling/TGS-GapCloser_anlysis/wholeGenome_analysis/phaw_fullASm.scaff_seqs  > phaw_fullASm.scaff_seqs_stats

##Run on updated assembly (Phaw5.1) after filling Phaw5.0 using Samba + TGS-Gap-Closer
assembly-stats -t  /drives/raid/AboobakerLab/manuel/data_phaw_analysis/asm_gap_filling/TGS-GapCloser_anlysis/sambaAsm_analysis/phaw_sambaAsm.scaff_seqs > phaw_sambaAsm.scaff_seqs_stats
