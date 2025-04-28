# Quality Control of 50K genotypes
PLINK: Whole genome data analysis toolset (https://zzz.bwh.harvard.edu/plink/)
Supports .ped/.map and binary .fam/.bed/.bim format files

```bash
#Load the software
module load plink/v1.9

#Perform Quality Control
plink --bfile boutsko3 --allow-extra-chr --chr-set 26 no-xy --geno 0.02 --maf 0.02 --make-bed --mind 0.05 --out boutsko4

# Exclude remaining unmapped SNP markers 
plink --bfile boutsko4 --allow-extra-chr --chr-set 26 no-xy --exclude snps_bou_remove.txt --make-bed boutsko_qc_final

# Sort individuals
plink --bfile boutsko_qc_final --chr-set 26 no-xy --indiv-sort f sort.txt --make-bed --out boutsko_qc_final_sorted

# Exclude few indviduals with no available phenotypic information 
--bfile boutsko_qc_final_sorted --chr-set 26 no-xy --remove boutsko_no-pheno.txt --make-bed --out boutsko_qc_final_sorted_only-pheno
