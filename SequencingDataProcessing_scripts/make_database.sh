#!/bin/bash
proteomes=`ls *.fasta | sed 's/.fasta//g'`

for proteome in $genomes; do
	echo "(o) Creating ${proteome} database"
	/drives/raid/AboobakerLab/software/ncbi-blast-2.12.0+/bin/makeblastdb -in ${proteome}.fasta -out ${proteome} -dbtype prot -parse_seqids
	echo "(o) ${proteome} database done"
done
