#!/bin/bash 
#Map reference transcriptome to current genome assmebly. Output gtf file

gmap -D /drives/raid/AboobakerLab/manuel/data_phaw_analysis/phaw_reference/gmap_index/phaw_sambaTGSAsm \
-d phaw_sambaTGSAsm -f 2 /drives/ssd1/manuel/phaw/2021_analysis/annotation/gmap/phaw.3.0.genes.nuc.fa -t 30 > phaw.3.0.genes.nuc.fa.gmap.gff
