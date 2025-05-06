### Plot gwas results loading first the "Manhattan_plot.R" script and then run the following commands ###

# Read the gwas processed result file for altitude difference
data<-read.table("GWAS_results-alt_diff_final.txt",header=T)   

# Create genome-wide Manhattan plot using Bonferroni correction method with a threshold of 0.05 (5% chance of false positive association)
# Bonferroni method is a multiple correction approach, adjusting significance across all SNPs tested using the raw p-values
manhattan(data,limitchromosome=1:26,pch=20, genomewideline=-log10(0.05/length(data$SNP)), suggestiveline=-log10(0.1/length(data$SNP)),cex.axis=0.7)     

# Check the significant SNP markers
sorted_data <- data[order(data$P), ]
top_4_markers <- sorted_data[1:4, ]
print(top_4_markers)

# Create qqplot to check for potential inflation/deflation of the estimated p-values - hidden population structure or other confounding factors not included in the model
qq(data$P)

# Count the number SNPs in each chromosome 
chromosome_counts <- table(data$CHR) 

#check the number of markers on specific chromosome of interest
chromosome_counts["3"]

# Create chromosome-level Manhattan plots using bonferroni correction threshold of 0.05
manhattan(data,limitchromosome=3,pch=20, genomewideline=-log10(0.05/4424), suggestiveline=-log10(1/4424),cex.axis=0.7)
manhattan(data,limitchromosome=7,pch=20, genomewideline=-log10(0.05/2026), suggestiveline=-log10(1/2026),cex.axis=0.7)
manhattan(data,limitchromosome=15,pch=20, genomewideline=-log10(0.05/1498), suggestiveline=-log10(1/1498),cex.axis=0.7)
