#Script to extract TF-domain having genes based on pfam search output

tfs_pfam_ids = {"PF00096" => "Zinc finger, C2H2 type", "PF00046" => "Homeodomain", "PF00010" => "Helix-loop-helix DNA-binding", "PF00105" => "Zinc finger, C4 type (two domains)", "PF05225" => "helix-turn-helix, Psq domain", "PF00250" => "Forkhead domain", "PF00178" => "Ets-domain", "PF00320" => "GATA zinc finger", "PF00751" => "DM DNA binding domain", "PF02944" => "BESS motif", "PF07716" => "Basic region leucine zipper", "PF00292" => "Paired box domain", "PF00313" => "'Cold-shock' DNA-binding domain", "PF00907" => "T-box", "PF06839" => "GRF zinc finger", "PF02892" => "BED zinc finger", "PF02135" => "TAZ zinc finger", "PF00554" => "Rel homology DNA-binding domain", "PF00157" => "Pou domain - N-terminal to homeobox", "PF02257" => "RFX DNA-binding domain", "PF01754" => "A20-like zinc finger", "PF02791" => "DDT domain", "PF01530" => "Zinc finger, C2HC type", "PF00853" => "Runt domain", "PF02319" => "E2F/DP family winged-helix DNA-binding", "PF03131" => "bZIP Maf transcription factor", "PF04516" => "CP2 transcription factor", "PF02891" => "MIZ/SP-RING zinc finger", "PF02376" => "CUT domain", "PF00170" => "bZIP transcription factor", "PF00870" => "P53 DNA-binding domain", "PF00319" => "SRF-type transcription factor", "PF03859" => "CG-1", "PF03615" => "GCM motif", "PF05764" => "YL1 nuclear protein", "PF04054" => "CCR4-Not complex component, Not1", "PF05044" => "Homeo-prospero domain", "PF02928" => "C5HC2 zinc finger", "PF01285" => "TEA/ATTS domain", "PF05224" => "NDT80 / PhoG like DNA-binding  family", "PF02864" => "STAT protein, DNA binding domain", "PF03299" => "Transcription factor AP-2", "PF03343" => "SART-1 family", "PF02045" => "CCAAT-binding TF (CBF-B/NF-YA)", "PF01381" => "Helix-turn-helix", "PF06320" => "GCN5-like protein 1", "PF00447" => "HSF-type DNA-binding", "PF01422" => "NF-X1 type zinc finger", "PF02178" => "AT hook motif", "PF00847" => "AP2/ERF domain", "PF01388" => "ARID/BRIGHT DNA binding domain", "PF02362" => "B3 DNA binding domain", "PF00097" => "Zinc finger, C3HC4 type (RING finger)", "PF02008" => "CXXC zinc finger domain", "PF07967" => "C3HC zinc finger-like", "PF05485" => "THAP domain", "PF07500" => "Transcription factor S-II (TFIIS), central domain", "PF16159" => "FOXP coiled-coil domain", "PF00505" => "HMG (high mobility group) box", "PF09011" => "HMG-box domain", "PF02536" => "mTERF", "PF00249" => "Myb-like DNA-binding domain", "PF12776" => "Myb/SANT-like DNA-binding domain", "PF00104" => "Ligand-binding domain of nuclear hormone receptor", "PF01342" => "SAND domain", "PF02437" => "SKI/SNO/DAC family", "PF03166" => "MH2 (MAD homology 2) domain", "PF04434" => "SWIM zinc finger", "PF00352" => "TATA-binding protein (TBP)" }

genes=[]
pfam=[]
pfam_description=[]

tf_genes=[]
tf_pfam=[]
tf_genes_by_family = {}

hash={}
File.open("peps_filt.tsv","r").each do |line|	
	
	gene_id = line.split("\t")[0].split(".")[0..1].join(".")
	pfam_id=  line.split("\t")[4]
	description =  line.split("\t")[5]
	
	genes.push gene_id
	pfam << pfam_id
	pfam_description << description
	
    #Store all Parhyale genes having Pfam domains
	if hash[description] == nil
		hash[description] = line.split("\t")[0].split(".")[0..1].join(".")
	else 
		hash[description] <<  "," + line.split("\t")[0].split(".")[0..1].join(".")
	end
	
    #Store only Parhyale genes having transcription factors Pfam domains
    if tfs_pfam_ids.keys.include?(pfam_id)
        tf_genes << gene_id
        tf_pfam << pfam_id
        
        if tf_genes_by_family[pfam_id] == nil
            tf_genes_by_family[pfam_id] = line.split("\t")[0].split(".")[0..1].join(".")
        else 
            tf_genes_by_family[pfam_id] <<  "," + line.split("\t")[0].split(".")[0..1].join(".")
        end
    end
end

#puts "Genes having domains: " + genes.uniq.size.to_s
#puts "Pfam families identified: " + pfam.uniq.size.to_s
#puts "Pfam families descritpions: " + pfam_description.uniq.size.to_s

puts "Genes having TF domains: " + tf_genes.uniq.size.to_s
puts "TF Pfam families indentified: " + tf_pfam.uniq.size.to_s

tf_genes_by_family.each do |key,value|
    puts  tfs_pfam_ids[key] + "\t" + value #TF family and genes within each one
    puts  tfs_pfam_ids[key] + "\t" + value.split(",").uniq.size.to_s #Number of TFs per family
end
