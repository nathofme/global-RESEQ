
# sliding windows a la Simon Martin (copy .py scripts to cluster)
pip install numpy
gzip EUSTreseq.vcf
python parseVCF.2018.py -i EUSTreseq.vcf.gz --skipIndels --minQual 30 --gtf flag=DP min=5 | gzip > EUSTreseq.geno.gz &
python popgenWindows.py --windType coordinate -w 50000 -g EUSTreseq.geno.gz -o EUSTreseq.window50kb.gz -f phased -T 5 -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &> popGenwindows.coord.log &
python popgenWindows.py --windType coordinate -w 50000 -g EUSTreseq.geno.gz -o EUSTreseq.window50kb.m10.gz -f phased -T 5 -m 10 -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &> popGenwindows.coord.m10.50kb.log &
python popgenWindows.py --windType coordinate -w 10000 -g EUSTreseq.geno.gz -o EUSTreseq.window10kb.gz -f phased -T 5 -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &> popGenwindows10kb.log &
python popgenWindows.py --windType coordinate -w 10000 -g EUSTreseq.geno.gz -o EUSTreseq.window10kb.m10.gz -f phased -m 10 -T 5 -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &> popGenwindows10kb.m10.log &

python sfs.py -g EUSTreseq.geno.gz -f phased --dadiFormat --pref EUSTreseq &
python sfs.py -g EUSTreseq.geno.gz -f phased -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort --dadiFormat --pref EUSTreseq.pop &

python parseVCF.py -i EUSTreseq.pseudochrom.vcf.gz --skipIndels --minQual 30 --gtf flag=DP min=5 | gzip > EUSTreseq.pseudochrom.geno.gz &
python parseVCF.2018.py -i EUSTreseq.pseudochrom.vcf.gz --skipIndels --minQual 30 --gtf flag=DP min=5 | gzip > EUSTreseq.pseudochrom.geno.gz &




##### other formats for additional analyses
# make plink files (binary and regular) using most recent plink version
/programs/plink-1.9-x86_64-beta5/plink --vcf EUSTreseq.pseudochrom.vcf --out EUSTreseq.pseudochrom --recode --allow-extra-chr --double-id --id-delim ' ' &
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom --make-bed --out EUSTreseq.pseudochrom --allow-extra-chr &


# linkage disequilibrium
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom --r2 --ld-window 10000 --allow-extra-chr &> plink.ld.log &
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom --r2 --ld-window 50000 --out EUSTreseq.pseudo.5kb.ld --allow-extra-chr &> plink.ld.log &
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom --r2 --out EUSTreseq.default.ld --allow-extra-chr &> plink.default.ld.log &


# id haplotype blocks
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom --blocks no-pheno-req --out EUSTreseq.pseudo.blocks --allow-extra-chr --threads 8 &> plink.blocks.log &

# scan for roh (all unspecified calls default behavior as of 7/20/19)
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom --homozyg --homozyg-snp 30 --homozyg-kb 100 --allow-extra-chr &> plink.roh.v1.log &
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom --homozyg --allow-extra-chr --out EUSTreseq.default.hom &> plink.roh.default.log &
/programs/plink-1.9-x86_64-beta5/plink --file EUSTreseq.pseudochrom --homozyg --homozyg-kb 100 --allow-extra-chr --out EUSTreseq.100kb.hom &> plink.roh.v2.log &

# extract FST outliers from sliding window only
# wrote csv of outlier windows and then copied chrom, start and end columns, reformat to bed
# include only positions covered in this bed file in a new vcf file
vcftools --vcf EUSTreseq.scaffnames.vcf --bed EUSTreseq.window10kb.outliersAUUK.bed --recode --out EUSTreseq.outliersAUUK &
vcftools --vcf EUSTreseq.scaffnames.vcf --bed EUSTreseq.window10kb.outliersUSUK.bed --recode --out EUSTreseq.outliersUSUK &

# no missing for RDA
vcftools --vcf EUSTreseq.outliersAUUK.vcf --max-missing 1 --recode --out EUSTreseq.outliersAUUK.nomiss &
vcftools --vcf EUSTreseq.outliersUSUK.vcf --max-missing 1 --recode --out EUSTreseq.outliersUSUK.nomiss &

vcftools --vcf EUSTreseq.outliersAUUK.nomiss.vcf --012 --out EUSTreseq.outliersAUUK.nomiss &
vcftools --vcf EUSTreseq.outliersUSUK.nomiss.vcf --012 --out EUSTreseq.outliersUSUK.nomiss &


# get one vcf with all outliers

bedtools merge -i EUSTreseq.window10kb.outliersUSUK.bed -i EUSTreseq.window10kb.outliersAUUK.bed > EUSTreseq.window10kb.outliersALL.bed &
vcftools --vcf EUSTreseq.scaffnames.vcf --bed EUSTreseq.window10kb.outliersALL.bed --recode --out EUSTreseq.outliersALL &

vcftools --vcf EUSTreseq.outliersALL.vcf --max-missing 1 --recode --out EUSTreseq.outliersALL.nomiss &

vcftools --vcf EUSTreseq.outliersALL.nomiss.vcf --012 --out EUSTreseq.outliersALL.nomiss &

# i'm not sure this worked... shows 48 individuals instead

### SFS for outliers

python parseVCF.py -i EUSTreseq.outliersAUUK.vcf.gz --skipIndels --minQual 30 --gtf flag=DP min=5 | gzip > EUSTreseq.outliersAUUK.geno.gz &
python parseVCF.py -i EUSTreseq.outliersUSUK.vcf.gz --skipIndels --minQual 30 --gtf flag=DP min=5 | gzip > EUSTreseq.outliersUSUK.geno.gz &

python sfs.py -g EUSTreseq.outliersAUUK.geno.gz -f phased --dadiFormat --pref EUSTreseq.outliersAUUK &
python sfs.py -g EUSTreseq.outliersAUUK.geno.gz -f phased -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort --dadiFormat --pref EUSTreseq.outliersAUUK.pop &

python sfs.py -g EUSTreseq.outliersUSUK.geno.gz -f phased --dadiFormat --pref EUSTreseq.outliersUSUK &
python sfs.py -g EUSTreseq.outliersUSUK.geno.gz -f phased -p AU au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort -p UK uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort -p US us1_sort,us2_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort --dadiFormat --pref EUSTreseq.outliersUSUK.pop &

### extracting only non-exon regions
convert2bed -i gff < Sturnus_vulgaris-1.0_Exons.gff > Sturnus_vulgaris-1.0_Exons.bed

# "neutral" non-exon sites
bedtools subtract -a <BED/GFF/VCF> -b <BED/GFF/VCF>

############################## POPULATION STRUCTURE & COMPARISONS  #############################

### fastStructure
# need .bed .bim .fam for input
python /programs/fastStructure-1.0/structure.py -K 1 --cv 10 --input=EUSTreseq_maf025dp5 --output=EUSTreseq_maf025dp5_cv10_out &
python /programs/fastStructure-1.0/structure.py -K 2 --cv 10 --input=EUSTreseq_maf025dp5 --output=EUSTreseq_maf025dp5_cv10_out &
python /programs/fastStructure-1.0/structure.py -K 3 --cv 10 --input=EUSTreseq_maf025dp5 --output=EUSTreseq_maf025dp5_cv10_out &
python /programs/fastStructure-1.0/structure.py -K 4 --cv 10 --input=EUSTreseq_maf025dp5 --output=EUSTreseq_maf025dp5_cv10_out &
python /programs/fastStructure-1.0/structure.py -K 5 --cv 10 --input=EUSTreseq_maf025dp5 --output=EUSTreseq_maf025dp5_cv10_out &
python /programs/fastStructure-1.0/structure.py -K 6 --cv 10 --input=EUSTreseq_maf025dp5 --output=EUSTreseq_maf025dp5_cv10_out &
python /programs/fastStructure-1.0/structure.py -K 7 --cv 10 --input=EUSTreseq_maf025dp5 --output=EUSTreseq_maf025dp5_cv10_out &
python /programs/fastStructure-1.0/structure.py -K 8 --cv 10 --input=EUSTreseq_maf025dp5 --output=EUSTreseq_maf025dp5_cv10_out &

# to determine which K fits best
python /programs/fastStructure-1.0/chooseK.py --input=EUSTreseq_maf025dp5_cv10_out
# Model complexity that maximizes marginal likelihood = 2
# Model components used to explain structure in data = 2

# need file wth population labels
# this echo line sets display
echo "backend: Agg" > ~/.config/matplotlib/matplotlibrc
python /programs/fastStructure-1.0/distruct.py -K 2 --input=EUSTreseq_maf025dp5_cv10_out --output=EUSTreseq_maf025dp5_cv10_out_distructK2.svg --popfile EUSTreseq_popfile.txt
python /programs/fastStructure-1.0/distruct.py -K 3 --input=EUSTreseq_maf025dp5_cv10_out --output=EUSTreseq_maf025dp5_cv10_out_distructK3.svg --popfile EUSTreseq_popfile.txt


########################################## SELECTION ###############################################


# runs of homozygosity using AF computed in GATK variant-calling

# first prepare input files
/programs/bcftools-1.9/bin/bcftools sort EUSTreseq.pseudochrom.vcf -o EUSTreseq.pseudochrom.sort.vcf &
bgzip EUSTreseq.pseudochrom.sort.vcf &
/programs/bcftools-1.9/bin/bcftools index EUSTreseq.pseudochrom.sort.vcf.gz &

# create a new tab-delimited file with allele frequencies
/programs/bcftools-1.9/bin/bcftools query -f'%CHROM\t%POS\t%REF,%ALT\t%INFO/AF\n' EUSTreseq.pseudochrom.sort.vcf.gz | bgzip -c > EUSTreseq.pseudochrom.freqs.tab.gz
tabix -s1 -b2 -e2 EUSTreseq.pseudochrom.freqs.tab.gz &

/programs/bcftools-1.9/bin/bcftools roh EUSTreseq.pseudochrom.sort.vcf.gz --AF-file EUSTreseq.pseudochrom.freqs.tab.gz -o EUSTreseq.pseudochrom.roh &> roh.pseudochrom.estAF.log &

# run as independent populations
bcftools view -m2 -M2 -v snps EUSTreseq_pseudochrom_AUonly.vcf.recode.vcf -Ou -o EUSTreseq.pseudochrom.AU.bi.vcf &
bcftools view -m2 -M2 -v snps EUSTreseq_pseudochrom_USonly.vcf.recode.vcf -Ou -o EUSTreseq.pseudochrom.US.bi.vcf &
bcftools view -m2 -M2 -v snps EUSTreseq_pseudochrom_UKonly.vcf.recode.vcf -Ou -o EUSTreseq.pseudochrom.UK.bi.vcf &

/programs/bcftools-1.9/bin/bcftools sort EUSTreseq.pseudochrom.AU.bi.vcf -o EUSTreseq.pseudochrom.AU.bi.sort.vcf &
/programs/bcftools-1.9/bin/bcftools sort EUSTreseq.pseudochrom.US.bi.vcf -o EUSTreseq.pseudochrom.US.bi.sort.vcf &
/programs/bcftools-1.9/bin/bcftools sort EUSTreseq.pseudochrom.UK.bi.vcf -o EUSTreseq.pseudochrom.UK.bi.sort.vcf &

bgzip EUSTreseq.pseudochrom.AU.bi.sort.vcf &
bgzip EUSTreseq.pseudochrom.US.bi.sort.vcf &
bgzip EUSTreseq.pseudochrom.UK.bi.sort.vcf &

/programs/bcftools-1.9/bin/bcftools index -f EUSTreseq.pseudochrom.AU.bi.sort.vcf.gz &
/programs/bcftools-1.9/bin/bcftools index -f EUSTreseq.pseudochrom.US.bi.sort.vcf.gz &
/programs/bcftools-1.9/bin/bcftools index -f EUSTreseq.pseudochrom.UK.bi.sort.vcf.gz &

/programs/bcftools-1.9/bin/bcftools query -f'%CHROM\t%POS\t%REF,%ALT\t%INFO/AF\n' EUSTreseq.pseudochrom.AU.sort.vcf.gz | bgzip -c > EUSTreseq.pseudochrom.AU.freqs.tab.gz &
/programs/bcftools-1.9/bin/bcftools query -f'%CHROM\t%POS\t%REF,%ALT\t%INFO/AF\n' EUSTreseq.pseudochrom.US.sort.vcf.gz | bgzip -c > EUSTreseq.pseudochrom.US.freqs.tab.gz &
/programs/bcftools-1.9/bin/bcftools query -f'%CHROM\t%POS\t%REF,%ALT\t%INFO/AF\n' EUSTreseq.pseudochrom.UK.sort.vcf.gz | bgzip -c > EUSTreseq.pseudochrom.UK.freqs.tab.gz &

tabix -s1 -b2 -e2 EUSTreseq.pseudochrom.AU.freqs.tab.gz &
tabix -s1 -b2 -e2 EUSTreseq.pseudochrom.US.freqs.tab.gz &
tabix -s1 -b2 -e2 EUSTreseq.pseudochrom.UK.freqs.tab.gz &

/programs/bcftools-1.9/bin/bcftools roh EUSTreseq.pseudochrom.AU.sort.vcf.gz --AF-file EUSTreseq.pseudochrom.AU.freqs.tab.gz -o EUSTreseq.pseudochrom.AU.roh &> roh.AU.pseudochrom.estAF.log &
/programs/bcftools-1.9/bin/bcftools roh EUSTreseq.pseudochrom.UK.sort.vcf.gz --AF-file EUSTreseq.pseudochrom.UK.freqs.tab.gz -o EUSTreseq.pseudochrom.UK.roh &> roh.UK.pseudochrom.estAF.log &
/programs/bcftools-1.9/bin/bcftools roh EUSTreseq.pseudochrom.US.sort.vcf.gz --AF-file EUSTreseq.pseudochrom.US.freqs.tab.gz -o EUSTreseq.pseudochrom.US.roh &> roh.US.pseudochrom.estAF.log &


/programs/bcftools-1.9/bin/bcftools roh EUSTreseq.pseudochrom.AU.sort.vcf.gz --AF-dflt 0.4 -o EUSTreseq.pseudochrom.AU.dflt.roh &> roh.AU.pseudochrom.AFdflt.log &
/programs/bcftools-1.9/bin/bcftools roh EUSTreseq.pseudochrom.UK.sort.vcf.gz --AF-dflt 0.4 -o EUSTreseq.pseudochrom.UK.dflt.roh &> roh.UK.pseudochrom.AFdflt.log &
/programs/bcftools-1.9/bin/bcftools roh EUSTreseq.pseudochrom.US.sort.vcf.gz --AF-dflt 0.4 -o EUSTreseq.pseudochrom.US.dflt.roh &> roh.US.pseudochrom.AFdflt.log &

# need to use older python version
# first install miniconda (download shell script and run locally on cluster)
export PATH=/home/nrh44/miniconda2/bin:$PATH
conda create -n python2.7.15 python=2.7.15
export PATH=/home/nrh44/anaconda2/bin:$PATH
source activate python2.7.15

pip install matplotlib
python2.7.15 /programs/bcftools-1.8/bin/plot-roh.py -o rohplot.png


# to run roh as sliding window, use .bed file with all 10kb or 50kb windows

cut -f 1,2 EUSTref.pseudochrom.fa.fai > pseudo.chrom.sizes
bedtools makewindows -g pseudo.chrom.sizes -w 10000 > pseudogenome.10kb.bed &
sort -k 1,1 -k2,2n pseudogenome.10kb.bed &
bedtools makewindows -g pseudo.chrom.sizes -w 50000 > pseudogenome.50kb.bed &


/programs/bcftools-1.9/bin/bcftools roh EUSTreseq.pseudochrom.sort.vcf.gz --AF-file EUSTreseq.pseudochrom.freqs.tab.gz -R pseudochrom.genome.10kb.bed -o EUSTreseq.10kb.roh &> roh.10kb.estAF.log &
/programs/bcftools-1.9/bin/bcftools roh EUSTreseq.pseudochrom.sort.vcf.gz --AF-file EUSTreseq.pseudochrom.freqs.tab.gz -R pseudochrom.genome.50kb.bed -o EUSTreseq.50kb.roh &> roh.50kb.estAF.log &

# older version
/programs/bcftools-1.9/bin/bcftools roh --AF-dflt 0.4 EUSTreseq.vcf -o EUSTreseq.roh &> roh.AFdflt04.log &


### identify outlier peaks from sliding window analyses

bedtools getfasta -fi EUSTref.chrom.fasta -bed EUSTreseq.window10kb.outliersUSUK.bed -fo USUK.outliers.fa &
bedtools getfasta -fi EUSTref.chrom.fasta -bed EUSTreseq.window10kb.outliersAUUK.bed -fo AUUK.outliers.fa &
bedtools getfasta -fi EUSTref.chrom.fasta -bed EUSTreseq.window10kb.outliersUSAU.bed -fo USAU.outliers.fa &

bedtools getfasta -fi EUSTref.chrom.fasta -bed USUK.lowDxy.Candidates.bed -fo USUK.lowDxy.outliers.fa &
bedtools getfasta -fi EUSTref.chrom.fasta -bed AUUK.lowDxy.Candidates.bed -fo AUUK.lowDxy.outliers.fa &


bedtools getfasta -fi EUSTref.fasta -bed USUK.noveldiv.bed -fo USUK.noveldiv.fa &
bedtools getfasta -fi EUSTref.fasta -bed AUUK.noveldiv.bed -fo AUUK.noveldiv.fa &


bedtools getfasta -fi EUSTref.pseudochrom.fasta -bed FstOutliers.USUK.Pseud.bed -fo USUK.Pseud.FstOutliers.fa &
bedtools getfasta -fi EUSTref.pseudochrom.fasta -bed FstOutliers.AUUK.Pseud.bed -fo AUUK.Pseud.FstOutliers.fa &





################### code that I haven't run or isn't working


# BEAGLE to impute and phase genotypes
java -Xmx8g -jar /programs/beagle41/beagle41.jar gt = EUSTreseq.vcf out=EUSTreseq_imputed ref=EUSTref.



# fineSTRUCTURE
# make recombination rate file

# convert Beagle output to fs input with provided perl script
perl beagle2chromopainter.pl <options> beagle_phased_output_file output_filename_prefix






# runs of homozygosity (default using genotype likelihoods)
# would be better to specify AF but this dataset has the best available freq calculation
# bcftools is estimating allele frequencies and recombination rate directly here (could estimate w/LDhat if needed)
# G parameter specifies 30 to account for genotyping errors
bcftools roh EUSTreseq.vcf -e GT,- -o EUSTreseq.v.roh &> roh.v.log &

# linkage disequilibrium
vcftools --vcf EUSTreseq.vcf --hap-r2 --ld-window-bp 10000 --out EUSTreseq &
# not enough sites left for estimate....?





# need .stru format to read into adegenet in R
touch EUSTreseq_maf001_prune10kb.stru
java -Xmx8g -jar PGDSpider2-cli.jar -inputfile EUSTreseq_maf001_prune10kb.bcf -inputformat BCF -outputfile EUSTreseq_maf001_prune10kb.stru -outputformat STRUCTURE -spid bcf2str.spid &

#ERROR 18:16:21 - input file error at line: 2407
#read input file done.
#write output file...
#ERROR 18:16:21 - No Microsat, SNP, RFLP, AFLP or Standard data in the input file. STRUCTURE can only handle these data types!!!
#write output file done.



# impute genotypes for RDA (need to copy .jar from local to cluster)
#java -Xmx6g -jar LinkImputeR.jar -s accuracy_EUSTreseq_maf001.ini &
#java -Xmx6g -jar LinkImputeR.jar EUSTreseq_maf001_impute1.xml 'Case 2' EUSTreseq_maf001_imputed.vcf &

#vcftools --vcf EUSTreseq_maf025dp5pruned.vcf --plink --out EUSTreseq_maf025dp5pruned &
#plink --file EUSTreseq_maf025dp5pruned --make-bed --noweb --out EUSTreseq_maf025dp5pruned &
#plink --file EUSTreseq_maf025dp5pruned --noweb --recode structure --out EUSTreseq_maf025dp5pruned &



cp -r /programs/PGDSpider_2.1.1.2  /workdir/nrh44
cd /workdir/nrh44/PGDSpider_2.1.1.2




### NONE OF THIS WILL WORK UNLESS YOU HAVE A GENETIC MAP
# plink .map file is blank...
# run Relate: https://myersgroup.github.io/relate/index.html
export PATH=/programs/relate_v1.0.5_x86_64_static/bin:$PATH
# first, convert from VCF file (all SNPs for selection, filtered for trees)
/programs/relate_v1.0.5_x86_64_static/bin/RelateFileFormats \
    --mode ConvertFromVcf \
    --haps EUSTreseq.haps \
    --sample EUSTreseq.sample \
    -i EUSTreseq &
#done
cp EUSTreseq.sample /home/nrh44/EUST_RESEQ_2017 &
cp /home/nrh44/EUST_RESEQ_2017/OtherAnalyses/Relate/EUSTreseq.poplabels /workdir/nrh44/relate &

# prepare input in haps (removes non-biallelic SNPs, flips haplotype)
/programs/relate_v1.0.5_x86_64_static/scripts/PrepareInputFiles/PrepareInputFiles.sh \
    --haps EUSTreseq.haps \
    --sample EUSTreseq.sample \
    --ancestor EUSTref.fasta \
    --poplabels EUSTreseq.poplabels \
    -o EUSTreseq_input &
# did not remove or flip any SNPs, so keep original .haps file

# now, run Relate to create .anc and .mut files
# genetic map comes from plink output
/programs/relate_v1.0.5_x86_64_static/bin/Relate \
      --mode All \
      --mutation_rate 1e-9 \
      --effectiveN 358 \
      --haps EUSTreseq.haps \
      --sample EUSTreseq.sample \
      --map EUSTreseq.map \
      --seed 471 \
      -o EUSTreseq &

### ERROR
#Relate: /users/myers/speidel/Documents/genomics/relate/include/src/data.cpp:811: void haps::ReadSNP(std::vector<char, std::allocator<char> >&, int&): Assertion `it_seq == sequence.end()' failed.
### problem in haps file?

# estimate population size
/programs/relate_v1.0.5_x86_64_static/scripts/EstimatePopulationSize/EstimatePopulationSize.sh \
     -i EUSTreseq \
     -m 1e-9 \
     --poplabels EUSTreseq.poplabels \
     --seed 378 \
     -o EUSTreseq_popsize &

# test for selection: did the allele spread quickly based on coalescent model?
# make sure already ran estimates of population size, since that generates .anc/.mut files for coal module
/programs/relate_v1.0.5_x86_64_static/scripts/DetectSelection/DetectSelection.sh \
     -i EUSTreseq \
     -o EUSTreseq_selection \
     -m 1e-9 \
     --years_per_gen 4 \








     ############################## DEMOGRAPHY ###############################################


     ### stairway plot with pop-specific SFS from Martin script
     export CLASSPATH=~/Applications/stairway_plot_v2/stairway_plot_es
     echo $CLASSPATH

     java -cp stairway_plot_es Stairbuilder eustreseq_US_fold.blueprint &
     # SFS shall have nseq/2 error
     bash eustrad_fold.blueprint.sh # in stairway_plot_v2beta2 directory!
     bash eustrad_fold.blueprint.plot.sh
