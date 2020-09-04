


vcftools --vcf EUSTreseq.pseudochrom.allconf.flagged.vcf --max-missing 0.8 --mac 4 --min-meanDP 2 --max-meanDP 50 --recode --remove-filtered-all --out EUSTreseq.pseudochrom.allconf.filtered.vcf &> vcftools-filter.log &

--mac 4 #minor allele count > 4
--min-meanDP 2 # probably already caught in GATK, but we don't wanna mess things up here
--max-meanDP 50 #Avoid repetitive areas
--max-missing-count 4 #about 20% missing data
--max-missing 0.8 # 80% missing data, might duplicate --mac above but... can't be too safe here!
--remove-filtered-all # reads and discards flagged sites from GATK VariantFiltration

# After filtering, 12098699 of 27546565 Sites
# CHECK YOUR FILE SIZE! 26G originally, 8.8G now

### rename chromosome labels so that they're intelligible
bash sedPseudRename.sh &> rename.log &
## script as follows: sed -i 's/Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF/1/g' EUSTreseq.pseudochrom.allconf.filtered.vcf

# basic pop gen
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --freq --out EUSTreseq.pseudochrom.allconf.filtered &> freq.log &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --relatedness --out EUSTreseq.pseudochrom.allconf.filtered &> rel.log &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --het --out EUSTreseq.pseudochrom.allconf.filtered &> het.log &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --depth -c > EUSTreseq_depthsummary.txt &

# fst in vcftools
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --fst-window-size 50000 --weir-fst-pop us.txt --weir-fst-pop uk.txt --out EUSTreseq_pseud_nostep_UKUS_50kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --fst-window-size 50000 --weir-fst-pop au.txt --weir-fst-pop uk.txt --out EUSTreseq_pseud_nostep_AUUK_50kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --fst-window-size 50000 --weir-fst-pop au.txt --weir-fst-pop us.txt --out EUSTreseq_pseud_nostep_AUUS_50kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --fst-window-size 10000 --fst-window-step 10000 --weir-fst-pop us.txt --weir-fst-pop uk.txt --out EUSTreseq_pseud_UKUS_10kb &> UKUS.fst.10kb.pseud.log &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --fst-window-size 10000 --fst-window-step 10000 --weir-fst-pop au.txt --weir-fst-pop uk.txt --out EUSTreseq_pseud_AUUK_10kb &> AUUK.fst.10kb.pseud.log &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --fst-window-size 10000 --fst-window-step 10000 --weir-fst-pop au.txt --weir-fst-pop us.txt --out EUSTreseq_pseud_AUUS_10kb &> AUUS.fst.10kb.pseud.log &

# vcftools method of pi by population
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv au1_sort --indv au2_sort --indv au3_sort --indv au4_sort --indv au5_sort --indv au6_sort --indv au7_sort --indv au8_sort --window-pi 50000 --out EUSTreseq_pseudochrom_AU_pi_50kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv us1_sort --indv us2_sort --indv us3_sort --indv us4_sort --indv us5_sort --indv us6_sort --indv us7_sort --indv us8_sort --window-pi 50000 --out EUSTreseq_pseudochrom_US_pi_50kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv uk1_sort --indv uk2_sort --indv uk3_sort --indv uk4_sort --indv uk5_sort --indv uk6_sort --indv uk7_sort --indv uk8_sort --window-pi 50000 --out EUSTreseq_pseudochrom_UK_pi_50kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv au1_sort --indv au2_sort --indv au3_sort --indv au4_sort --indv au5_sort --indv au6_sort --indv au7_sort --indv au8_sort --window-pi 10000 --out EUSTreseq_pseudochrom_AU_pi_10kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv us1_sort --indv us2_sort --indv us3_sort --indv us4_sort --indv us5_sort --indv us6_sort --indv us7_sort --indv us8_sort --window-pi 10000 --out EUSTreseq_pseudochrom_US_pi_10kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv uk1_sort --indv uk2_sort --indv uk3_sort --indv uk4_sort --indv uk5_sort --indv uk6_sort --indv uk7_sort --indv uk8_sort --window-pi 10000 --out EUSTreseq_pseudochrom_UK_pi_10kb &

# Tajima's D by population
# only uses biallelic sites, but keeping all so that windows are comparable
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv au1_sort --indv au2_sort --indv au3_sort --indv au4_sort --indv au5_sort --indv au6_sort --indv au7_sort --indv au8_sort --TajimaD 50000 --out EUSTreseq_pseudochrom_AU_TajimaD_50kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv us1_sort --indv us2_sort --indv us3_sort --indv us4_sort --indv us5_sort --indv us6_sort --indv us7_sort --indv us8_sort --TajimaD 50000 --out EUSTreseq_pseudochrom_US_TajimaD_50kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv uk1_sort --indv uk2_sort --indv uk3_sort --indv uk4_sort --indv uk5_sort --indv uk6_sort --indv uk7_sort --indv uk8_sort --TajimaD 50000 --out EUSTreseq_pseudochrom_UK_TajimaD_50kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv au1_sort --indv au2_sort --indv au3_sort --indv au4_sort --indv au5_sort --indv au6_sort --indv au7_sort --indv au8_sort --TajimaD 10000 --out EUSTreseq_pseudochrom_AU_TajimaD_10kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv us1_sort --indv us2_sort --indv us3_sort --indv us4_sort --indv us5_sort --indv us6_sort --indv us7_sort --indv us8_sort --TajimaD 10000 --out EUSTreseq_pseudochrom_US_TajimaD_10kb &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --indv uk1_sort --indv uk2_sort --indv uk3_sort --indv uk4_sort --indv uk5_sort --indv uk6_sort --indv uk7_sort --indv uk8_sort --TajimaD 10000 --out EUSTreseq_pseudochrom_UK_TajimaD_10kb &


##################### POPULATION STRUCTURE PREP #####################

### bi-allelic SNPs only
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --min-alleles 2 --max-alleles 2 --recode --out EUSTreseq.pseudochrom.allconf.filtered.biall.vcf &> vcftools-biallelic.log &
### After filtering, kept 11913445 out of a possible 12098699 Sites
### 8.6G

### maf filter
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --maf 0.1 --recode --out EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.vcf &> vcftools-maf01.log &
### After filtering, kept 10388332 out of a possible 11913445 Sites
### 7.5G

### pruning for LD
# convert VCF to BCF, while filtering out all variants except biallelic SNPs
bcftools view EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.vcf -m2 -M2 -v snps -Ou -o EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.bcf &
# prune every 1 kb
bcftools +prune -l 0.6 -w 1000 EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.bcf -Ob -o EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bcf &
bcftools view EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bcf -Ou -o EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.vcf &


### stopped here on 9/4/20 3:30 PM
### Error: Unrecognized type in .bcf file.

### admixture
/programs/plink-1.9-x86_64-beta5/plink --bcf EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bcf --out EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb --recode --allow-extra-chr &
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb --make-bed --allow-extra-chr --out EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb &

/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 1 -B -j4 &> admix.k1.prune1kb.log &
/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 2 -B -j4 &> admix.k2.prune1kb.log &
/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 3 -B -j4 &> admix.k3.prune1kb.log &
/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 4 -B -j4 &> admix.k4.prune1kb.log &
/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 5 -B -j4 &> admix.k5.prune1kb.log &

# cross-validation of appropriate K values
for K in 1 2 3 4 5; \
do /programs/admixture/admixture --cv EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed $K | tee log${K}.out; done
grep -h CV log*.out
