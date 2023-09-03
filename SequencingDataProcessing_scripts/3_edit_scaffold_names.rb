# After running Samba and TGSGpaCloser, the output: /drives/raid/AboobakerLab/manuel/data_phaw_analysis/asm_gap_filling/TGS-GapCloser_anlysis/sambaAsm_analysis/phaw_sambaAsm.scaff_seqs contained special characters.
# I used this ruby script to edit those names and generate the final assembly ouput Phaw5.1

##Before running the code below, convert gap-filled genome fasta file into tab-delimited file using: /drives/ssd1/manuel/FastaToTbl.sh phaw_sambaAsm.scaff_seqs > phaw_sambaAsm.scaff_seqs.tbl

count=1

File.open("phaw_sambaAsm.scaff_seqs.tbl","r").each do |line|
    if line.split("\t")[0].include?(":") 
        #puts #line.split("\t")[0] + "\t" "Scaffold_N" + count.to_s
        puts "Scaffold_N" + count.to_s  + "\t" + line.chomp.split("\t")[1]
        count += 1
    else
        puts line#.split("\t")[0]
    end
end

#Output: /drives/ssd1/manuel/phaw/2022_analysis/phaw_gapfilling/TGS-GapCloser_anlysis/results_sambaAsm/change_scafNames/phaw_sambaAsm.scaff_seqs_editedScafNames.fa, which depicted Phaw5.1 assembly used in downstream analyses
