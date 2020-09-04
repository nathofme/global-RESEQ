### comparing angsd to variant-called data
# based on this tutorial https://github.com/mfumagalli/ngsTools/blob/master/TUTORIAL.md#population-structure---pca


# can use reference genome for both but PBS/FST and folded SFS not trustworthy 
# must define this for each session (probably)
REF=/workdir/nrh44/EUSTref.fa
ANC=/workdir/nrh44/EUSTref.fa


# copy .bam files from /Archive/VariantCalling/sortRGmarkfixmate/*_sortRGmarkfixmate.bam
# these are prepped up until HaplotypeCaller step in GATK
# v1 used old au5 file, v2 all correct bam files, v3 also chrom-aligned reference

/programs/angsd_20180926/angsd/angsd -P 8 -b bam.filelist -ref $REF -out /workdir/nrh44/Results/ALL.v2.qc \
    -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
	-minMapQ 20 \
    -doQsDist 1 -doDepth 1 -doCounts 1 -maxDepth 500 &> ANGSD.qual.v2.log &


/programs/angsd_20180926/angsd/angsd -P 8 -b bam.pseudochrom.filelist -ref EUSTref.pseudochrom.fasta -out /workdir/nrh44/Results/ALL.pseudochrom.v3.qc \
    -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
    -minMapQ 20 \
    -doQsDist 1 -doDepth 1 -doCounts 1 -maxDepth 500 &> ANGSD.qual.pseudochrom.v3.log &


ls Results/*
# should see all files in line below
# Results/ALL.qc.arg  Results/ALL.qc.depthGlobal  Results/ALL.qc.depthSample  Results/ALL.qc.qs

# counts of quality scores
less -S Results/ALL.v2.qc.qs
# counts of per-sample depth
less -S Results/ALL.v2.qc.depthSample
wc -l Results/ALL.v2.qc.depthSample # 30 Results/ALL.qc.depthSample
# counts of global depth
less -S Results/ALL.v2.qc.depthGlobal

# compute percentiles of these distributions to determine threshold for filtering
# need to update script by downloading from github and copy into directory
Rscript plotQC.R Results/ALL.v2.qc 2> /dev/null
less -S Results/ALL.qc.info
evince Results/ALL.qc.pdf



# recommended filtering (used below)
#-minMapQ 20	#minimum mapping quality of 20
#-minQ 20	#minimum base quality of 20
#-minInd 15	#use only sites with data from at least 15 individuals
#-setMinDepth #60	minimum total depth
#-setMaxDepth #400

#### format as 012 called genotype for RDA
/programs/angsd_20180926/angsd/angsd -P 4 -b bam.pseudochrom.filelist -ref EUSTref.pseudochrom.fasta -out /workdir/nrh44/angsd/Results/ALL.geno2 \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 1 -setMinDepth 60 -setMaxDepth 400 -doCounts 1 \
        -GL 1 -doMajorMinor 1 -doMaf 1 -skipTriallelic 1 \
        -SNP_pval 1e-3 -doGeno 2 -doPost 1 &> ANGSD.formatrda.log &

NSITES=`zcat ALL.geno2.geno | tail -n+2 | wc -l`
echo $NSITES

# may need to clean up geno file (remove second column and sed labels), log in .Rout
R CMD BATCH RDAcluster.R &

#### RUN PCA
/programs/angsd_20180926/angsd/angsd -P 4 -b bam.filelist -ref EUSTref.fa -out /workdir/nrh44/Results/ALL.geno32 \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 15 -setMinDepth 60 -setMaxDepth 400 -doCounts 1 \
        -GL 1 -doMajorMinor 1 -doMaf 1 -skipTriallelic 1 \
        -SNP_pval 1e-3 -doGeno 32 -doPost 1 &> ANGSD.pca.v2.log &

# typical filtering removes private alleles, here keeping all variants found in at least 4 individuals
/programs/angsd_20180926/angsd/angsd -P 4 -b bam.filelist -ref EUSTref.fa -out /workdir/nrh44/Results/ALL.ind4.geno32 \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 60 -setMaxDepth 400 -doCounts 1 \
        -GL 1 -doMajorMinor 1 -doMaf 1 -skipTriallelic 1 \
        -SNP_pval 1e-3 -doGeno 32 -doPost 1 &> ANGSD.pca.v3.log &

# run PCA with pseudochrom dataset to check
/programs/angsd_20180926/angsd/angsd -P 4 -b bam.pseudochrom.filelist -ref EUSTref.pseudochrom.fasta -out /workdir/nrh44/angsd/Results/ALL.pseud.ind4.geno32 \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 60 -setMaxDepth 400 -doCounts 1 \
        -GL 1 -doMajorMinor 1 -doMaf 1 -skipTriallelic 1 \
        -SNP_pval 1e-3 -doGeno 32 -doPost 1 &> ANGSD.pca.pseud.v1.log &

# define how many sites we have by looking at file with allele frequencies
#less -S Results/ALL.mafs.gz
NSITES=`zcat Results/ALL.pseud.ind4.geno32.mafs.gz | tail -n+2 | wc -l`
echo $NSITES # 16151007

# estimating covariance matrix
/programs/ngsTools/ngsPopGen/ngsCovar -probfile Results/ALL.pseud.ind4.geno32.geno -outfile Results/ALL.pseud.ind4.geno32.covar -nind 24 -nsites 16151007 -call 0 -norm 0 &> ANGSD.covar.v3.log &
# -call 0 meaning that we do not perform genotype calling and -norm 0 that we are not normalising by allele frequency

# look at output file (NxN matrix)
less -S Results/ALL.pseud.ind4.geno32.covar

# be sure labels are in same order as bam.filelist
Rscript -e 'write.table(cbind(seq(1,24),rep(1,24),c(rep("UK",8),rep("US",8),rep("AU",8))), row.names=F, sep="\t", col.names=c("FID","IID","CLUSTER"), file="Results/ALL.clst", quote=F)'

Rscript /programs/ngsTools/Scripts/plotPCA.R -i Results/ALL.pseud.ind4.geno32.covar -c 1-2 -a Results/ALL.clst -o Results/ALL.pseud.pca.pdf
# local copy of plotPCA uses proper color palette
Rscript plotPCA.R -i Results/ALL.geno32.covar -c 1-2 -a Results/ALL.clst -o Results/ALL.pca.pdf
Rscript plotPCA.R -i Results/ALL.geno32.covar -c 2-3 -a Results/ALL.clst -o Results/ALL.pca23.pdf
Rscript plotPCA.R -i Results/ALL.geno32.covar -c 3-4 -a Results/ALL.clst -o Results/ALL.pca34.pdf
# -c 1-2 specifies that we are plotting only the first and second component

evince Results/ALL.pca.pdf

####### RUN ngsdist
/programs/angsd_20180926/angsd/angsd -P 4 -b bam.filelist -ref EUSTref.fa -out Results/ALL.geno8 \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 15 -setMinDepth 60 -setMaxDepth 400 -doCounts 1 \
        -GL 1 -doMajorMinor 1 -doMaf 1 -skipTriallelic 1 \
        -SNP_pval 1e-3 \
        -doGeno 8 -doPost 1 &> ANGSD.ngsdist.v2.log &

/programs/angsd_20180926/angsd/angsd -P 4 -b bam.filelist -ref EUSTref.fa -out Results/ALL.ind4.geno8 \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 60 -setMaxDepth 400 -doCounts 1 \
        -GL 1 -doMajorMinor 1 -doMaf 1 -skipTriallelic 1 \
        -SNP_pval 1e-3 \
        -doGeno 8 -doPost 1 &> ANGSD.ngsdist.v3.log &

/programs/angsd_20180926/angsd/angsd -P 4 -b bam.pseudochrom.filelist -ref EUSTref.pseudochrom.fasta -out Results/ALL.pseud.ind4.geno8 \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 60 -setMaxDepth 400 -doCounts 1 \
        -GL 1 -doMajorMinor 1 -doMaf 1 -skipTriallelic 1 \
        -SNP_pval 1e-3 \
        -doGeno 8 -doPost 1 &> ANGSD.ngsdist.pseud.v1.log &

NSITES=`zcat Results/ALL.pseud.ind4.geno8.mafs.gz | tail -n+2 | wc -l`
echo $NSITES
# 16151007

Rscript -e 'cat(paste(rep(c("UK","US","AU"),each=8), rep(1:8, 3), sep="_"), sep="\n", file="pops.label")'
cat pops.label

# pairwise genetic distances
/programs/ngsTools/ngsDist/ngsDist -verbose 1 -geno Results/ALL.pseud.ind4.geno8.geno.gz -probs -n_ind 24 -n_sites $NSITES -labels pops.label -o Results/ANGSD_dist_all -n_threads 24 &> ANGSD.dist.v3.log &
less -S Results/ANGSD_dist_all.dist
#### You need to construct a tree. The ngs tutorial is using FastMe
/programs/fastme-2.1.6.1/bin/fastme -D 1 -i Results/ANGSD_dist_all -o Results/ANGSD_dist_all.tree -m b -n b &> ANGSD_disttree_all.log &
### view the results in figtree

######## run admixture
/programs/angsd_20180926/angsd/angsd -P 4 -b bam.filelist -ref EUSTref.fa -out Results/ALL \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 15 -setMinDepth 60 -setMaxDepth 400 -doCounts 1 \
        -GL 1 -doMajorMinor 4 -doMaf 1 -skipTriallelic 1 \
	-doGlf 2 -SNP_pval 1e-3 &> ANGSD.admix.v2.log &

/programs/angsd_20180926/angsd/angsd -P 4 -b bam.pseudochrom.filelist -ref EUSTref.pseudochrom.fasta -out Results/ALL.pseud.admix \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 15 -setMinDepth 60 -setMaxDepth 400 -doCounts 1 \
        -GL 1 -doMajorMinor 4 -doMaf 1 -skipTriallelic 1 \
    -doGlf 2 -SNP_pval 1e-3 &> ANGSD.admix.pseud.v1.log &

K=2
/programs/ngsTools/ngsPopGen/NGSADMIX -likes Results/ALL.pseud.admix.beagle.gz -K $K -outfiles Results/ALL.K2 -P 4 -minMaf 0 &> ANGSD.ngsadmix.v3.log &

Rscript /programs/ngsTools/Scripts/plotAdmix.R -i Results/ALL.qopt -o Results/ALL.admix.pdf &> /dev/null
evince Results/ALL.admix.pdf


#### check inbreeding

for POP in AU US UK;
do
    echo $POP
    /programs/angsd_20180926/angsd/angsd -P 4 -b $POP.pseud.bamlist -ref EUSTref.pseudochrom.fasta -out Results/$POP \
            -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
            -minMapQ 20 -minQ 20 -minInd 8 -setMinDepth 20 -setMaxDepth 200 -doCounts 1 \
            -GL 1 -doMajorMinor 1 -doMaf 1 -skipTriallelic 1 \
            -doGlf 3 -SNP_pval 1e-3 &> ANGSD.inbreeding.log &
done


# per individual inbreeding tracts
NSAMS=8
for POP in AU US UK;
do
        echo $POP

    zcat Results/$POP.glf.gz > Results/$POP.glf

    NSITES=$((`zcat Results/$POP.mafs.gz | wc -l`-1))

    echo $POP $NSITES

    /programs/ngsTools/ngsF-HMM --geno Results/$POP.glf --loglkl --n_ind $NSAMS --n_sites $NSITES --freq r --freq_est 2 --indF 0.1,0.1 --out Results/$POP.F-HMM --n_threads 4 &> /dev/null
done


NSITES=`zcat Results/UK.mafs.gz | wc -l` # 10935699
NSITES=`zcat Results/US.mafs.gz | wc -l` # 9716020
NSITES=`zcat Results/AU.mafs.gz | wc -l` # 9197131
/programs/ngsTools/ngsF-HMM --geno Results/US.glf --loglkl --n_ind 8 --n_sites 9716020 --freq r --freq_est 2 --indF 0.1,0.1 --out Results/US.F-HMM --n_threads 4 &> /dev/null
/programs/ngsTools/ngsF-HMM --geno Results/UK.glf --loglkl --n_ind 8 --n_sites 10935700 --freq r --freq_est 2 --indF 0.1,0.1 --out Results/UK.F-HMM --n_threads 4 &> /dev/null &
/programs/ngsTools/ngsF-HMM --geno Results/AU.glf --loglkl --n_ind 8 --n_sites 9197132 --freq r --freq_est 2 --indF 0.1,0.1 --out Results/AU.F-HMM --n_threads 4 &> /dev/null &



######## build SFS
for POP in AU US UK
do
	echo $POP
	/programs/angsd_20180926/angsd/angsd -P 4 -b $POP.bamlist -ref EUSTref.fa -anc EUSTref.fa -out Results/$POP \
		-uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
		-minMapQ 20 -minQ 20 -minInd 8 -setMinDepth 20 -setMaxDepth 200 -doCounts 1 \
		-GL 1 -doSaf 1 &> ANGSD.sfs.v1.log &
done

# with pseudochromosomes
for POP in AU US UK
do
    echo $POP
    /programs/angsd_20180926/angsd/angsd -P 4 -b $POP.bamlist -ref EUSTref.pseudochrom.fasta -anc EUSTref.pseudochrom.fasta -out Results/$POP \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 8 -setMinDepth 20 -setMaxDepth 200 -doCounts 1 \
        -GL 1 -doSaf 1 &> ANGSD.sfs.$POP.pseud.log &
done

/programs/angsd_20180926/angsd/angsd -P 4 -b AU.bamlist -ref EUSTref.pseudochrom.fasta -anc EUSTref.pseudochrom.fasta -out Results/AU \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
        -minMapQ 20 -minQ 20 -minInd 8 -setMinDepth 20 -setMaxDepth 200 -doCounts 1 \
        -GL 1 -doSaf 1 &> ANGSD.sfs.AU.pseud.log &


# this step takes a huge amount of memory (50 GB)
/programs/angsd_20180926/angsd/misc/realSFS Results/AU.saf.idx -P 4 2> /dev/null > Results/AU.ref.sfs &
/programs/angsd_20180926/angsd/misc/realSFS Results/US.saf.idx -P 4 2> /dev/null > Results/US.ref.sfs &
/programs/angsd_20180926/angsd/misc/realSFS Results/UK.saf.idx -P 4 2> /dev/null > Results/UK.ref.sfs &

Rscript plotSFS_col.R Results/AU.ref.sfs-Results/US.ref.sfs-Results/UK.ref.sfs AU-US-UK 1 Results/ALL.ref.sfs.col.pdf
evince Results/ALL.ref.sfs.pdf

# bootstrap
/programs/angsd_20180926/angsd/misc/realSFS Results/AU.saf.idx -bootstrap 10  2> /dev/null > Results/AU.boots.sfs &
/programs/angsd_20180926/angsd/misc/realSFS Results/US.saf.idx -bootstrap 10  2> /dev/null > Results/US.boots.sfs &
/programs/angsd_20180926/angsd/misc/realSFS Results/UK.saf.idx -bootstrap 10  2> /dev/null > Results/UK.boots.sfs &


### 2d SFS -- run one at a time! huge memory drain.
/programs/angsd_20180926/angsd/misc/realSFS -P 4 US.saf.idx UK.saf.idx 2> /dev/null > US.UK.sfs &
/programs/angsd_20180926/angsd/misc/realSFS -P 4 AU.saf.idx UK.saf.idx 2> /dev/null > AU.UK.sfs &
/programs/angsd_20180926/angsd/misc/realSFS -P 4 AU.saf.idx US.saf.idx 2> /dev/null > US.AU.sfs &

### 3d SFS
/programs/angsd_20180926/angsd/misc/realSFS -P 4 AU.saf.idx UK.saf.idx US.saf.idx 2> /dev/null > AU.UK.US.sfs &


### compute FST per site

/programs/angsd_20180926/angsd/misc/realSFS fst index Results/US.saf.idx Results/UK.saf.idx -sfs Results/US.UK.sfs -fstout Results/US.UK -whichFST 1 &> ANGSD.fstindex.USUK.log &
/programs/angsd_20180926/angsd/misc/realSFS fst stats2 Results/US.UK.fst.idx -win 50000 -step 10000 -whichFST 1 > Results/US.UK.fst.txt &

/programs/angsd_20180926/angsd/misc/realSFS fst index Results/AU.saf.idx Results/UK.saf.idx -sfs Results/AU.UK.sfs -fstout Results/AU.UK -whichFST 1 &
/programs/angsd_20180926/angsd/misc/realSFS fst stats2 Results/AU.UK.fst.idx -win 50000 -step 10000 -whichFST 1 > Results/AU.UK.fst.txt &

/programs/angsd_20180926/angsd/misc/realSFS fst index Results/US.saf.idx Results/AU.saf.idx -sfs Results/US.AU.sfs -fstout Results/US.AU -whichFST 1
/programs/angsd_20180926/angsd/misc/realSFS fst stats2 Results/US.AU.fst.idx -win 50000 -step 10000 -whichFST 1 > Results/US.AU.fst.txt



# on big machine while processing 2d sfs (no Results dir)
/programs/angsd_20180926/angsd/misc/realSFS fst index US.saf.idx UK.saf.idx -sfs US.UK.sfs -fstout US.UK -whichFST 1 &> ANGSD.fstindex.USUK.log &
/programs/angsd_20180926/angsd/misc/realSFS fst index AU.saf.idx UK.saf.idx -sfs AU.UK.sfs -fstout AU.UK -whichFST 1 &> ANGSD.fstindex.AUUK.log &
/programs/angsd_20180926/angsd/misc/realSFS fst index US.saf.idx AU.saf.idx -sfs US.AU.sfs -fstout US.AU -whichFST 1 &> ANGSD.fstindex.USAU.log &

/programs/angsd_20180926/angsd/misc/realSFS fst stats2 US.UK.fst.idx -win 50000 -step 10000 -whichFST 1 > US.UK.fst.txt &
/programs/angsd_20180926/angsd/misc/realSFS fst stats2 AU.UK.fst.idx -win 50000 -step 10000 -whichFST 1 > AU.UK.fst.txt &
/programs/angsd_20180926/angsd/misc/realSFS fst stats2 US.AU.fst.idx -win 50000 -step 10000 -whichFST 1 > US.AU.fst.txt &


### compute pi per site
for POP in AU US UK
do
    echo $POP
    /programs/angsd_20180926/angsd/angsd -P 4 -b $POP.bamlist -ref $REF -anc $ANC -out Results/$POP \
                -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -baq 1 \
                -minMapQ 20 -minQ 20 -minInd 8 -setMinDepth 20 -setMaxDepth 200 -doCounts 1 \
                -GL 1 -doSaf 1 \
        -doThetas 1 -pest Results/$POP.ref.sfs &> /dev/null &
done


for POP in AU US UK
do
    echo $POP
    # perform a sliding-window analysis
    /programs/angsd_20180926/angsd/misc/thetaStat do_stat Results/$POP.thetas.idx -win 50000 -step 10000 -outnames Results/$POP.thetas &> /dev/null &
done
