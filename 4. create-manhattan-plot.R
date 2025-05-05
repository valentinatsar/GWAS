### Plot gwas results loading first the "Manhattan_plot.R" script and then run the following commands ###

# Read the gwas processed result file for altitude difference
data<-read.table("GWAS_results-altitude_difference.txt",header=T)   

# Create genome-wide Manhattan plot using bonferroni correction threshold of 0.05
manhattan(data,limitchromosome=1:26,pch=20, genomewideline=-log10(0.05/length(data$SNP)), suggestiveline=-log10(0.1/length(data$SNP)),cex.axis=0.7)     

# Create qqplot to check for potential inflation/deflation of the estimated p-values 
qq(data$P)


# Create chromosome-level Manhattan plots using bonferroni correction threshold of 0.05
manhattan(data,limitchromosome=7,pch=20, genomewideline=-log10(0.05/14182), suggestiveline=F,cex.axis=0.7)
manhattan(data,limitchromosome=11,pch=20, genomewideline=-log10(0.05/1498), suggestiveline=-log10(1/1498),cex.axis=0.7)
manhattan(data,limitchromosome=15,pch=20, genomewideline=-log10(0.05/1498), suggestiveline=-log10(1/1498),cex.axis=0.7)
