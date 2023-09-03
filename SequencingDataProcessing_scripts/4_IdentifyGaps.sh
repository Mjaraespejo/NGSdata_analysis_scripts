#Commands used to identify gaps in Phaw5.0 and Phaw5.1 assemblies
##Command source: scaffoldgap2bed.py {genome} (https://github.com/lexnederbragt/sequencetools)

##Run command on Phaw5.0
nohup python3 /PATH/scaffoldgap2bed.py -i /drives/raid/AboobakerLab/manuel/data_phaw_analysis/phaw_reference/parhyale_hawaiensis_15Feb20182_1IWOV.fa -m 10 > parhyale_hawaiensis_15Feb20182_1IWOV.fa.bed &

##Run command on Phaw5.1
nohup python3 /PATH/scaffoldgap2bed.py -i /drives/ssd1/manuel/phaw/2022_analysis/phaw_gapfilling/TGS-GapCloser_anlysis/results_sambaAsm/change_scafNames/phaw_sambaAsm.scaff_seqs_editedScafNames.fa -m 10 > phaw_sambaAsm.scaff_seqs_editedScafNames.bed &

