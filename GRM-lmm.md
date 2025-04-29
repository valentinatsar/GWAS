# Genome-Wide Association Analysis
GEMMA software - Genome-wide Efficient Mixed Model Association (https://www.xzlab.org/software/GEMMAmanual.pdf)

```bash
# 1. Construct the Genomic Relatedness Matrix (GRM) - each entry represents the genetic relatedness or similarity between two individuals
gemma -bfile boutsko_qc_final_sorted_only-pheno -maf 0.0001 -miss 0.2 -gk 1 -o Rmatrix   # -maf and -miss are used to avoid the default quality control of GEMMA, -gk defines the type of matrix (1:centered)

# 2. (Optional during the course) Decompose the Genomic Relatedness Matrix (GRM) - Simplified into two components: eigenvectors (U) and eigenvalues (D)
gemma -bfile boutsko_qc_final_sorted_only-pheno -maf 0.0001 -miss 0.2 -k Rmatrix.cXX.txt -eigen -o Decomposition

# 3. Run the GWAS for phenotype "daily grazing activity"
gemma -bfile boutsko_qc_final_sorted_only-pheno -n 1 -c covar-daily-activity.txt -maf 0.0001 -miss 0.21 -k Rmatrix.cXX.txt -lmm 4 -o GWAS_daily_activity  # -lmm stands for linear mixed model and "4" option regards three 
                                                                                                                                                          # different statistical approaches to estimate p-values for each SNP 

# 4. Run the GWAS for phenotype "altitude difference"
gemma -bfile boutsko_qc_final_sorted_only-pheno -n 4 -c covar-altitude_diff.txt -maf 0.0001 -miss 0.21 -k Rmatrix.cXX.txt -lmm 4 -o GWAS_altitude_differ

# The results file, called "GWAS_tMilk.assoc.txt", includes one row for each SNP (all SNPs will be ordered by chromosome and base pair position) and the following columns:
	- chr: Chromosome of the current SNP
	- rs: Name of the SNP
	- ps: Position of the SNP in base pairs
	- n_miss: Number of missing genotypes for these SNP (how many animals failed in genotyping for this SNP locus)
	- allele1: Allele 1 of the SNP (minor allele)
	- allele0: Allele 2 of the SNP (major allele)
	- af: Minor allele frequency
	- beta: Beta coefficient (SNP effect)
	- se: Standard error of the beta coefficient
	- l_remle: remle estimates for lambda
	- l_mle: mle estimates for lambda
	- p_wald: P-value of the Wald test
	- p_lrt: P-value of the lrt test
	- p_score: P-value of the score test

# 5. Create a new processed file with the columns chr, rs, ps and p_wald in this order: rs, chr, ps and p_wald and rename as SNP, CHR, BP and P
awk '{print $2,$1,$3,$13}' myfile.txt > output.txt
sed -e '1s/rs/SNP/' -e '1s/chr/CHR/' -e '1s/ps/BP/' -e '1s/p_wald/P/' myfile.txt > output.txt

# 6. Visualize the results using the processed file and the Manhattan R scripts 
