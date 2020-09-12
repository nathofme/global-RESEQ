


vcftools --vcf EUSTreseq.pseudochrom.allconf.flagged.vcf --max-missing 0.8 --min-meanDP 2 --max-meanDP 50 --recode --remove-filtered-all --out EUSTreseq.pseudochrom.allconf.filtered.vcf &> vcftools-filter.log &

--min-meanDP 2 # probably already caught in GATK, but we don't wanna mess things up here
--max-meanDP 50 #Avoid repetitive areas
--max-missing-count 4 #about 20% missing data
--max-missing 0.8 # 80% missing data, might duplicate --mac above but... can't be too safe here!
--remove-filtered-all # reads and discards flagged sites from GATK VariantFiltration

# After filtering, 23,435,321 of 27,546,565 Sites
# Removes 4,111,244 sites
# CHECK YOUR FILE SIZE! 26G originally, 17G now

### rename chromosome labels so that they're intelligible
bash sedPseudRename.sh &> rename.log &
## script as follows: sed -i 's/Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF/1/g' EUSTreseq.pseudochrom.allconf.filtered.vcf

# basic pop gen
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --freq --out EUSTreseq.pseudochrom.allconf.filtered &> freq.log &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --relatedness --out EUSTreseq.pseudochrom.allconf.filtered &> rel.log &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --het --out EUSTreseq.pseudochrom.allconf.filtered &> het.log &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --depth -c > EUSTreseq.pseudochrom.allconf.filtered.depthsummary.txt &
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --hardy --max-missing 1.0 --out EUSTreseq.pseudochrom.allconf.filtered &> hardy.log &

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

# scans using Simon Martin's scripts
gzip EUSTreseq.pseudochrom.allconf.filtered.vcf &
python parseVCF.2018.py -i EUSTreseq.pseudochrom.allconf.filtered.vcf.gz --skipIndels --minQual 30 --gtf flag=DP min=2 | gzip > EUSTreseq.pseudochrom.allconf.geno.gz &
# keep DP at 2 to match vcftools above
python popgenWindows.py --windType coordinate -w 50000 -g EUSTreseq.pseudochrom.allconf.geno.gz -o EUSTreseq.pseudochrom.window50kb.gz -f phased -T 5 -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &> popGenwindows50kb..log &
python popgenWindows.py --windType coordinate -w 50000 -g EUSTreseq.pseudochrom.allconf.geno.gz -o EUSTreseq.pseudochrom.window50kb.m10.gz -f phased -T 5 -m 10 -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &> popGenwindows50kb.m10.log &
python popgenWindows.py --windType coordinate -w 10000 -g EUSTreseq.pseudochrom.allconf.geno.gz -o EUSTreseq.pseudochrom.window10kb.gz -f phased -T 5 -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &> popGenwindows10kb.log &
python popgenWindows.py --windType coordinate -w 10000 -g EUSTreseq.pseudochrom.allconf.geno.gz -o EUSTreseq.pseudochrom.window10kb.m10.gz -f phased -m 10 -T 5 -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &> popGenwindows10kb.m10.log &

## error here:
# Traceback (most recent call last):
#   File "popgenWindows.py", line 253, in <module>
#     if not args.addWindowID: outFile.write("scaffold,start,end,mid,sites,")
#   File "/usr/lib64/python3.6/gzip.py", line 260, in write
#     data = memoryview(data)
# TypeError: memoryview: a bytes-like object is required, not 'str'


##################### POPULATION STRUCTURE PREP #####################

### remove invariant sites
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --non-ref-ac-any 1 --recode --out EUSTreseq.pseudochrom.allconf.filtered.variantonly.vcf &> vcftools-variantonly.log &
### After filtering, kept 23435321 out of a possible 23435321 Sites
### so filtering above had already removed invariant sites...?

### bi-allelic SNPs
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.vcf --min-alleles 2 --max-alleles 2 --recode --out EUSTreseq.pseudochrom.allconf.filtered.biall.vcf &> vcftools-biallelic.log &
### After filtering, kept 22648569 out of a possible 23435321 Sites
### 15G

### hwe filter
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --hwe 0.05 --recode --out EUSTreseq.pseudochrom.allconf.filtered.biall.hwe.vcf &> vcftools-hwefilter.log &
### After filtering, kept 22002700 out of a possible 22648569 Sites
### 14G

### minor allele count > 2
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --mac 2 --recode --out EUSTreseq.pseudochrom.allconf.filtered.biall.mac2.vcf &> vcftools-mac2.log &
### After filtering, kept 17038208 out of a possible 22648569 Sites
### 11G

### minor allele count > 4
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --mac 4 --recode --out EUSTreseq.pseudochrom.allconf.filtered.biall.mac4.vcf &> vcftools-mac4.log &
### After filtering, kept 11913445 out of a possible 22648569 Sites
### 7.9G

### pruning for LD
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.mac4.vcf --thin 1000 --recode --out EUSTreseq.pseudochrom.allconf.filtered.biall.mac4.prune1kb.vcf &> vcftools-mac4-prune1kb.log &
### After filtering, kept 833481 out of a possible 11913445 Sites
### 531 MB

vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.mac2.vcf --thin 1000 --recode --out EUSTreseq.pseudochrom.allconf.filtered.biall.mac2.prune1kb.vcf &> vcftools-mac2-prune1kb.log &
### After filtering, kept 872155 out of a possible 17038208 Sites
### 545 MB

# re-running pop gen calculations
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --freq --out EUSTreseq.pseudochrom.allconf.filtered.biall &> freq.log &



### admixture
/programs/plink-1.9-x86_64-beta5/plink --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.mac4.prune1kb.vcf --out EUSTreseq.pseudochrom.allconf.filtered.biall.mac4.prune1kb --recode --allow-extra-chr --chr-set 29 no-y &
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom.allconf.filtered.biall.mac4.prune1kb --make-bed --out EUSTreseq.pseudochrom.allconf.filtered.biall.mac4.prune1kb --allow-extra-chr --chr-set 29 no-y  &

/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 1 -B -j4 &> admix.k1.prune1kb.log &
/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 2 -B -j4 &> admix.k2.prune1kb.log &
/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 3 -B -j4 &> admix.k3.prune1kb.log &
/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 4 -B -j4 &> admix.k4.prune1kb.log &
/programs/admixture/admixture EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed 5 -B -j4 &> admix.k5.prune1kb.log &

# cross-validation of appropriate K values
for K in 1 2 3 4 5; \
do /programs/admixture/admixture --cv EUSTreseq.pseudochrom.allconf.filtered.biall.maf01.prune1kb.bed $K | tee log${K}.out; done
grep -h CV log*.out


##################### site-specific patterns #####################

# explored these patterns in GenomeScan.Rmd in same repo as this script

# chromosome 1
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 1 --from-bp XX --to-bp XX --freq --out Chrom1.Peak.Freq
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 1 --from-bp XX --to-bp XX --weir-fst-pop us.txt --weir-fst-pop uk.txt --out Chrom1.Peak.SiteFst.USUK
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 1 --from-bp XX --to-bp XX --site-pi --out Chrom1.Peak.SitePi

# chromosome 2



# chromosome 6
# high FST region runs from 5350001 to 6300001 based on windows, extended by 50kb
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --freq --out Chrom6.Peak.Freq
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --LROH --out Chrom6.Peak.LROH

# fst by site
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --weir-fst-pop us.txt --weir-fst-pop uk.txt  --out Chrom6.Peak.SiteFst.USUK
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --weir-fst-pop au.txt --weir-fst-pop uk.txt  --out Chrom6.Peak.SiteFst.AUUK
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --weir-fst-pop au.txt --weir-fst-pop us.txt  --out Chrom6.Peak.SiteFst.USAU

# pi by site
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --site-pi --indv uk1_sort --indv uk2_sort --indv uk3_sort --indv uk4_sort --indv uk5_sort --indv uk6_sort --indv uk7_sort --indv uk8_sort --out Chrom6.Peak.SitePi.UK
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --site-pi --indv au1_sort --indv au2_sort --indv au3_sort --indv au4_sort --indv au5_sort --indv au6_sort --indv au7_sort --indv au8_sort --out Chrom6.Peak.SitePi.AU
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --site-pi --indv us1_sort --indv us2_sort --indv us3_sort --indv us4_sort --indv us5_sort --indv us6_sort --indv us7_sort --indv us8_sort --out Chrom6.Peak.SitePi.US

# TajD by site
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --TajimaD 1 --indv uk1_sort --indv uk2_sort --indv uk3_sort --indv uk4_sort --indv uk5_sort --indv uk6_sort --indv uk7_sort --indv uk8_sort --out Chrom6.Peak.TajimaD.UK
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --TajimaD 1 --indv au1_sort --indv au2_sort --indv au3_sort --indv au4_sort --indv au5_sort --indv au6_sort --indv au7_sort --indv au8_sort --out Chrom6.Peak.TajimaD.AU
vcftools --vcf EUSTreseq.pseudochrom.allconf.filtered.biall.vcf --chr 6 --from-bp 5300001 --to-bp 6350001 --TajimaD 1 --indv us1_sort --indv us2_sort --indv us3_sort --indv us4_sort --indv us5_sort --indv us6_sort --indv us7_sort --indv us8_sort --out Chrom6.Peak.TajimaD.US
