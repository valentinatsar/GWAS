# Genome-Wide Association Analysis
GEMMA software - Genome-wide Efficient Mixed Model Association (https://www.xzlab.org/software/GEMMAmanual.pdf)

```bash
# 1. Construct the Genomic Relatedness Matrix (GRM) - each entry represents the genetic relatedness or similarity between two individuals
gemma -bfile boutsko_qc_final_sorted_only-pheno -maf 0.0001 -miss 0.2 -gk 1 -o Rmatrix   # -maf and -miss are used to avoid the default quality control of GEMMA, -gk defines the type of matrix (1:centered)

# 2. Decompose the Genomic Relatedness Matrix (GRM) - Simplified into two components: eigenvectors (U) and eigenvalues (D)
gemma -bfile boutsko_qc_final_sorted_only-pheno -maf 0.0001 -miss 0.2 -k Rmatrix.cXX.txt -eigen -o Decomposition

# 3. Run the GWAS for phenotype "daily grazing activity"
gemma -bfile boutsko_qc_final_sorted_only-pheno -n 1 -c covar-daily-activity.txt -maf 0.0001 -miss 0.21 -k Rmatrix.cXX.txt -lmm 4 -o GWAS_daily_activity  # -lmm stands for linear mixed model and "4" option regards three 
                                                                                                                                                          # different statistical approaches to estimate p-values for each SNP 


# 4. Run the GWAS for phenotype "altitude difference"
gemma -bfile boutsko_qc_final_sorted_only-pheno -n 4 -c covar-altitude_diff.txt -maf 0.0001 -miss 0.21 -k Rmatrix.cXX.txt -lmm 4 -o GWAS_altitude_differ


# 5. Visualize the results using Manhattan plot script
