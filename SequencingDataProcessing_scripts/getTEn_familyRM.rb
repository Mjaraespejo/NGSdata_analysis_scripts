count= 1
File.open("/drives/raid/AboobakerLab/manuel/data_phaw_analysis/repeats_gapFilledAsm/phaw_sambaAsm.scaff_seqs_editedScafNames.fa.out.gff","r").each do |line|
    if line[0] != "#"
        te_id = "TE_#{count}" #Simple TE id, used later to merge
        target_id = line.chomp.split("\t")[8] #Broad familiy  ID assigned during annotation.
        
#Since I used SalmonTE to quantify expression, I changed the ID identifier to the oned generated by the tool: scaff+start+end (range=Scaffold_100000_HRSCAF_104010:1-158)
        te_id = line.chomp.split("\t")[0] + ":" + (line.chomp.split("\t")[3].to_i - 1).to_s + ":" + line.chomp.split("\t")[4]
        puts target_id.split("\"")[1].gsub("Motif:","") + "\t" + te_id
        
        count +=1
    end
end