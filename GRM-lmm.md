# Genome-Wide Association Analysis
GEMMA software - Genome-wide Efficient Mixed Model Association (https://www.xzlab.org/software/GEMMAmanual.pdf)

```bash
# Construct the Genomic Relatedness Matrix (GRM) 
gemma -bfile boutsko_qc_final_sorted_only-pheno -maf 0.0001 -miss 0.2 -gk 1 -o Rmatrix

# Decompose the Genomic Relatedness Matrix (GRM)
gemma -bfile boutsko_qc_final_sorted_only-pheno -maf 0.0001 -miss 0.2 -k Rmatrix.cXX.txt -eigen -o Decomposition

# Run the GWAS for phenotype "daily grazing activity"


# Run the GWAS for phenotype "altitude difference"
