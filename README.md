# NGSdata_analysis_scripts

This repository contains *.bash* scripts used to run diverse processing on sequencing data, including quality check, triming, mapping. In addition, some scripts were used to structure, summarise and publish results.
The scripts are used to run daya to day bioinformatics tools like *samtools*, *bedtools merge*, *Trimmomatic*, redundancy reduction using *CD-HIT*, mapping using *HISAT2*, and also more specialised analysis like transposable elementes expression quantification using *SalmonTE*.
I developed the scripts using either *bash* or *ruby* languages. Downstream analyses, see other repositories like *Codes_TranscriptomicAnalysis*, where performed using *R* and *Python* languages.

In *scripts_ATACseq_analysis* are the files and scripts used to analyse public ATAC-seq. The steps include:
- Trimming reads using *TrimGalore*
- Mapping using *bowtie*
- Deduplication using *Picard*
- Peak calling using *Genrich*
- Merge library-specific narrowpeaks into a unified narrow peaks using *bedtools*
  
Please email *alexjapes@gmail.com* if there is any problem, thanks! (Manuel)

[This](https://htmlpreview.github.io/) is a tool to view the html files. 
