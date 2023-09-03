#!/bin/bash 

#Script to run busco analysis on phaw genome assembly

#Run busco on Phaw 5.0

if [ "$1" == "ref_assembly" ]; then

busco -i /drives/raid/AboobakerLab/manuel/data_phaw_analysis/phaw_reference/parhyale_hawaiensis_15Feb20182_1IWOV.fa -l arthropoda_odb10 --mode genome --cpu 16 -f --augustus -o ./busco_results_phaw5.0 

fi

#Run busco on Phaw 5.1
if [ "$1" == "gappfilled_assembly" ]; then

busco -i /drives/ssd1/manuel/phaw/2022_analysis/phaw_gapfilling/TGS-GapCloser_anlysis/results_sambaAsm/change_scafNames/phaw_sambaAsm.scaff_seqs_editedScafNames.fa -l arthropoda_odb10 --mode genome --cpu 16 -f --augustus -o ./busco_results_phaw5.1

fi
