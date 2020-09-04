### demographic models 

# 1 # smc++
# 2 # fastsimcoal

###################################################################

# 1 # smc++ for demography
# https://github.com/popgenmethods/smcpp

###################################################################

bgzip EUSTreseq.vcf &
tabix -p vcf EUSTreseq.vcf.gz &

bgzip EUSTreseq.pseudochrom.vcf &
tabix -p vcf EUSTreseq.pseudochrom.vcf.gz -h &

bgzip EUSTreseq.pseudochrom.allconf.vcf &
tabix -p vcf EUSTreseq.pseudochrom.allconf.vcf.gz -h &

# need to activative virtualenv on cluster
source /programs/smcpp/bin/activate
mkdir model


### LOOP VERSION

# prepare smc++ input for pseudochromosomes (all)
# distinguished lineages have highest coverage and mapped reads
for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo16_random_dna:chromosome_chromosome:taeGut3.2.4:16_random:1:187953:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF;
do
	smc++ vcf2smc -d au8_sort au8_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.AU.smc.gz $CHROM AU:au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort &
	smc++ vcf2smc -d uk4_sort uk4_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.UK.smc.gz $CHROM UK:uk1_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort &
	smc++ vcf2smc -d us1_sort us1_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.US.smc.gz $CHROM US:us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &
	smc++ vcf2smc -d uk4_sort uk4_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.AUUK.smc.gz $CHROM AU:au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort UK:uk1_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort &
	smc++ vcf2smc -d uk4_sort uk4_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.USUK.smc.gz $CHROM US:us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort UK:uk1_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort &
done


for CHROM in 1 1A 2 3 4 4A 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28;
do
	smc++ vcf2smc -d au8_sort au8_sort EUSTreseq.pseudochrom.allconf.vcf.gz chromosome$CHROM.AU.smc.gz $CHROM AU:au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort &
	smc++ vcf2smc -d uk4_sort uk4_sort EUSTreseq.pseudochrom.allconf.vcf.gz chromosome$CHROM.UK.smc.gz $CHROM UK:uk1_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort &
	smc++ vcf2smc -d us1_sort us1_sort EUSTreseq.pseudochrom.allconf.vcf.gz chromosome$CHROM.US.smc.gz $CHROM US:us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &
	smc++ vcf2smc -d uk4_sort uk4_sort EUSTreseq.pseudochrom.allconf.vcf.gz chromosome$CHROM.AUUK.smc.gz $CHROM AU:au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort UK:uk1_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort &
	smc++ vcf2smc -d uk4_sort uk4_sort EUSTreseq.pseudochrom.allconf.vcf.gz chromosome$CHROM.USUK.smc.gz $CHROM US:us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort UK:uk1_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort &
done


# testing all possible distinguished lineages

for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo16_random_dna:chromosome_chromosome:taeGut3.2.4:16_random:1:187953:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF;
	for j in {1..8};
		do
			smc++ vcf2smc -d au$j_sort au$j_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.AU.d$j.smc.gz $CHROM AU:au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort &> vcf2smc.au.log &
			smc++ vcf2smc -d uk$j_sort uk$j_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.UK.d$j.smc.gz $CHROM UK:uk1_sort,uk2_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort &> vcf2smc.uk.log &
			smc++ vcf2smc -d us$j_sort us$j_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.US.d$j.smc.gz $CHROM US:us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort &> vcf2smc.us.log &
			smc++ vcf2smc -d uk$j_sort uk$j_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.AUUK.d$j.smc.gz $CHROM AU:au1_sort,au2_sort,au3_sort,au4_sort,au5_sort,au6_sort,au7_sort,au8_sort UK:uk1_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort &> vcf2smc.auuk.log &
			smc++ vcf2smc -d uk$j_sort uk$j_sort EUSTreseq.pseudochrom.vcf.gz chromosome$CHROM.USUK.d$j.smc.gz $CHROM US:us1_sort,us2_sort,us3_sort,us4_sort,us5_sort,us6_sort,us7_sort,us8_sort UK:uk1_sort,uk3_sort,uk4_sort,uk5_sort,uk6_sort,uk7_sort,uk8_sort &> vcf2smc.usuk.log &
		done



# pop-specific with chromosomes
for CHROM in 1 1A 2 3 4 4A 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
do
	smc++ estimate 3.3e-9 smcgz/chromosome$CHROM.UK.smc.gz --polarization-error 0.5 -o model/model.$CHROM.UK.json &> model.$CHROM.UK.log &
done

for CHROM in 1 1A 2 3 4 4A 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
do
	smc++ estimate 3.3e-9 smcgz/chromosome$CHROM.AU.smc.gz --polarization-error 0.5 -o model/model.$CHROM.AU.json &> model.$CHROM.AU.log &
done

for CHROM in 1 1A 2 3 4 4A 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
do
	smc++ estimate 3.3e-9 smcgz/chromosome$CHROM.US.smc.gz --polarization-error 0.5 -o model/model.$CHROM.US.json &> model.$CHROM.US.log &
done



# bash for loop to rename generic output model.final.json with
for subdir in *; do mv -v "$subdir"/* /workdir/nrh44/smcpp/"$subdir"; done;
mkdir json
mv *.json /workdir/nrh44/smcpp/json

# run split models
# AUUK
for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo16_random_dna:chromosome_chromosome:taeGut3.2.4:16_random:1:187953:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF;
do
	smc++ split -o json/model.$CHROM.AUUK.json json/model.$CHROM.AU.json json/model.$CHROM.UK.json smcgz/chromosome$CHROM.AU.smc.gz smcgz/chromosome$CHROM.UK.smc.gz smcgz/chromosome$CHROM.AUUK.smc.gz &> model.split.$CHROM.AUUK.log &
done

# USUK
for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo16_random_dna:chromosome_chromosome:taeGut3.2.4:16_random:1:187953:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF;
do
	smc++ split -o json/model.$CHROM.USUK.json json/model.$CHROM.US.json json/model.$CHROM.UK.json smcgz/chromosome$CHROM.US.smc.gz smcgz/chromosome$CHROM.UK.smc.gz smcgz/chromosome$CHROM.USUK.smc.gz &> model.split.$CHROM.USUK.log &
done


# make plots
for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo16_random_dna:chromosome_chromosome:taeGut3.2.4:16_random:1:187953:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF;
do
	smc++ plot plots/popsize.$CHROM.AU.pdf json/model.$CHROM.AU.json -c &
	smc++ plot plots/popsize.$CHROM.UK.pdf json/model.$CHROM.UK.json -c &
	smc++ plot plots/popsize.$CHROM.US.pdf json/model.$CHROM.US.json -c &
done



# split plots
for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo16_random_dna:chromosome_chromosome:taeGut3.2.4:16_random:1:187953:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF;
do
	smc++ plot plots/joint.scaffold$CHROM.AUUK.pdf json/model.$CHROM.AUUK.json -g 4 &
	smc++ plot plots/joint.scaffold$CHROM.USUK.pdf json/model.$CHROM.USUK.json -g 4 &
done

# smc++ done!
# look at json output to get pop size history and rho/theta output



# re-run estimate with smoother rp
for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF
do
	smc++ estimate 3.3e-9 smcgz/chromosome$CHROM.UK.smc.gz --polarization-error 0.5 --regularization-penalty 5 -o model/model.$CHROM.UK.json &> model.$CHROM.UK.log &
done

for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF
do
	smc++ estimate 3.3e-9 smcgz/chromosome$CHROM.AU.smc.gz --polarization-error 0.5 --regularization-penalty 5 -o model/model.$CHROM.AU.json &> model.$CHROM.AU.log &
done

for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF
do
	smc++ estimate 3.3e-9 smcgz/chromosome$CHROM.US.smc.gz --polarization-error 0.5 --regularization-penalty 5 -o model/model.$CHROM.US.json &> model.$CHROM.US.log &
done

# plot all
for CHROM in Pseudo1_dna:chromosome_chromosome:taeGut3.2.4:1:1:118548696:1_REF Pseudo10_dna:chromosome_chromosome:taeGut3.2.4:10:1:20806668:1_REF Pseudo11_dna:chromosome_chromosome:taeGut3.2.4:11:1:21403021:1_REF Pseudo12_dna:chromosome_chromosome:taeGut3.2.4:12:1:21576510:1_REF Pseudo13_dna:chromosome_chromosome:taeGut3.2.4:13:1:16962381:1_REF Pseudo14_dna:chromosome_chromosome:taeGut3.2.4:14:1:16419078:1_REF Pseudo15_dna:chromosome_chromosome:taeGut3.2.4:15:1:14428146:1_REF Pseudo16_random_dna:chromosome_chromosome:taeGut3.2.4:16_random:1:187953:1_REF Pseudo17_dna:chromosome_chromosome:taeGut3.2.4:17:1:11648728:1_REF Pseudo18_dna:chromosome_chromosome:taeGut3.2.4:18:1:11201131:1_REF Pseudo19_dna:chromosome_chromosome:taeGut3.2.4:19:1:11587733:1_REF Pseudo1A_dna:chromosome_chromosome:taeGut3.2.4:1A:1:73657157:1_REF Pseudo1B_dna:chromosome_chromosome:taeGut3.2.4:1B:1:1083483:1_REF Pseudo2_dna:chromosome_chromosome:taeGut3.2.4:2:1:156412533:1_REF Pseudo20_dna:chromosome_chromosome:taeGut3.2.4:20:1:15652063:1_REF Pseudo21_dna:chromosome_chromosome:taeGut3.2.4:21:1:5979137:1_REF Pseudo22_dna:chromosome_chromosome:taeGut3.2.4:22:1:3370227:1_REF Pseudo23_dna:chromosome_chromosome:taeGut3.2.4:23:1:6196912:1_REF Pseudo24_dna:chromosome_chromosome:taeGut3.2.4:24:1:8021379:1_REF Pseudo25_dna:chromosome_chromosome:taeGut3.2.4:25:1:1275379:1_REF Pseudo26_dna:chromosome_chromosome:taeGut3.2.4:26:1:4907541:1_REF Pseudo27_dna:chromosome_chromosome:taeGut3.2.4:27:1:4618897:1_REF Pseudo28_dna:chromosome_chromosome:taeGut3.2.4:28:1:4963201:1_REF Pseudo3_dna:chromosome_chromosome:taeGut3.2.4:3:1:112617285:1_REF Pseudo4_dna:chromosome_chromosome:taeGut3.2.4:4:1:69780378:1_REF Pseudo4A_dna:chromosome_chromosome:taeGut3.2.4:4A:1:20704505:1_REF Pseudo5_dna:chromosome_chromosome:taeGut3.2.4:5:1:62374962:1_REF Pseudo6_dna:chromosome_chromosome:taeGut3.2.4:6:1:36305782:1_REF Pseudo7_dna:chromosome_chromosome:taeGut3.2.4:7:1:39844632:1_REF Pseudo8_dna:chromosome_chromosome:taeGut3.2.4:8:1:27993427:1_REF Pseudo9_dna:chromosome_chromosome:taeGut3.2.4:9:1:27241186:1_REF PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF;
do
	smc++ plot plots/popsize.$CHROM.pdf json/model.$CHROM.US.json json/model.$CHROM.UK.json json/model.$CHROM.AU.json -c &
done

for CHROM in PseudoZ_dna:chromosome_chromosome:taeGut3.2.4:Z:1:72861351:1_REF;
do
	smc++ plot plots/popsize.$CHROM.pdf json/model.$CHROM.US.json json/model.$CHROM.UK.json json/model.$CHROM.AU.json -c &
done


###################################################################

# 2 # fastsimcoal option (genome-wide)

# check that files properly formatted with test run
/programs/fsc26_linux64/fsc26 fsc -t AU.tpl -e AU.est -m AU_MAFpop0.obs -M -n 1000000 -L 50 -q -k 100000 -C1 -r 43 -B4 &> AU.fsc.v1.log &
/programs/fsc26_linux64/fsc26 fsc -t US.tpl -e US.est -m US_MAFpop0.obs -M -n 1000000 -L 50 -q -k 100000 -C1 -r 38 -B4 &> US.fsc.v1.log &
/programs/fsc26_linux64/fsc26 fsc -t UK.tpl -e UK.est -m UK_MAFpop0.obs -M -n 1000000 -L 50 -q -k 100000 -C1 -r 59 -B4 &> UK.fsc.v1.log &

# run more cycles, more EM runs for more careful parameterization
/programs/fsc26_linux64/fsc26 fsc -t AU.tpl -e AU.est -m AU_MAFpop0.obs -M -n 2000000 -L 100 -q -k 100000 -C1 -r 738 -B4 &> AU.fsc.v2.log &
/programs/fsc26_linux64/fsc26 fsc -t US.tpl -e US.est -m US_MAFpop0.obs -M -n 2000000 -L 100 -q -k 100000 -C1 -r 983 -B4 &> US.fsc.v2.log &
/programs/fsc26_linux64/fsc26 fsc -t UK.tpl -e UK.est -m UK_MAFpop0.obs -M -n 2000000 -L 100 -q -k 100000 -C1 -r 548 -B4 &> UK.fsc.v2.log &
# 9 more rounds of these parameters from different starting points

PREFIX="UK"
for i in {1..50}
 do
   mkdir run$i
   mkdir /home/nrh44/EUST_RESEQ_2017/Demography/fsc${PREFIX}/run$i/
   cp ${PREFIX}.tpl ${PREFIX}.est ${PREFIX}_MAFpop0.obs run$i"/"
   cd run$i
   /programs/fsc26_linux64/fsc26 -t ${PREFIX}.tpl -e ${PREFIX}.est -m ${PREFIX}_MAFpop0.obs -M -n 2000000 -L 100 -C10 -s0 -M -q -B4 &> $PREFIX.fsc.run$i.log &
   cp * /home/nrh44/EUST_RESEQ_2017/Demography/fsc${PREFIX}/run$i/
   cd ..
 done

# combine all best likelihoods, row number is run number in outfile
PREFIX="UK"
cat run{51..100}/${PREFIX}/${PREFIX}.bestlhoods > ${PREFIX}.all.51.100.bestlhoods
# copied onto local to get AIC


# use 2d SFS from ANGSD output
# manually convert 1-line 2d-sfs to matrix with dimensions (n+1) x (m+1) where n and m are sample sizes
# for these data, matrix is 17x17

# test with example files provided
/programs/fsc26_linux64/fsc26 fsc -t 2PopDivMigr20Mb.tpl -e 2PopDivMigr20Mb.est -d -M -n 1000000 -L 50 -q -k 100000 -C1 -r 3281 -B4 &> test.fsc.v1.log &
# this works, something wrong with obs or tpl/est files

# k option writes polymorphic sites to temporary file and should help with memory (was getting seg fault)
# r is seed
/programs/fsc26_linux64/fsc26 fsc -t AUUK.tpl -e AUUK.est -M -n 1000000 -L 50 -q -k 100000 -C1 -r 3281 &> AUUK.fsc.v1.log &

/programs/fsc26_linux64/fsc26 fsc -t USUK.tpl -e USUK.est -M -n 1000000 -L 50 -q -k 100000 -C1 -r 8423 -B4 &> USUK.fsc.v1.log &
