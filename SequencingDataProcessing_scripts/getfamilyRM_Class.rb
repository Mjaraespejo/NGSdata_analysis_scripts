count= 1
File.open("/drives/raid/AboobakerLab/manuel/data_phaw_analysis/repeats_gapFilledAsm/phaw_sambaAsm.DB-families.fa","r").each do |line|
    
    #In total 3532 TE families were reported during TE annotation 
    #Use only file fasta header to get info. 
    #>rnd-1_family-321#LINE/L2 ( RepeatScout Family Size = 297, Final Multiple Alignment Size = 100, Localized to 3474 out of 4163 contigs )
    if line[0] == ">"
        puts line.split[0].split("#")[0][1..-1] + "\t" + line.split[0].split("#")[1]
    end
end