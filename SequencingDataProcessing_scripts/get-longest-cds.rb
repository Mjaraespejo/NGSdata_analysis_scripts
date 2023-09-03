#Scrip to to select longest pepetide per gene after redundacy reduction wuth CD-HIT

hash1= {}

File.open("peptides.cdhit_0.99.fa.tbl","r").each do |line|
	
    gene_id= line.split(" ")[0].split(".")
	gene_id = gene_id[0..1].join(".")
		
	tx_id = line.split(" ")[0].split(".")
	tx_id=tx_id[0..2].join(".")
		
	pep_id = line.split(" ")[0].split("~")[0]
		
	len = line.split(" ")[4].split(":")[1]
		
	if hash1[gene_id] == nil
		hash1[gene_id] = [tx_id],[pep_id],[len.to_i]
	else
		hash1[gene_id][0] << tx_id
		hash1[gene_id][2] << len.to_i
		hash1[gene_id][1] << pep_id
	end
end

puts "gene_id\ttranscript_id\tlongest_pep\tpep_ln"
transcripts=[]
hash1.each do |key,value|
	gene=key
	#Find the index of the tx having the highest length
	index= value[2].each_with_index.max[1]
	#Select the longest tx based on index
	tx_id= value[0][index]
	#Print gene and longest tx
	puts gene  + "\t" + tx_id + "\t" + value[1][index].to_s + "\t" + value[2][index].to_s
end
