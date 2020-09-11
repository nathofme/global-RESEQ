### SCRIPT — STARLING RESEQ DATA — DECEMBER 2017 ###

#################################### PRE-PROCESSING ####################################

# BACKGROUND INFO FOR THESE SEQUENCES

# Library: PCR free TruSeq Illumina library
# Platform: HiSeqX
# Length: 150bp
# Paired end
# ~350bp insert

# reference genome available at ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/001/447/265/GCA_001447265.1_Sturnus_vulgaris-1.0
# remember that .fna is just a fasta file


# EXTRACT .BAM TO .FASTQ

# data in .bam from sequencing company, need sorted .fastq files
# check that these actually are .fastq files in alignment
# .bam sorted/grouped by the read name
# keeps two output FASTQ files in the same order (two files b/c paired end)

# move files to homedir
# make new folder for starling reseq
# reserve machine
# copy files from homedir to workdir using
cp *.bam /workdir/nrh44

# sort -n is sorting by read name

samtools sort -n gerald_H7H55CCXY_5_GGACTACT-GGACTACT.bam -o 5_GGACTACT-GGACTACT.sort.bam

samtools sort -n gerald_H7H55CCXY_6_GGACTACT-GGACTACT.bam -o 6_GGACTACT-GGACTACT.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GGACTACT-GGACTACT.bam -o 7_GGACTACT-GGACTACT.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GGACTACT-GGACTACT.bam -o 8_GGACTACT-GGACTACT.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GGACTACT-GGACTACT.bam -o 1_GGACTACT-GGACTACT.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GGACTACT-GGACTACT.bam -o 2_GGACTACT-GGACTACT.sort.bam
samtools sort -n gerald_H7H55CCXY_5_CGCTACAT-CGCTACAT.bam -o 5_CGCTACAT-CGCTACAT.sort.bam
samtools sort -n gerald_H7H55CCXY_6_CGCTACAT-CGCTACAT.bam -o 6_CGCTACAT-CGCTACAT.sort.bam
samtools sort -n gerald_H7H55CCXY_7_CGCTACAT-CGCTACAT.bam -o 7_CGCTACAT-CGCTACAT.sort.bam
samtools sort -n gerald_H7H55CCXY_8_CGCTACAT-CGCTACAT.bam -o 8_CGCTACAT-CGCTACAT.sort.bam
samtools sort -n gerald_H72N2CCXY_1_CGCTACAT-CGCTACAT.bam -o 1_CGCTACAT-CGCTACAT.sort.bam
samtools sort -n gerald_H72N2CCXY_2_CGCTACAT-CGCTACAT.bam -o 2_CGCTACAT-CGCTACAT.sort.bam
samtools sort -n gerald_H7H55CCXY_5_TTGGTGCA-TTGGTGCA.bam -o 5_TTGGTGCA-TTGGTGCA.sort.bam
samtools sort -n gerald_H7H55CCXY_6_TTGGTGCA-TTGGTGCA.bam -o 6_TTGGTGCA-TTGGTGCA.sort.bam
samtools sort -n gerald_H7H55CCXY_7_TTGGTGCA-TTGGTGCA.bam -o 7_TTGGTGCA-TTGGTGCA.sort.bam
samtools sort -n gerald_H7H55CCXY_8_TTGGTGCA-TTGGTGCA.bam -o 8_TTGGTGCA-TTGGTGCA.sort.bam
samtools sort -n gerald_H72N2CCXY_1_TTGGTGCA-TTGGTGCA.bam -o 1_TTGGTGCA-TTGGTGCA.sort.bam
samtools sort -n gerald_H72N2CCXY_2_TTGGTGCA-TTGGTGCA.bam -o 2_TTGGTGCA-TTGGTGCA.sort.bam
samtools sort -n gerald_H7H55CCXY_5_TCGCTATC-TCGCTATC.bam -o 5_TCGCTATC-TCGCTATC.sort.bam
samtools sort -n gerald_H7H55CCXY_6_TCGCTATC-TCGCTATC.bam -o 6_TCGCTATC-TCGCTATC.sort.bam
samtools sort -n gerald_H7H55CCXY_7_TCGCTATC-TCGCTATC.bam -o 7_TCGCTATC-TCGCTATC.sort.bam
samtools sort -n gerald_H7H55CCXY_8_TCGCTATC-TCGCTATC.bam -o 8_TCGCTATC-TCGCTATC.sort.bam
samtools sort -n gerald_H72N2CCXY_1_TCGCTATC-TCGCTATC.bam -o 1_TCGCTATC-TCGCTATC.sort.bam
samtools sort -n gerald_H72N2CCXY_2_TCGCTATC-TCGCTATC.bam -o 2_TCGCTATC-TCGCTATC.sort.bam
samtools sort -n gerald_H7H55CCXY_5_AGATACGG-AGATACGG.bam -o 5_AGATACGG-AGATACGG.sort.bam
samtools sort -n gerald_H7H55CCXY_6_AGATACGG-AGATACGG.bam -o 6_AGATACGG-AGATACGG.sort.bam
samtools sort -n gerald_H7H55CCXY_7_AGATACGG-AGATACGG.bam -o 7_AGATACGG-AGATACGG.sort.bam
samtools sort -n gerald_H7H55CCXY_8_AGATACGG-AGATACGG.bam -o 8_AGATACGG-AGATACGG.sort.bam
samtools sort -n gerald_H72N2CCXY_1_AGATACGG-AGATACGG.bam -o 1_AGATACGG-AGATACGG.sort.bam
samtools sort -n gerald_H72N2CCXY_2_AGATACGG-AGATACGG.bam -o 2_AGATACGG-AGATACGG.sort.bam
samtools sort -n gerald_H7H55CCXY_5_CAAGGTAC-CAAGGTAC.bam -o 5_CAAGGTAC-CAAGGTAC.sort.bam
samtools sort -n gerald_H7H55CCXY_6_CAAGGTAC-CAAGGTAC.bam -o 6_CAAGGTAC-CAAGGTAC.sort.bam
samtools sort -n gerald_H7H55CCXY_7_CAAGGTAC-CAAGGTAC.bam -o 7_CAAGGTAC-CAAGGTAC.sort.bam
samtools sort -n gerald_H7H55CCXY_8_CAAGGTAC-CAAGGTAC.bam -o 8_CAAGGTAC-CAAGGTAC.sort.bam
samtools sort -n gerald_H72N2CCXY_1_CAAGGTAC-CAAGGTAC.bam -o 1_CAAGGTAC-CAAGGTAC.sort.bam
samtools sort -n gerald_H72N2CCXY_2_CAAGGTAC-CAAGGTAC.bam -o 2_CAAGGTAC-CAAGGTAC.sort.bam
samtools sort -n gerald_H7H55CCXY_5_GTCCTGTT-GTCCTGTT.bam -o 5_GTCCTGTT-GTCCTGTT.sort.bam
samtools sort -n gerald_H7H55CCXY_6_GTCCTGTT-GTCCTGTT.bam -o 6_GTCCTGTT-GTCCTGTT.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GTCCTGTT-GTCCTGTT.bam -o 7_GTCCTGTT-GTCCTGTT.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GTCCTGTT-GTCCTGTT.bam -o 8_GTCCTGTT-GTCCTGTT.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GTCCTGTT-GTCCTGTT.bam -o 1_GTCCTGTT-GTCCTGTT.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GTCCTGTT-GTCCTGTT.bam -o 2_GTCCTGTT-GTCCTGTT.sort.bam
samtools sort -n gerald_H7H55CCXY_5_GAGAGTAC-GAGAGTAC.bam -o 5_GAGAGTAC-GAGAGTAC.sort.bam
samtools sort -n gerald_H7H55CCXY_6_GAGAGTAC-GAGAGTAC.bam -o 6_GAGAGTAC-GAGAGTAC.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GAGAGTAC-GAGAGTAC.bam -o 7_GAGAGTAC-GAGAGTAC.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GAGAGTAC-GAGAGTAC.bam -o 8_GAGAGTAC-GAGAGTAC.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GAGAGTAC-GAGAGTAC.bam -o 1_GAGAGTAC-GAGAGTAC.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GAGAGTAC-GAGAGTAC.bam -o 2_GAGAGTAC-GAGAGTAC.sort.bam
samtools sort -n gerald_H7H55CCXY_8_ACCGGTTA-ACCGGTTA.bam -o 8_ACCGGTTA-ACCGGTTA.sort.bam
samtools sort -n gerald_H7H55CCXY_5_ACCGGTTA-ACCGGTTA.bam -o 5_ACCGGTTA-ACCGGTTA.sort.bam
samtools sort -n gerald_H7H55CCXY_7_ACCGGTTA-ACCGGTTA.bam -o 7_ACCGGTTA-ACCGGTTA.sort.bam
samtools sort -n gerald_H72N2CCXY_1_ACCGGTTA-ACCGGTTA.bam -o 1_ACCGGTTA-ACCGGTTA.sort.bam
samtools sort -n gerald_H72N2CCXY_2_ACCGGTTA-ACCGGTTA.bam -o 2_ACCGGTTA-ACCGGTTA.sort.bam
samtools sort -n gerald_H7H55CCXY_6_ACCGGTTA-ACCGGTTA.bam -o 6_ACCGGTTA-ACCGGTTA.sort.bam
samtools sort -n gerald_H7H55CCXY_7_CTAGCTCA-CTAGCTCA.bam -o 7_CTAGCTCA-CTAGCTCA.sort.bam
samtools sort -n gerald_H7H55CCXY_5_CTAGCTCA-CTAGCTCA.bam -o 5_CTAGCTCA-CTAGCTCA.sort.bam
samtools sort -n gerald_H72N2CCXY_2_CTAGCTCA-CTAGCTCA.bam -o 2_CTAGCTCA-CTAGCTCA.sort.bam
samtools sort -n gerald_H72N2CCXY_1_CTAGCTCA-CTAGCTCA.bam -o 1_CTAGCTCA-CTAGCTCA.sort.bam
samtools sort -n gerald_H7H55CCXY_6_CTAGCTCA-CTAGCTCA.bam -o 6_CTAGCTCA-CTAGCTCA.sort.bam
samtools sort -n gerald_H7H55CCXY_8_CTAGCTCA-CTAGCTCA.bam -o 8_CTAGCTCA-CTAGCTCA.sort.bam
samtools sort -n gerald_H72N2CCXY_1_AATTCCGG-AATTCCGG.bam -o 1_AATTCCGG-AATTCCGG.sort.bam
samtools sort -n gerald_H7H55CCXY_7_AATTCCGG-AATTCCGG.bam -o 7_AATTCCGG-AATTCCGG.sort.bam
samtools sort -n gerald_H7H55CCXY_8_AATTCCGG-AATTCCGG.bam -o 8_AATTCCGG-AATTCCGG.sort.bam
samtools sort -n gerald_H7H55CCXY_5_AATTCCGG-AATTCCGG.bam -o 5_AATTCCGG-AATTCCGG.sort.bam
samtools sort -n gerald_H72N2CCXY_2_AATTCCGG-AATTCCGG.bam -o 2_AATTCCGG-AATTCCGG.sort.bam
samtools sort -n gerald_H7H55CCXY_6_AATTCCGG-AATTCCGG.bam -o 6_AATTCCGG-AATTCCGG.sort.bam
samtools sort -n gerald_H7H55CCXY_6_GGTACGAA-GGTACGAA.bam -o 6_GGTACGAA-GGTACGAA.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GGTACGAA-GGTACGAA.bam -o 2_GGTACGAA-GGTACGAA.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GGTACGAA-GGTACGAA.bam -o 1_GGTACGAA-GGTACGAA.sort.bam
samtools sort -n gerald_H7H55CCXY_5_GGTACGAA-GGTACGAA.bam -o 5_GGTACGAA-GGTACGAA.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GGTACGAA-GGTACGAA.bam -o 8_GGTACGAA-GGTACGAA.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GGTACGAA-GGTACGAA.bam -o 7_GGTACGAA-GGTACGAA.sort.bam
samtools sort -n gerald_H7H55CCXY_7_CACGTCTA-CACGTCTA.bam -o 7_CACGTCTA-CACGTCTA.sort.bam
samtools sort -n gerald_H7H55CCXY_6_CACGTCTA-CACGTCTA.bam -o 6_CACGTCTA-CACGTCTA.sort.bam
samtools sort -n gerald_H72N2CCXY_2_CACGTCTA-CACGTCTA.bam -o 2_CACGTCTA-CACGTCTA.sort.bam
samtools sort -n gerald_H7H55CCXY_5_CACGTCTA-CACGTCTA.bam -o 5_CACGTCTA-CACGTCTA.sort.bam
samtools sort -n gerald_H72N2CCXY_1_CACGTCTA-CACGTCTA.bam -o 1_CACGTCTA-CACGTCTA.sort.bam
samtools sort -n gerald_H7H55CCXY_8_CACGTCTA-CACGTCTA.bam -o 8_CACGTCTA-CACGTCTA.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GATACCTG-GATACCTG.bam -o 2_GATACCTG-GATACCTG.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GATACCTG-GATACCTG.bam -o 1_GATACCTG-GATACCTG.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GATACCTG-GATACCTG.bam -o 8_GATACCTG-GATACCTG.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GATACCTG-GATACCTG.bam -o 7_GATACCTG-GATACCTG.sort.bam
samtools sort -n gerald_H7H55CCXY_5_GATACCTG-GATACCTG.bam -o 5_GATACCTG-GATACCTG.sort.bam
samtools sort -n gerald_H7H55CCXY_6_GATACCTG-GATACCTG.bam -o 6_GATACCTG-GATACCTG.sort.bam
samtools sort -n gerald_H72N2CCXY_2_AGCGAGAT-AGCGAGAT.bam -o 2_AGCGAGAT-AGCGAGAT.sort.bam
samtools sort -n gerald_H7H55CCXY_8_AGCGAGAT-AGCGAGAT.bam -o 8_AGCGAGAT-AGCGAGAT.sort.bam
samtools sort -n gerald_H7H55CCXY_7_AGCGAGAT-AGCGAGAT.bam -o 7_AGCGAGAT-AGCGAGAT.sort.bam
samtools sort -n gerald_H72N2CCXY_1_AGCGAGAT-AGCGAGAT.bam -o 1_AGCGAGAT-AGCGAGAT.sort.bam
samtools sort -n gerald_H7H55CCXY_6_AGCGAGAT-AGCGAGAT.bam -o 6_AGCGAGAT-AGCGAGAT.sort.bam
samtools sort -n gerald_H7H55CCXY_5_AGCGAGAT-AGCGAGAT.bam -o 5_AGCGAGAT-AGCGAGAT.sort.bam
samtools sort -n gerald_H72N2CCXY_1_TGCCTCAA-TGCCTCAA.bam -o 1_TGCCTCAA-TGCCTCAA.sort.bam
samtools sort -n gerald_H7H55CCXY_5_TGCCTCAA-TGCCTCAA.bam -o 5_TGCCTCAA-TGCCTCAA.sort.bam
samtools sort -n gerald_H7H55CCXY_6_TGCCTCAA-TGCCTCAA.bam -o 6_TGCCTCAA-TGCCTCAA.sort.bam
samtools sort -n gerald_H7H55CCXY_8_TGCCTCAA-TGCCTCAA.bam -o 8_TGCCTCAA-TGCCTCAA.sort.bam
samtools sort -n gerald_H72N2CCXY_2_TGCCTCAA-TGCCTCAA.bam -o 2_TGCCTCAA-TGCCTCAA.sort.bam
samtools sort -n gerald_H7H55CCXY_7_TGCCTCAA-TGCCTCAA.bam -o 7_TGCCTCAA-TGCCTCAA.sort.bam
samtools sort -n gerald_H72N2CCXY_1_TCTAGGAG-TCTAGGAG.bam -o 1_TCTAGGAG-TCTAGGAG.sort.bam
samtools sort -n gerald_H7H55CCXY_5_TCTAGGAG-TCTAGGAG.bam -o 5_TCTAGGAG-TCTAGGAG.sort.bam
samtools sort -n gerald_H7H55CCXY_6_TCTAGGAG-TCTAGGAG.bam -o 6_TCTAGGAG-TCTAGGAG.sort.bam
samtools sort -n gerald_H72N2CCXY_2_TCTAGGAG-TCTAGGAG.bam -o 2_TCTAGGAG-TCTAGGAG.sort.bam
samtools sort -n gerald_H7H55CCXY_8_TCTAGGAG-TCTAGGAG.bam -o 8_TCTAGGAG-TCTAGGAG.sort.bam
samtools sort -n gerald_H7H55CCXY_7_TCTAGGAG-TCTAGGAG.bam -o 7_TCTAGGAG-TCTAGGAG.sort.bam
samtools sort -n gerald_H7H55CCXY_5_ACATGGAG-ACATGGAG.bam -o 5_ACATGGAG-ACATGGAG.sort.bam
samtools sort -n gerald_H7H55CCXY_6_ACATGGAG-ACATGGAG.bam -o 6_ACATGGAG-ACATGGAG.sort.bam
samtools sort -n gerald_H72N2CCXY_1_ACATGGAG-ACATGGAG.bam -o 1_ACATGGAG-ACATGGAG.sort.bam
samtools sort -n gerald_H7H55CCXY_7_ACATGGAG-ACATGGAG.bam -o 7_ACATGGAG-ACATGGAG.sort.bam
samtools sort -n gerald_H7H55CCXY_8_ACATGGAG-ACATGGAG.bam -o 8_ACATGGAG-ACATGGAG.sort.bam
samtools sort -n gerald_H72N2CCXY_2_ACATGGAG-ACATGGAG.bam -o 2_ACATGGAG-ACATGGAG.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GAGCTCTA-GAGCTCTA.bam -o 2_GAGCTCTA-GAGCTCTA.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GAGCTCTA-GAGCTCTA.bam -o 8_GAGCTCTA-GAGCTCTA.sort.bam
samtools sort -n gerald_H7H55CCXY_6_GAGCTCTA-GAGCTCTA.bam -o 6_GAGCTCTA-GAGCTCTA.sort.bam
samtools sort -n gerald_H7H55CCXY_5_GAGCTCTA-GAGCTCTA.bam -o 5_GAGCTCTA-GAGCTCTA.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GAGCTCTA-GAGCTCTA.bam -o 7_GAGCTCTA-GAGCTCTA.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GAGCTCTA-GAGCTCTA.bam -o 1_GAGCTCTA-GAGCTCTA.sort.bam
samtools sort -n gerald_H72N2CCXY_2_AGATCGTC-AGATCGTC.bam -o 2_AGATCGTC-AGATCGTC.sort.bam
samtools sort -n gerald_H7H55CCXY_6_AGATCGTC-AGATCGTC.bam -o 6_AGATCGTC-AGATCGTC.sort.bam
samtools sort -n gerald_H7H55CCXY_5_AGATCGTC-AGATCGTC.bam -o 5_AGATCGTC-AGATCGTC.sort.bam
samtools sort -n gerald_H72N2CCXY_1_AGATCGTC-AGATCGTC.bam -o 1_AGATCGTC-AGATCGTC.sort.bam
samtools sort -n gerald_H7H55CCXY_7_AGATCGTC-AGATCGTC.bam -o 7_AGATCGTC-AGATCGTC.sort.bam
samtools sort -n gerald_H7H55CCXY_8_AGATCGTC-AGATCGTC.bam -o 8_AGATCGTC-AGATCGTC.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GGCATTCT-GGCATTCT.bam -o 7_GGCATTCT-GGCATTCT.sort.bam
samtools sort -n gerald_H7H55CCXY_5_GGCATTCT-GGCATTCT.bam -o 5_GGCATTCT-GGCATTCT.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GGCATTCT-GGCATTCT.bam -o 2_GGCATTCT-GGCATTCT.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GGCATTCT-GGCATTCT.bam -o 8_GGCATTCT-GGCATTCT.sort.bam
samtools sort -n gerald_H7H55CCXY_6_GGCATTCT-GGCATTCT.bam -o 6_GGCATTCT-GGCATTCT.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GGCATTCT-GGCATTCT.bam -o 1_GGCATTCT-GGCATTCT.sort.bam
samtools sort -n gerald_H72N2CCXY_5_GAGCAATC-GAGCAATC.bam -o 5_GAGCAATC-GAGCAATC.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GAGCAATC-GAGCAATC.bam -o 1_GAGCAATC-GAGCAATC.sort.bam
samtools sort -n gerald_H7H55CCXY_6_GAGCAATC-GAGCAATC.bam -o 6_GAGCAATC-GAGCAATC.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GAGCAATC-GAGCAATC.bam -o 2_GAGCAATC-GAGCAATC.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GAGCAATC-GAGCAATC.bam -o 7_GAGCAATC-GAGCAATC.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GAGCAATC-GAGCAATC.bam -o 8_GAGCAATC-GAGCAATC.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GGTAACGT-GGTAACGT.bam -o 2_GGTAACGT-GGTAACGT.sort.bam
samtools sort -n gerald_H7H55CCXY_5_GGTAACGT-GGTAACGT.bam -o 5_GGTAACGT-GGTAACGT.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GGTAACGT-GGTAACGT.bam -o 8_GGTAACGT-GGTAACGT.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GGTAACGT-GGTAACGT.bam -o 1_GGTAACGT-GGTAACGT.sort.bam
samtools sort -n gerald_H7H55CCXY_6_GGTAACGT-GGTAACGT.bam -o 6_GGTAACGT-GGTAACGT.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GGTAACGT-GGTAACGT.bam -o 7_GGTAACGT-GGTAACGT.sort.bam
samtools sort -n gerald_H72N2CCXY_2_GTCCTTGA-GTCCTTGA.bam -o 2_GTCCTTGA-GTCCTTGA.sort.bam
samtools sort -n gerald_H7H55CCXY_8_GTCCTTGA-GTCCTTGA.bam -o 8_GTCCTTGA-GTCCTTGA.sort.bam
samtools sort -n gerald_H7H55CCXY_6_GTCCTTGA-GTCCTTGA.bam -o 6_GTCCTTGA-GTCCTTGA.sort.bam
samtools sort -n gerald_H7H55CCXY_5_GTCCTTGA-GTCCTTGA.bam -o 5_GTCCTTGA-GTCCTTGA.sort.bam
samtools sort -n gerald_H72N2CCXY_1_GTCCTTGA-GTCCTTGA.bam -o 1_GTCCTTGA-GTCCTTGA.sort.bam
samtools sort -n gerald_H7H55CCXY_7_GTCCTTGA-GTCCTTGA.bam -o 7_GTCCTTGA-GTCCTTGA.sort.bam


# actual extraction from .bam to .fq
# keep r1 and r2 in separate files
# syntax is bamtofastq -i *.bam -fq *.r1.fq -fq2 *.r2.fq

bedtools bamtofastq -i 5_GGACTACT-GGACTACT.sort.bam -fq 5_GGACTACT-GGACTACT.r1.fq -fq2 5_GGACTACT-GGACTACT.r2.fq

bedtools bamtofastq -i 6_GGACTACT-GGACTACT.sort.bam -fq 6_GGACTACT-GGACTACT.r1.fq -fq2 6_GGACTACT-GGACTACT.r2.fq
bedtools bamtofastq -i 7_GGACTACT-GGACTACT.sort.bam -fq 7_GGACTACT-GGACTACT.r1.fq -fq2 7_GGACTACT-GGACTACT.r2.fq
bedtools bamtofastq -i 8_GGACTACT-GGACTACT.sort.bam -fq 8_GGACTACT-GGACTACT.r1.fq -fq2 8_GGACTACT-GGACTACT.r2.fq
bedtools bamtofastq -i 1_GGACTACT-GGACTACT.sort.bam -fq 1_GGACTACT-GGACTACT.r1.fq -fq2 1_GGACTACT-GGACTACT.r2.fq
bedtools bamtofastq -i 2_GGACTACT-GGACTACT.sort.bam -fq 2_GGACTACT-GGACTACT.r1.fq -fq2 2_GGACTACT-GGACTACT.r2.fq
bedtools bamtofastq -i 5_CGCTACAT-CGCTACAT.sort.bam -fq 5_CGCTACAT-CGCTACAT.r1.fq -fq2 5_CGCTACAT-CGCTACAT.r2.fq
bedtools bamtofastq -i 6_CGCTACAT-CGCTACAT.sort.bam -fq 6_CGCTACAT-CGCTACAT.r1.fq -fq2 6_CGCTACAT-CGCTACAT.r2.fq
bedtools bamtofastq -i 7_CGCTACAT-CGCTACAT.sort.bam -fq 7_CGCTACAT-CGCTACAT.r1.fq -fq2 7_CGCTACAT-CGCTACAT.r2.fq
bedtools bamtofastq -i 8_CGCTACAT-CGCTACAT.sort.bam -fq 8_CGCTACAT-CGCTACAT.r1.fq -fq2 8_CGCTACAT-CGCTACAT.r2.fq
bedtools bamtofastq -i 1_CGCTACAT-CGCTACAT.sort.bam -fq 1_CGCTACAT-CGCTACAT.r1.fq -fq2 1_CGCTACAT-CGCTACAT.r2.fq
bedtools bamtofastq -i 2_CGCTACAT-CGCTACAT.sort.bam -fq 2_CGCTACAT-CGCTACAT.r1.fq -fq2 2_CGCTACAT-CGCTACAT.r2.fq
bedtools bamtofastq -i 5_TTGGTGCA-TTGGTGCA.sort.bam -fq 5_TTGGTGCA-TTGGTGCA.r1.fq -fq2 5_TTGGTGCA-TTGGTGCA.r2.fq
bedtools bamtofastq -i 6_TTGGTGCA-TTGGTGCA.sort.bam -fq 6_TTGGTGCA-TTGGTGCA.r1.fq -fq2 6_TTGGTGCA-TTGGTGCA.r2.fq
bedtools bamtofastq -i 7_TTGGTGCA-TTGGTGCA.sort.bam -fq 7_TTGGTGCA-TTGGTGCA.r1.fq -fq2 7_TTGGTGCA-TTGGTGCA.r2.fq
bedtools bamtofastq -i 8_TTGGTGCA-TTGGTGCA.sort.bam -fq 8_TTGGTGCA-TTGGTGCA.r1.fq -fq2 8_TTGGTGCA-TTGGTGCA.r2.fq
bedtools bamtofastq -i 1_TTGGTGCA-TTGGTGCA.sort.bam -fq 1_TTGGTGCA-TTGGTGCA.r1.fq -fq2 1_TTGGTGCA-TTGGTGCA.r2.fq
bedtools bamtofastq -i 2_TTGGTGCA-TTGGTGCA.sort.bam -fq 2_TTGGTGCA-TTGGTGCA.r1.fq -fq2 2_TTGGTGCA-TTGGTGCA.r2.fq
bedtools bamtofastq -i 5_TCGCTATC-TCGCTATC.sort.bam -fq 5_TCGCTATC-TCGCTATC.r1.fq -fq2 5_TCGCTATC-TCGCTATC.r2.fq
bedtools bamtofastq -i 6_TCGCTATC-TCGCTATC.sort.bam -fq 6_TCGCTATC-TCGCTATC.r1.fq -fq2 6_TCGCTATC-TCGCTATC.r2.fq
bedtools bamtofastq -i 7_TCGCTATC-TCGCTATC.sort.bam -fq 7_TCGCTATC-TCGCTATC.r1.fq -fq2 7_TCGCTATC-TCGCTATC.r2.fq
bedtools bamtofastq -i 8_TCGCTATC-TCGCTATC.sort.bam -fq 8_TCGCTATC-TCGCTATC.r1.fq -fq2 8_TCGCTATC-TCGCTATC.r2.fq
bedtools bamtofastq -i 1_TCGCTATC-TCGCTATC.sort.bam -fq 1_TCGCTATC-TCGCTATC.r1.fq -fq2 1_TCGCTATC-TCGCTATC.r2.fq
bedtools bamtofastq -i 2_TCGCTATC-TCGCTATC.sort.bam -fq 2_TCGCTATC-TCGCTATC.r1.fq -fq2 2_TCGCTATC-TCGCTATC.r2.fq
bedtools bamtofastq -i 5_AGATACGG-AGATACGG.sort.bam -fq 5_AGATACGG-AGATACGG.r1.fq -fq2 5_AGATACGG-AGATACGG.r2.fq
bedtools bamtofastq -i 6_AGATACGG-AGATACGG.sort.bam -fq 6_AGATACGG-AGATACGG.r1.fq -fq2 6_AGATACGG-AGATACGG.r2.fq
bedtools bamtofastq -i 7_AGATACGG-AGATACGG.sort.bam -fq 7_AGATACGG-AGATACGG.r1.fq -fq2 7_AGATACGG-AGATACGG.r2.fq
bedtools bamtofastq -i 8_AGATACGG-AGATACGG.sort.bam -fq 8_AGATACGG-AGATACGG.r1.fq -fq2 8_AGATACGG-AGATACGG.r2.fq
bedtools bamtofastq -i 1_AGATACGG-AGATACGG.sort.bam -fq 1_AGATACGG-AGATACGG.r1.fq -fq2 1_AGATACGG-AGATACGG.r2.fq
bedtools bamtofastq -i 2_AGATACGG-AGATACGG.sort.bam -fq 2_AGATACGG-AGATACGG.r1.fq -fq2 2_AGATACGG-AGATACGG.r2.fq
bedtools bamtofastq -i 5_CAAGGTAC-CAAGGTAC.sort.bam -fq 5_CAAGGTAC-CAAGGTAC.r1.fq -fq2 5_CAAGGTAC-CAAGGTAC.r2.fq
bedtools bamtofastq -i 6_CAAGGTAC-CAAGGTAC.sort.bam -fq 6_CAAGGTAC-CAAGGTAC.r1.fq -fq2 6_CAAGGTAC-CAAGGTAC.r2.fq
bedtools bamtofastq -i 7_CAAGGTAC-CAAGGTAC.sort.bam -fq 7_CAAGGTAC-CAAGGTAC.r1.fq -fq2 7_CAAGGTAC-CAAGGTAC.r2.fq
bedtools bamtofastq -i 8_CAAGGTAC-CAAGGTAC.sort.bam -fq 8_CAAGGTAC-CAAGGTAC.r1.fq -fq2 8_CAAGGTAC-CAAGGTAC.r2.fq
bedtools bamtofastq -i 1_CAAGGTAC-CAAGGTAC.sort.bam -fq 1_CAAGGTAC-CAAGGTAC.r1.fq -fq2 1_CAAGGTAC-CAAGGTAC.r2.fq
bedtools bamtofastq -i 2_CAAGGTAC-CAAGGTAC.sort.bam -fq 2_CAAGGTAC-CAAGGTAC.r1.fq -fq2 2_CAAGGTAC-CAAGGTAC.r2.fq
bedtools bamtofastq -i 5_GTCCTGTT-GTCCTGTT.sort.bam -fq 5_GTCCTGTT-GTCCTGTT.r1.fq -fq2 5_GTCCTGTT-GTCCTGTT.r2.fq
bedtools bamtofastq -i 6_GTCCTGTT-GTCCTGTT.sort.bam -fq 6_GTCCTGTT-GTCCTGTT.r1.fq -fq2 6_GTCCTGTT-GTCCTGTT.r2.fq
bedtools bamtofastq -i 7_GTCCTGTT-GTCCTGTT.sort.bam -fq 7_GTCCTGTT-GTCCTGTT.r1.fq -fq2 7_GTCCTGTT-GTCCTGTT.r2.fq
bedtools bamtofastq -i 8_GTCCTGTT-GTCCTGTT.sort.bam -fq 8_GTCCTGTT-GTCCTGTT.r1.fq -fq2 8_GTCCTGTT-GTCCTGTT.r2.fq
bedtools bamtofastq -i 1_GTCCTGTT-GTCCTGTT.sort.bam -fq 1_GTCCTGTT-GTCCTGTT.r1.fq -fq2 1_GTCCTGTT-GTCCTGTT.r2.fq
bedtools bamtofastq -i 2_GTCCTGTT-GTCCTGTT.sort.bam -fq 2_GTCCTGTT-GTCCTGTT.r1.fq -fq2 2_GTCCTGTT-GTCCTGTT.r2.fq
bedtools bamtofastq -i 5_GAGAGTAC-GAGAGTAC.sort.bam -fq 5_GAGAGTAC-GAGAGTAC.r1.fq -fq2 5_GAGAGTAC-GAGAGTAC.r2.fq
bedtools bamtofastq -i 6_GAGAGTAC-GAGAGTAC.sort.bam -fq 6_GAGAGTAC-GAGAGTAC.r1.fq -fq2 6_GAGAGTAC-GAGAGTAC.r2.fq
bedtools bamtofastq -i 7_GAGAGTAC-GAGAGTAC.sort.bam -fq 7_GAGAGTAC-GAGAGTAC.r1.fq -fq2 7_GAGAGTAC-GAGAGTAC.r2.fq
bedtools bamtofastq -i 8_GAGAGTAC-GAGAGTAC.sort.bam -fq 8_GAGAGTAC-GAGAGTAC.r1.fq -fq2 8_GAGAGTAC-GAGAGTAC.r2.fq
bedtools bamtofastq -i 1_GAGAGTAC-GAGAGTAC.sort.bam -fq 1_GAGAGTAC-GAGAGTAC.r1.fq -fq2 1_GAGAGTAC-GAGAGTAC.r2.fq
bedtools bamtofastq -i 2_GAGAGTAC-GAGAGTAC.sort.bam -fq 2_GAGAGTAC-GAGAGTAC.r1.fq -fq2 2_GAGAGTAC-GAGAGTAC.r2.fq
bedtools bamtofastq -i 8_ACCGGTTA-ACCGGTTA.sort.bam -fq 8_ACCGGTTA-ACCGGTTA.r1.fq -fq2 8_ACCGGTTA-ACCGGTTA.r2.fq
bedtools bamtofastq -i 5_ACCGGTTA-ACCGGTTA.sort.bam -fq 5_ACCGGTTA-ACCGGTTA.r1.fq -fq2 5_ACCGGTTA-ACCGGTTA.r2.fq
bedtools bamtofastq -i 7_ACCGGTTA-ACCGGTTA.sort.bam -fq 7_ACCGGTTA-ACCGGTTA.r1.fq -fq2 7_ACCGGTTA-ACCGGTTA.r2.fq
bedtools bamtofastq -i 1_ACCGGTTA-ACCGGTTA.sort.bam -fq 1_ACCGGTTA-ACCGGTTA.r1.fq -fq2 1_ACCGGTTA-ACCGGTTA.r2.fq
bedtools bamtofastq -i 2_ACCGGTTA-ACCGGTTA.sort.bam -fq 2_ACCGGTTA-ACCGGTTA.r1.fq -fq2 2_ACCGGTTA-ACCGGTTA.r2.fq
bedtools bamtofastq -i 6_ACCGGTTA-ACCGGTTA.sort.bam -fq 6_ACCGGTTA-ACCGGTTA.r1.fq -fq2 6_ACCGGTTA-ACCGGTTA.r2.fq
bedtools bamtofastq -i 7_CTAGCTCA-CTAGCTCA.sort.bam -fq 7_CTAGCTCA-CTAGCTCA.r1.fq -fq2 7_CTAGCTCA-CTAGCTCA.r2.fq
bedtools bamtofastq -i 5_CTAGCTCA-CTAGCTCA.sort.bam -fq 5_CTAGCTCA-CTAGCTCA.r1.fq -fq2 5_CTAGCTCA-CTAGCTCA.r2.fq
bedtools bamtofastq -i 2_CTAGCTCA-CTAGCTCA.sort.bam -fq 2_CTAGCTCA-CTAGCTCA.r1.fq -fq2 2_CTAGCTCA-CTAGCTCA.r2.fq
bedtools bamtofastq -i 1_CTAGCTCA-CTAGCTCA.sort.bam -fq 1_CTAGCTCA-CTAGCTCA.r1.fq -fq2 1_CTAGCTCA-CTAGCTCA.r2.fq
bedtools bamtofastq -i 6_CTAGCTCA-CTAGCTCA.sort.bam -fq 6_CTAGCTCA-CTAGCTCA.r1.fq -fq2 6_CTAGCTCA-CTAGCTCA.r2.fq
bedtools bamtofastq -i 8_CTAGCTCA-CTAGCTCA.sort.bam -fq 8_CTAGCTCA-CTAGCTCA.r1.fq -fq2 8_CTAGCTCA-CTAGCTCA.r2.fq
bedtools bamtofastq -i 1_AATTCCGG-AATTCCGG.sort.bam -fq 1_AATTCCGG-AATTCCGG.r1.fq -fq2 1_AATTCCGG-AATTCCGG.r2.fq
bedtools bamtofastq -i 7_AATTCCGG-AATTCCGG.sort.bam -fq 7_AATTCCGG-AATTCCGG.r1.fq -fq2 7_AATTCCGG-AATTCCGG.r2.fq
bedtools bamtofastq -i 8_AATTCCGG-AATTCCGG.sort.bam -fq 8_AATTCCGG-AATTCCGG.r1.fq -fq2 8_AATTCCGG-AATTCCGG.r2.fq
bedtools bamtofastq -i 5_AATTCCGG-AATTCCGG.sort.bam -fq 5_AATTCCGG-AATTCCGG.r1.fq -fq2 5_AATTCCGG-AATTCCGG.r2.fq
bedtools bamtofastq -i 2_AATTCCGG-AATTCCGG.sort.bam -fq 2_AATTCCGG-AATTCCGG.r1.fq -fq2 2_AATTCCGG-AATTCCGG.r2.fq
bedtools bamtofastq -i 6_AATTCCGG-AATTCCGG.sort.bam -fq 6_AATTCCGG-AATTCCGG.r1.fq -fq2 6_AATTCCGG-AATTCCGG.r2.fq
bedtools bamtofastq -i 6_GGTACGAA-GGTACGAA.sort.bam -fq 6_GGTACGAA-GGTACGAA.r1.fq -fq2 6_GGTACGAA-GGTACGAA.r2.fq
bedtools bamtofastq -i 2_GGTACGAA-GGTACGAA.sort.bam -fq 2_GGTACGAA-GGTACGAA.r1.fq -fq2 2_GGTACGAA-GGTACGAA.r2.fq
bedtools bamtofastq -i 1_GGTACGAA-GGTACGAA.sort.bam -fq 1_GGTACGAA-GGTACGAA.r1.fq -fq2 1_GGTACGAA-GGTACGAA.r2.fq
bedtools bamtofastq -i 5_GGTACGAA-GGTACGAA.sort.bam -fq 5_GGTACGAA-GGTACGAA.r1.fq -fq2 5_GGTACGAA-GGTACGAA.r2.fq
bedtools bamtofastq -i 8_GGTACGAA-GGTACGAA.sort.bam -fq 8_GGTACGAA-GGTACGAA.r1.fq -fq2 8_GGTACGAA-GGTACGAA.r2.fq
bedtools bamtofastq -i 7_GGTACGAA-GGTACGAA.sort.bam -fq 7_GGTACGAA-GGTACGAA.r1.fq -fq2 7_GGTACGAA-GGTACGAA.r2.fq
bedtools bamtofastq -i 7_CACGTCTA-CACGTCTA.sort.bam -fq 7_CACGTCTA-CACGTCTA.r1.fq -fq2 7_CACGTCTA-CACGTCTA.r2.fq
bedtools bamtofastq -i 6_CACGTCTA-CACGTCTA.sort.bam -fq 6_CACGTCTA-CACGTCTA.r1.fq -fq2 6_CACGTCTA-CACGTCTA.r2.fq
bedtools bamtofastq -i 2_CACGTCTA-CACGTCTA.sort.bam -fq 2_CACGTCTA-CACGTCTA.r1.fq -fq2 2_CACGTCTA-CACGTCTA.r2.fq
bedtools bamtofastq -i 5_CACGTCTA-CACGTCTA.sort.bam -fq 5_CACGTCTA-CACGTCTA.r1.fq -fq2 5_CACGTCTA-CACGTCTA.r2.fq
bedtools bamtofastq -i 1_CACGTCTA-CACGTCTA.sort.bam -fq 1_CACGTCTA-CACGTCTA.r1.fq -fq2 1_CACGTCTA-CACGTCTA.r2.fq
bedtools bamtofastq -i 8_CACGTCTA-CACGTCTA.sort.bam -fq 8_CACGTCTA-CACGTCTA.r1.fq -fq2 8_CACGTCTA-CACGTCTA.r2.fq
bedtools bamtofastq -i 2_GATACCTG-GATACCTG.sort.bam -fq 2_GATACCTG-GATACCTG.r1.fq -fq2 2_GATACCTG-GATACCTG.r2.fq
bedtools bamtofastq -i 1_GATACCTG-GATACCTG.sort.bam -fq 1_GATACCTG-GATACCTG.r1.fq -fq2 1_GATACCTG-GATACCTG.r2.fq
bedtools bamtofastq -i 8_GATACCTG-GATACCTG.sort.bam -fq 8_GATACCTG-GATACCTG.r1.fq -fq2 8_GATACCTG-GATACCTG.r2.fq
bedtools bamtofastq -i 7_GATACCTG-GATACCTG.sort.bam -fq 7_GATACCTG-GATACCTG.r1.fq -fq2 7_GATACCTG-GATACCTG.r2.fq
bedtools bamtofastq -i 5_GATACCTG-GATACCTG.sort.bam -fq 5_GATACCTG-GATACCTG.r1.fq -fq2 5_GATACCTG-GATACCTG.r2.fq
bedtools bamtofastq -i 6_GATACCTG-GATACCTG.sort.bam -fq 6_GATACCTG-GATACCTG.r1.fq -fq2 6_GATACCTG-GATACCTG.r2.fq
bedtools bamtofastq -i 2_AGCGAGAT-AGCGAGAT.sort.bam -fq 2_AGCGAGAT-AGCGAGAT.r1.fq -fq2 2_AGCGAGAT-AGCGAGAT.r2.fq
bedtools bamtofastq -i 8_AGCGAGAT-AGCGAGAT.sort.bam -fq 8_AGCGAGAT-AGCGAGAT.r1.fq -fq2 8_AGCGAGAT-AGCGAGAT.r2.fq
bedtools bamtofastq -i 7_AGCGAGAT-AGCGAGAT.sort.bam -fq 7_AGCGAGAT-AGCGAGAT.r1.fq -fq2 7_AGCGAGAT-AGCGAGAT.r2.fq
bedtools bamtofastq -i 1_AGCGAGAT-AGCGAGAT.sort.bam -fq 1_AGCGAGAT-AGCGAGAT.r1.fq -fq2 1_AGCGAGAT-AGCGAGAT.r2.fq
bedtools bamtofastq -i 6_AGCGAGAT-AGCGAGAT.sort.bam -fq 6_AGCGAGAT-AGCGAGAT.r1.fq -fq2 6_AGCGAGAT-AGCGAGAT.r2.fq
bedtools bamtofastq -i 5_AGCGAGAT-AGCGAGAT.sort.bam -fq 5_AGCGAGAT-AGCGAGAT.r1.fq -fq2 5_AGCGAGAT-AGCGAGAT.r2.fq
bedtools bamtofastq -i 1_TGCCTCAA-TGCCTCAA.sort.bam -fq 1_TGCCTCAA-TGCCTCAA.r1.fq -fq2 1_TGCCTCAA-TGCCTCAA.r2.fq
bedtools bamtofastq -i 5_TGCCTCAA-TGCCTCAA.sort.bam -fq 5_TGCCTCAA-TGCCTCAA.r1.fq -fq2 5_TGCCTCAA-TGCCTCAA.r2.fq
bedtools bamtofastq -i 6_TGCCTCAA-TGCCTCAA.sort.bam -fq 6_TGCCTCAA-TGCCTCAA.r1.fq -fq2 6_TGCCTCAA-TGCCTCAA.r2.fq
bedtools bamtofastq -i 8_TGCCTCAA-TGCCTCAA.sort.bam -fq 8_TGCCTCAA-TGCCTCAA.r1.fq -fq2 8_TGCCTCAA-TGCCTCAA.r2.fq
bedtools bamtofastq -i 2_TGCCTCAA-TGCCTCAA.sort.bam -fq 2_TGCCTCAA-TGCCTCAA.r1.fq -fq2 2_TGCCTCAA-TGCCTCAA.r2.fq
bedtools bamtofastq -i 7_TGCCTCAA-TGCCTCAA.sort.bam -fq 7_TGCCTCAA-TGCCTCAA.r1.fq -fq2 7_TGCCTCAA-TGCCTCAA.r2.fq
bedtools bamtofastq -i 1_TCTAGGAG-TCTAGGAG.sort.bam -fq 1_TCTAGGAG-TCTAGGAG.r1.fq -fq2 1_TCTAGGAG-TCTAGGAG.r2.fq
bedtools bamtofastq -i 5_TCTAGGAG-TCTAGGAG.sort.bam -fq 5_TCTAGGAG-TCTAGGAG.r1.fq -fq2 5_TCTAGGAG-TCTAGGAG.r2.fq
bedtools bamtofastq -i 6_TCTAGGAG-TCTAGGAG.sort.bam -fq 6_TCTAGGAG-TCTAGGAG.r1.fq -fq2 6_TCTAGGAG-TCTAGGAG.r2.fq
bedtools bamtofastq -i 2_TCTAGGAG-TCTAGGAG.sort.bam -fq 2_TCTAGGAG-TCTAGGAG.r1.fq -fq2 2_TCTAGGAG-TCTAGGAG.r2.fq
bedtools bamtofastq -i 8_TCTAGGAG-TCTAGGAG.sort.bam -fq 8_TCTAGGAG-TCTAGGAG.r1.fq -fq2 8_TCTAGGAG-TCTAGGAG.r2.fq
bedtools bamtofastq -i 7_TCTAGGAG-TCTAGGAG.sort.bam -fq 7_TCTAGGAG-TCTAGGAG.r1.fq -fq2 7_TCTAGGAG-TCTAGGAG.r2.fq
bedtools bamtofastq -i 5_ACATGGAG-ACATGGAG.sort.bam -fq 5_ACATGGAG-ACATGGAG.r1.fq -fq2 5_ACATGGAG-ACATGGAG.r2.fq
bedtools bamtofastq -i 6_ACATGGAG-ACATGGAG.sort.bam -fq 6_ACATGGAG-ACATGGAG.r1.fq -fq2 6_ACATGGAG-ACATGGAG.r2.fq
bedtools bamtofastq -i 1_ACATGGAG-ACATGGAG.sort.bam -fq 1_ACATGGAG-ACATGGAG.r1.fq -fq2 1_ACATGGAG-ACATGGAG.r2.fq
bedtools bamtofastq -i 7_ACATGGAG-ACATGGAG.sort.bam -fq 7_ACATGGAG-ACATGGAG.r1.fq -fq2 7_ACATGGAG-ACATGGAG.r2.fq
bedtools bamtofastq -i 8_ACATGGAG-ACATGGAG.sort.bam -fq 8_ACATGGAG-ACATGGAG.r1.fq -fq2 8_ACATGGAG-ACATGGAG.r2.fq
bedtools bamtofastq -i 2_ACATGGAG-ACATGGAG.sort.bam -fq 2_ACATGGAG-ACATGGAG.r1.fq -fq2 2_ACATGGAG-ACATGGAG.r2.fq
bedtools bamtofastq -i 2_GAGCTCTA-GAGCTCTA.sort.bam -fq 2_GAGCTCTA-GAGCTCTA.r1.fq -fq2 2_GAGCTCTA-GAGCTCTA.r2.fq
bedtools bamtofastq -i 8_GAGCTCTA-GAGCTCTA.sort.bam -fq 8_GAGCTCTA-GAGCTCTA.r1.fq -fq2 8_GAGCTCTA-GAGCTCTA.r2.fq
bedtools bamtofastq -i 6_GAGCTCTA-GAGCTCTA.sort.bam -fq 6_GAGCTCTA-GAGCTCTA.r1.fq -fq2 6_GAGCTCTA-GAGCTCTA.r2.fq
bedtools bamtofastq -i 5_GAGCTCTA-GAGCTCTA.sort.bam -fq 5_GAGCTCTA-GAGCTCTA.r1.fq -fq2 5_GAGCTCTA-GAGCTCTA.r2.fq
bedtools bamtofastq -i 7_GAGCTCTA-GAGCTCTA.sort.bam -fq 7_GAGCTCTA-GAGCTCTA.r1.fq -fq2 7_GAGCTCTA-GAGCTCTA.r2.fq
bedtools bamtofastq -i 1_GAGCTCTA-GAGCTCTA.sort.bam -fq 1_GAGCTCTA-GAGCTCTA.r1.fq -fq2 1_GAGCTCTA-GAGCTCTA.r2.fq
bedtools bamtofastq -i 2_AGATCGTC-AGATCGTC.sort.bam -fq 2_AGATCGTC-AGATCGTC.r1.fq -fq2 2_AGATCGTC-AGATCGTC.r2.fq
bedtools bamtofastq -i 6_AGATCGTC-AGATCGTC.sort.bam -fq 6_AGATCGTC-AGATCGTC.r1.fq -fq2 6_AGATCGTC-AGATCGTC.r2.fq
bedtools bamtofastq -i 5_AGATCGTC-AGATCGTC.sort.bam -fq 5_AGATCGTC-AGATCGTC.r1.fq -fq2 5_AGATCGTC-AGATCGTC.r2.fq
bedtools bamtofastq -i 1_AGATCGTC-AGATCGTC.sort.bam -fq 1_AGATCGTC-AGATCGTC.r1.fq -fq2 1_AGATCGTC-AGATCGTC.r2.fq
bedtools bamtofastq -i 7_AGATCGTC-AGATCGTC.sort.bam -fq 7_AGATCGTC-AGATCGTC.r1.fq -fq2 7_AGATCGTC-AGATCGTC.r2.fq
bedtools bamtofastq -i 8_AGATCGTC-AGATCGTC.sort.bam -fq 8_AGATCGTC-AGATCGTC.r1.fq -fq2 8_AGATCGTC-AGATCGTC.r2.fq
bedtools bamtofastq -i 7_GGCATTCT-GGCATTCT.sort.bam -fq 7_GGCATTCT-GGCATTCT.r1.fq -fq2 7_GGCATTCT-GGCATTCT.r2.fq
bedtools bamtofastq -i 5_GGCATTCT-GGCATTCT.sort.bam -fq 5_GGCATTCT-GGCATTCT.r1.fq -fq2 5_GGCATTCT-GGCATTCT.r2.fq
bedtools bamtofastq -i 2_GGCATTCT-GGCATTCT.sort.bam -fq 2_GGCATTCT-GGCATTCT.r1.fq -fq2 2_GGCATTCT-GGCATTCT.r2.fq
bedtools bamtofastq -i 8_GGCATTCT-GGCATTCT.sort.bam -fq 8_GGCATTCT-GGCATTCT.r1.fq -fq2 8_GGCATTCT-GGCATTCT.r2.fq
bedtools bamtofastq -i 6_GGCATTCT-GGCATTCT.sort.bam -fq 6_GGCATTCT-GGCATTCT.r1.fq -fq2 6_GGCATTCT-GGCATTCT.r2.fq
bedtools bamtofastq -i 1_GGCATTCT-GGCATTCT.sort.bam -fq 1_GGCATTCT-GGCATTCT.r1.fq -fq2 1_GGCATTCT-GGCATTCT.r2.fq
bedtools bamtofastq -i 5_GAGCAATC-GAGCAATC.sort.bam -fq 5_GAGCAATC-GAGCAATC.r1.fq -fq2 5_GAGCAATC-GAGCAATC.r2.fq
bedtools bamtofastq -i 1_GAGCAATC-GAGCAATC.sort.bam -fq 1_GAGCAATC-GAGCAATC.r1.fq -fq2 1_GAGCAATC-GAGCAATC.r2.fq
bedtools bamtofastq -i 6_GAGCAATC-GAGCAATC.sort.bam -fq 6_GAGCAATC-GAGCAATC.r1.fq -fq2 6_GAGCAATC-GAGCAATC.r2.fq
bedtools bamtofastq -i 2_GAGCAATC-GAGCAATC.sort.bam -fq 2_GAGCAATC-GAGCAATC.r1.fq -fq2 2_GAGCAATC-GAGCAATC.r2.fq
bedtools bamtofastq -i 7_GAGCAATC-GAGCAATC.sort.bam -fq 7_GAGCAATC-GAGCAATC.r1.fq -fq2 7_GAGCAATC-GAGCAATC.r2.fq
bedtools bamtofastq -i 8_GAGCAATC-GAGCAATC.sort.bam -fq 8_GAGCAATC-GAGCAATC.r1.fq -fq2 8_GAGCAATC-GAGCAATC.r2.fq
bedtools bamtofastq -i 2_GGTAACGT-GGTAACGT.sort.bam -fq 2_GGTAACGT-GGTAACGT.r1.fq -fq2 2_GGTAACGT-GGTAACGT.r2.fq
bedtools bamtofastq -i 5_GGTAACGT-GGTAACGT.sort.bam -fq 5_GGTAACGT-GGTAACGT.r1.fq -fq2 5_GGTAACGT-GGTAACGT.r2.fq
bedtools bamtofastq -i 8_GGTAACGT-GGTAACGT.sort.bam -fq 8_GGTAACGT-GGTAACGT.r1.fq -fq2 8_GGTAACGT-GGTAACGT.r2.fq
bedtools bamtofastq -i 1_GGTAACGT-GGTAACGT.sort.bam -fq 1_GGTAACGT-GGTAACGT.r1.fq -fq2 1_GGTAACGT-GGTAACGT.r2.fq
bedtools bamtofastq -i 6_GGTAACGT-GGTAACGT.sort.bam -fq 6_GGTAACGT-GGTAACGT.r1.fq -fq2 6_GGTAACGT-GGTAACGT.r2.fq
bedtools bamtofastq -i 7_GGTAACGT-GGTAACGT.sort.bam -fq 7_GGTAACGT-GGTAACGT.r1.fq -fq2 7_GGTAACGT-GGTAACGT.r2.fq
bedtools bamtofastq -i 2_GTCCTTGA-GTCCTTGA.sort.bam -fq 2_GTCCTTGA-GTCCTTGA.r1.fq -fq2 2_GTCCTTGA-GTCCTTGA.r2.fq
bedtools bamtofastq -i 8_GTCCTTGA-GTCCTTGA.sort.bam -fq 8_GTCCTTGA-GTCCTTGA.r1.fq -fq2 8_GTCCTTGA-GTCCTTGA.r2.fq
bedtools bamtofastq -i 6_GTCCTTGA-GTCCTTGA.sort.bam -fq 6_GTCCTTGA-GTCCTTGA.r1.fq -fq2 6_GTCCTTGA-GTCCTTGA.r2.fq
bedtools bamtofastq -i 5_GTCCTTGA-GTCCTTGA.sort.bam -fq 5_GTCCTTGA-GTCCTTGA.r1.fq -fq2 5_GTCCTTGA-GTCCTTGA.r2.fq
bedtools bamtofastq -i 1_GTCCTTGA-GTCCTTGA.sort.bam -fq 1_GTCCTTGA-GTCCTTGA.r1.fq -fq2 1_GTCCTTGA-GTCCTTGA.r2.fq
bedtools bamtofastq -i 7_GTCCTTGA-GTCCTTGA.sort.bam -fq 7_GTCCTTGA-GTCCTTGA.r1.fq -fq2 7_GTCCTTGA-GTCCTTGA.r2.fq

# check that extracting .bam worked

head -8 5_GGACTACT-GGACTACT.r1.fq
head -8 5_GGACTACT-GGACTACT.r2.fq

# move files from workdir to homedir at end
# can put this line in script to copy files
cp *.fq /home/nrh44/EUST_RESEQ_2017/rawFASTAfiles

# bamtofq.sh code copied these lines with ampersand at end to run in background
# need to move raw .bam files, lab of o internet far better for this...

# concatenate end1 and end2 files so all individuals in same file
# 2 for every individual (input is 6 files)
# example: cat *.r1.fq > uk1.1.fq

cp *.fq/home/nrh44/EUST_RESEQ_2017/rawFASTAfiles /workdir/nrh44
cp /home/nrh44/EUST_RESEQ_2017/cat.sh

cat 5_GGACTACT-GGACTACT.r1.fq 6_GGACTACT-GGACTACT.r1.fq 7_GGACTACT-GGACTACT.r1.fq 8_GGACTACT-GGACTACT.r1.fq 1_GGACTACT-GGACTACT.r1.fq 2_GGACTACT-GGACTACT.r1.fq > uk1.1.fq
cat 5_GGACTACT-GGACTACT.r2.fq 6_GGACTACT-GGACTACT.r2.fq 7_GGACTACT-GGACTACT.r2.fq 8_GGACTACT-GGACTACT.r2.fq 1_GGACTACT-GGACTACT.r2.fq 2_GGACTACT-GGACTACT.r2.fq > uk1.2.fq
cat 5_CGCTACAT-CGCTACAT.r1.fq 6_CGCTACAT-CGCTACAT.r1.fq 7_CGCTACAT-CGCTACAT.r1.fq 8_CGCTACAT-CGCTACAT.r1.fq 1_CGCTACAT-CGCTACAT.r1.fq 2_CGCTACAT-CGCTACAT.r1.fq > uk2.1.fq
cat 5_CGCTACAT-CGCTACAT.r2.fq 6_CGCTACAT-CGCTACAT.r2.fq 7_CGCTACAT-CGCTACAT.r2.fq 8_CGCTACAT-CGCTACAT.r2.fq 1_CGCTACAT-CGCTACAT.r2.fq 2_CGCTACAT-CGCTACAT.r2.fq > uk2.2.fq
cat 5_TTGGTGCA-TTGGTGCA.r1.fq 6_TTGGTGCA-TTGGTGCA.r1.fq 7_TTGGTGCA-TTGGTGCA.r1.fq 8_TTGGTGCA-TTGGTGCA.r1.fq 1_TTGGTGCA-TTGGTGCA.r1.fq 2_TTGGTGCA-TTGGTGCA.r1.fq > uk3.1.fq
cat 5_TTGGTGCA-TTGGTGCA.r2.fq 6_TTGGTGCA-TTGGTGCA.r2.fq 7_TTGGTGCA-TTGGTGCA.r2.fq 8_TTGGTGCA-TTGGTGCA.r2.fq 1_TTGGTGCA-TTGGTGCA.r2.fq 2_TTGGTGCA-TTGGTGCA.r2.fq > uk3.2.fq
cat 5_TCGCTATC-TCGCTATC.r1.fq 6_TCGCTATC-TCGCTATC.r1.fq 7_TCGCTATC-TCGCTATC.r1.fq 8_TCGCTATC-TCGCTATC.r1.fq 1_TCGCTATC-TCGCTATC.r1.fq 2_TCGCTATC-TCGCTATC.r1.fq > uk4.1.fq
cat 5_TCGCTATC-TCGCTATC.r2.fq 6_TCGCTATC-TCGCTATC.r2.fq 7_TCGCTATC-TCGCTATC.r2.fq 8_TCGCTATC-TCGCTATC.r2.fq 1_TCGCTATC-TCGCTATC.r2.fq 2_TCGCTATC-TCGCTATC.r2.fq > uk4.2.fq
cat 5_AGATACGG-AGATACGG.r1.fq 6_AGATACGG-AGATACGG.r1.fq 7_AGATACGG-AGATACGG.r1.fq 8_AGATACGG-AGATACGG.r1.fq 1_AGATACGG-AGATACGG.r1.fq 2_AGATACGG-AGATACGG.r1.fq > uk5.1.fq
cat 5_AGATACGG-AGATACGG.r2.fq 6_AGATACGG-AGATACGG.r2.fq 7_AGATACGG-AGATACGG.r2.fq 8_AGATACGG-AGATACGG.r2.fq 1_AGATACGG-AGATACGG.r2.fq 2_AGATACGG-AGATACGG.r2.fq > uk5.2.fq
cat 5_CAAGGTAC-CAAGGTAC.r1.fq 6_CAAGGTAC-CAAGGTAC.r1.fq 7_CAAGGTAC-CAAGGTAC.r1.fq 8_CAAGGTAC-CAAGGTAC.r1.fq 1_CAAGGTAC-CAAGGTAC.r1.fq 2_CAAGGTAC-CAAGGTAC.r1.fq > uk6.1.fq
cat 5_CAAGGTAC-CAAGGTAC.r2.fq 6_CAAGGTAC-CAAGGTAC.r2.fq 7_CAAGGTAC-CAAGGTAC.r2.fq 8_CAAGGTAC-CAAGGTAC.r2.fq 1_CAAGGTAC-CAAGGTAC.r2.fq 2_CAAGGTAC-CAAGGTAC.r2.fq > uk6.2.fq
cat 5_GTCCTGTT-GTCCTGTT.r1.fq 6_GTCCTGTT-GTCCTGTT.r1.fq 7_GTCCTGTT-GTCCTGTT.r1.fq 8_GTCCTGTT-GTCCTGTT.r1.fq 1_GTCCTGTT-GTCCTGTT.r1.fq 2_GTCCTGTT-GTCCTGTT.r1.fq > uk7.1.fq
cat 5_GTCCTGTT-GTCCTGTT.r2.fq 6_GTCCTGTT-GTCCTGTT.r2.fq 7_GTCCTGTT-GTCCTGTT.r2.fq 8_GTCCTGTT-GTCCTGTT.r2.fq 1_GTCCTGTT-GTCCTGTT.r2.fq 2_GTCCTGTT-GTCCTGTT.r2.fq > uk7.2.fq
cat 5_GAGAGTAC-GAGAGTAC.r1.fq 6_GAGAGTAC-GAGAGTAC.r1.fq 7_GAGAGTAC-GAGAGTAC.r1.fq 8_GAGAGTAC-GAGAGTAC.r1.fq 1_GAGAGTAC-GAGAGTAC.r1.fq 2_GAGAGTAC-GAGAGTAC.r1.fq > uk8.1.fq
cat 5_GAGAGTAC-GAGAGTAC.r2.fq 6_GAGAGTAC-GAGAGTAC.r2.fq 7_GAGAGTAC-GAGAGTAC.r2.fq 8_GAGAGTAC-GAGAGTAC.r2.fq 1_GAGAGTAC-GAGAGTAC.r2.fq 2_GAGAGTAC-GAGAGTAC.r2.fq > uk8.2.fq
cat 8_ACCGGTTA-ACCGGTTA.r1.fq 5_ACCGGTTA-ACCGGTTA.r1.fq 7_ACCGGTTA-ACCGGTTA.r1.fq 1_ACCGGTTA-ACCGGTTA.r1.fq 2_ACCGGTTA-ACCGGTTA.r1.fq 6_ACCGGTTA-ACCGGTTA.r1.fq > us1.1.fq
cat 8_ACCGGTTA-ACCGGTTA.r2.fq 5_ACCGGTTA-ACCGGTTA.r2.fq 7_ACCGGTTA-ACCGGTTA.r2.fq 1_ACCGGTTA-ACCGGTTA.r2.fq 2_ACCGGTTA-ACCGGTTA.r2.fq 6_ACCGGTTA-ACCGGTTA.r2.fq > us1.2.fq
cat 7_CTAGCTCA-CTAGCTCA.r1.fq 5_CTAGCTCA-CTAGCTCA.r1.fq 2_CTAGCTCA-CTAGCTCA.r1.fq 1_CTAGCTCA-CTAGCTCA.r1.fq 6_CTAGCTCA-CTAGCTCA.r1.fq 8_CTAGCTCA-CTAGCTCA.r1.fq > us2.1.fq
cat 7_CTAGCTCA-CTAGCTCA.r2.fq 5_CTAGCTCA-CTAGCTCA.r2.fq 2_CTAGCTCA-CTAGCTCA.r2.fq 1_CTAGCTCA-CTAGCTCA.r2.fq 6_CTAGCTCA-CTAGCTCA.r2.fq 8_CTAGCTCA-CTAGCTCA.r2.fq > us2.2.fq
cat 1_AATTCCGG-AATTCCGG.r1.fq 7_AATTCCGG-AATTCCGG.r1.fq 8_AATTCCGG-AATTCCGG.r1.fq 5_AATTCCGG-AATTCCGG.r1.fq 2_AATTCCGG-AATTCCGG.r1.fq 6_AATTCCGG-AATTCCGG.r1.fq > us3.1.fq
cat 1_AATTCCGG-AATTCCGG.r2.fq 7_AATTCCGG-AATTCCGG.r2.fq 8_AATTCCGG-AATTCCGG.r2.fq 5_AATTCCGG-AATTCCGG.r2.fq 2_AATTCCGG-AATTCCGG.r2.fq 6_AATTCCGG-AATTCCGG.r2.fq > us3.2.fq
cat 6_GGTACGAA-GGTACGAA.r1.fq 2_GGTACGAA-GGTACGAA.r1.fq 1_GGTACGAA-GGTACGAA.r1.fq 5_GGTACGAA-GGTACGAA.r1.fq 8_GGTACGAA-GGTACGAA.r1.fq 7_GGTACGAA-GGTACGAA.r1.fq > us4.1.fq
cat 6_GGTACGAA-GGTACGAA.r2.fq 2_GGTACGAA-GGTACGAA.r2.fq 1_GGTACGAA-GGTACGAA.r2.fq 5_GGTACGAA-GGTACGAA.r2.fq 8_GGTACGAA-GGTACGAA.r2.fq 7_GGTACGAA-GGTACGAA.r2.fq > us4.2.fq
cat 7_CACGTCTA-CACGTCTA.r1.fq 6_CACGTCTA-CACGTCTA.r1.fq 2_CACGTCTA-CACGTCTA.r1.fq 5_CACGTCTA-CACGTCTA.r1.fq 1_CACGTCTA-CACGTCTA.r1.fq 8_CACGTCTA-CACGTCTA.r1.fq > us5.1.fq
cat 7_CACGTCTA-CACGTCTA.r2.fq 6_CACGTCTA-CACGTCTA.r2.fq 2_CACGTCTA-CACGTCTA.r2.fq 5_CACGTCTA-CACGTCTA.r2.fq 1_CACGTCTA-CACGTCTA.r2.fq 8_CACGTCTA-CACGTCTA.r2.fq > us5.1.fq
cat 2_GATACCTG-GATACCTG.r1.fq 1_GATACCTG-GATACCTG.r1.fq 8_GATACCTG-GATACCTG.r1.fq 7_GATACCTG-GATACCTG.r1.fq 5_GATACCTG-GATACCTG.r1.fq 6_GATACCTG-GATACCTG.r1.fq > us6.1.fq
cat 2_GATACCTG-GATACCTG.r2.fq 1_GATACCTG-GATACCTG.r2.fq 8_GATACCTG-GATACCTG.r2.fq 7_GATACCTG-GATACCTG.r2.fq 5_GATACCTG-GATACCTG.r2.fq 6_GATACCTG-GATACCTG.r2.fq > us6.2.fq
cat 2_AGCGAGAT-AGCGAGAT.r1.fq 8_AGCGAGAT-AGCGAGAT.r1.fq 7_AGCGAGAT-AGCGAGAT.r1.fq 1_AGCGAGAT-AGCGAGAT.r1.fq 6_AGCGAGAT-AGCGAGAT.r1.fq 5_AGCGAGAT-AGCGAGAT.r1.fq > us7.1.fq
cat 2_AGCGAGAT-AGCGAGAT.r2.fq 8_AGCGAGAT-AGCGAGAT.r2.fq 7_AGCGAGAT-AGCGAGAT.r2.fq 1_AGCGAGAT-AGCGAGAT.r2.fq 6_AGCGAGAT-AGCGAGAT.r2.fq 5_AGCGAGAT-AGCGAGAT.r2.fq > us7.2.fq
cat 1_TGCCTCAA-TGCCTCAA.r1.fq 5_TGCCTCAA-TGCCTCAA.r1.fq 6_TGCCTCAA-TGCCTCAA.r1.fq 8_TGCCTCAA-TGCCTCAA.r1.fq 2_TGCCTCAA-TGCCTCAA.r1.fq 7_TGCCTCAA-TGCCTCAA.r1.fq > us8.1.fq
cat 1_TGCCTCAA-TGCCTCAA.r2.fq 5_TGCCTCAA-TGCCTCAA.r2.fq 6_TGCCTCAA-TGCCTCAA.r2.fq 8_TGCCTCAA-TGCCTCAA.r2.fq 2_TGCCTCAA-TGCCTCAA.r2.fq 7_TGCCTCAA-TGCCTCAA.r2.fq > us8.2.fq
cat 1_TCTAGGAG-TCTAGGAG.r1.fq 5_TCTAGGAG-TCTAGGAG.r1.fq 6_TCTAGGAG-TCTAGGAG.r1.fq 2_TCTAGGAG-TCTAGGAG.r1.fq 8_TCTAGGAG-TCTAGGAG.r1.fq 7_TCTAGGAG-TCTAGGAG.r1.fq > au1.1.fq
cat 1_TCTAGGAG-TCTAGGAG.r2.fq 5_TCTAGGAG-TCTAGGAG.r2.fq 6_TCTAGGAG-TCTAGGAG.r2.fq 2_TCTAGGAG-TCTAGGAG.r2.fq 8_TCTAGGAG-TCTAGGAG.r2.fq 7_TCTAGGAG-TCTAGGAG.r2.fq > au1.2.fq
cat 5_ACATGGAG-ACATGGAG.r1.fq 6_ACATGGAG-ACATGGAG.r1.fq 1_ACATGGAG-ACATGGAG.r1.fq 7_ACATGGAG-ACATGGAG.r1.fq 8_ACATGGAG-ACATGGAG.r1.fq 2_ACATGGAG-ACATGGAG.r1.fq > au2.1.fq
cat 5_ACATGGAG-ACATGGAG.r2.fq 6_ACATGGAG-ACATGGAG.r2.fq 1_ACATGGAG-ACATGGAG.r2.fq 7_ACATGGAG-ACATGGAG.r2.fq 8_ACATGGAG-ACATGGAG.r2.fq 2_ACATGGAG-ACATGGAG.r2.fq > au2.2.fq
cat 2_GAGCTCTA-GAGCTCTA.r1.fq 8_GAGCTCTA-GAGCTCTA.r1.fq 6_GAGCTCTA-GAGCTCTA.r1.fq 5_GAGCTCTA-GAGCTCTA.r1.fq 7_GAGCTCTA-GAGCTCTA.r1.fq 1_GAGCTCTA-GAGCTCTA.r1.fq > au3.1.fq
cat 2_GAGCTCTA-GAGCTCTA.r2.fq 8_GAGCTCTA-GAGCTCTA.r2.fq 6_GAGCTCTA-GAGCTCTA.r2.fq 5_GAGCTCTA-GAGCTCTA.r2.fq 7_GAGCTCTA-GAGCTCTA.r2.fq 1_GAGCTCTA-GAGCTCTA.r2.fq > au3.2.fq
cat 2_AGATCGTC-AGATCGTC.r1.fq 6_AGATCGTC-AGATCGTC.r1.fq 5_AGATCGTC-AGATCGTC.r1.fq 1_AGATCGTC-AGATCGTC.r1.fq 7_AGATCGTC-AGATCGTC.r1.fq 8_AGATCGTC-AGATCGTC.r1.fq > au4.1.fq
cat 2_AGATCGTC-AGATCGTC.r2.fq 6_AGATCGTC-AGATCGTC.r2.fq 5_AGATCGTC-AGATCGTC.r2.fq 1_AGATCGTC-AGATCGTC.r2.fq 7_AGATCGTC-AGATCGTC.r2.fq 8_AGATCGTC-AGATCGTC.r2.fq > au4.2.fq
cat 7_GGCATTCT-GGCATTCT.r1.fq 5_GGCATTCT-GGCATTCT.r1.fq 2_GGCATTCT-GGCATTCT.r1.fq 8_GGCATTCT-GGCATTCT.r1.fq 6_GGCATTCT-GGCATTCT.r1.fq 1_GGCATTCT-GGCATTCT.r1.fq > au5.1.fq
cat 7_GGCATTCT-GGCATTCT.r2.fq 5_GGCATTCT-GGCATTCT.r2.fq 2_GGCATTCT-GGCATTCT.r2.fq 8_GGCATTCT-GGCATTCT.r2.fq 6_GGCATTCT-GGCATTCT.r2.fq 1_GGCATTCT-GGCATTCT.r2.fq > au5.2.fq
cat 5_GAGCAATC-GAGCAATC.r1.fq 1_GAGCAATC-GAGCAATC.r1.fq 6_GAGCAATC-GAGCAATC.r1.fq 2_GAGCAATC-GAGCAATC.r1.fq 7_GAGCAATC-GAGCAATC.r1.fq 8_GAGCAATC-GAGCAATC.r1.fq > au6.1.fq
cat 5_GAGCAATC-GAGCAATC.r2.fq 1_GAGCAATC-GAGCAATC.r2.fq 6_GAGCAATC-GAGCAATC.r2.fq 2_GAGCAATC-GAGCAATC.r2.fq 7_GAGCAATC-GAGCAATC.r2.fq 8_GAGCAATC-GAGCAATC.r2.fq > au6.2.fq
cat 2_GGTAACGT-GGTAACGT.r1.fq 5_GGTAACGT-GGTAACGT.r1.fq 8_GGTAACGT-GGTAACGT.r1.fq 1_GGTAACGT-GGTAACGT.r1.fq 6_GGTAACGT-GGTAACGT.r1.fq 7_GGTAACGT-GGTAACGT.r1.fq > au7.1.fq
cat 2_GGTAACGT-GGTAACGT.r2.fq 5_GGTAACGT-GGTAACGT.r2.fq 8_GGTAACGT-GGTAACGT.r2.fq 1_GGTAACGT-GGTAACGT.r2.fq 6_GGTAACGT-GGTAACGT.r2.fq 7_GGTAACGT-GGTAACGT.r2.fq > au7.2.fq
cat 2_GTCCTTGA-GTCCTTGA.r1.fq 8_GTCCTTGA-GTCCTTGA.r1.fq 6_GTCCTTGA-GTCCTTGA.r1.fq 5_GTCCTTGA-GTCCTTGA.r1.fq 1_GTCCTTGA-GTCCTTGA.r1.fq 7_GTCCTTGA-GTCCTTGA.r1.fq > au8.1.fq
cat 2_GTCCTTGA-GTCCTTGA.r2.fq 8_GTCCTTGA-GTCCTTGA.r2.fq 6_GTCCTTGA-GTCCTTGA.r2.fq 5_GTCCTTGA-GTCCTTGA.r2.fq 1_GTCCTTGA-GTCCTTGA.r2.fq 7_GTCCTTGA-GTCCTTGA.r2.fq > au8.2.fq

cp uk*.fq /home/nrh44/EUST_RESEQ_2017/FASTAfiles
cp us*.fq /home/nrh44/EUST_RESEQ_2017/FASTAfiles
cp au*.fq /home/nrh44/EUST_RESEQ_2017/FASTAfiles

# quality check with FastQC

mkdir home/nrh44/EUST_RESEQ_2017/FastQC

fastqc uk1.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC

fastqc uk1.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk2.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk2.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk3.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk3.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk4.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk4.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk5.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk5.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk6.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk6.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk7.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk7.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk8.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc uk8.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us1.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us1.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us2.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us2.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us3.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us3.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us4.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us4.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us5.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us5.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us6.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us6.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us7.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us7.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us8.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc us8.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au1.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au1.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au2.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au2.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au3.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au3.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au4.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au4.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au5.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au5.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au6.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au6.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au7.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au7.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au8.1.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC
fastqc au8.2.fq --outdir=home/nrh44/EUST_RESEQ_2017/FastQC


# AdapterRemoval
# adapters 1 and 2 default settings

/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 uk1.1.fq --file2 uk1.2.fq --basename output_paired --trimns --trimqualities --collapse

/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 uk2.1.fq --file2 uk2.2.fq --basename uk2 --trimns --trimqualities --collapse
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 uk3.1.fq --file2 uk3.2.fq --basename uk3 --trimns --trimqualities --collapse
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 uk4.1.fq --file2 uk4.2.fq --basename uk4 --trimns --trimqualities --collapse
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 uk5.1.fq --file2 uk5.2.fq --basename uk5 --trimns --trimqualities --collapse
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 uk6.1.fq --file2 uk6.2.fq --basename uk6 --trimns --trimqualities --collapse
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 uk7.1.fq --file2 uk7.2.fq --basename uk7 --trimns --trimqualities --collapse
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 uk8.1.fq --file2 uk8.2.fq --basename uk8 --trimns --trimqualities --collapse

cp uk*.truncated /home/nrh44/EUST_RESEQ_2017
cp uk*.discarded /home/nrh44/EUST_RESEQ_2017
cp uk*.collapsed /home/nrh44/EUST_RESEQ_2017
rm uk*.truncated
rm uk*.discarded
rm uk*.collapsed
rm uk*.*.fq


######################################## MAPPING ########################################

# Reference genome info
# assembly downloaded from Genbank (filename = GCA_001447265.1_Sturnus_vulgaris-1.0_genomic.fna)
# renamed to EUSTref.fna

# index the reference genome, -f means fasta input
# re-did everything from here on with pseudochromosomes

bowtie2-build -f /workdir/nrh44/EUSTref.fna EUST

bowtie2-build -f /workdir/nrh44/EUSTref.pseudochrom.fasta EUST

# use bowtie to align paired-end reads to reference
# -p to run on parallel threads (EX: 16 threads on medium machine)
# -I and -X set min and max alignment lengths (if more similar, runs faster)
cp /home/nrh44/EUST_RESEQ_2017/Archive/Mapping/ADAPTERremoved/* /workdir/nrh44/baminput &

bowtie2 -p 16 --phred33 --very-sensitive-local -x EUST -I 149 -X 900 --rg-id uk1 --rg SM:uk1 -1 /workdir/nrh44/uk1.pair1.truncated -2 /workdir/nrh44/uk1.pair2.truncated -U /workdir/nrh44/uk1.collapsed,/workdir/nrh44/uk1.collapsed.truncated,/workdir/nrh44/uk1.singleton.truncated -S ./uk1.sam
samtools view -bS uk1.sam > uk1.bam
samtools sort uk1.bam -o uk1_sort.bam
rm uk1.sam
rm uk1.bam

# ETC

# qualimap on the command line
# increase RAM for medium machine

/programs/qualimap_v2.2.1/qualimap bamqc -bam uk1_sort.bam -outdir uk1_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam uk2_sort.bam -outdir uk2_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam uk3_sort.bam -outdir uk3_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam uk4_sort.bam -outdir uk4_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam uk5_sort.bam -outdir uk5_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam uk6_sort.bam -outdir uk6_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam uk7_sort.bam -outdir uk7_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam uk8_sort.bam -outdir uk8_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam us1_sort.bam -outdir us1_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam us2_sort.bam -outdir us2_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam us3_sort.bam -outdir us3_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam us4_sort.bam -outdir us4_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam us5_sort.bam -outdir us5_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam us6_sort.bam -outdir us6_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam us7_sort.bam -outdir us7_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam us8_sort.bam -outdir us8_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam au1_sort.bam -outdir au1_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam au2_sort.bam -outdir au2_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam au3_sort.bam -outdir au3_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam au4_sort.bam -outdir au4_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam au5_sort.bam -outdir au5_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam au6_sort.bam -outdir au6_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam au7_sort.bam -outdir au7_sort --java-mem-size=128G
/programs/qualimap_v2.2.1/qualimap bamqc -bam au8_sort.bam -outdir au8_sort --java-mem-size=128G


#################################### VARIANT CALLING ####################################

# Variant Calling - HaplotypeCaller
# bam files from mapping script above are indexed and sorted already
# note that -Xmx below is a Java Virtual Machine command to specify memory (-Xmx48g is 48 GB)

# prepare the genome for GATK: index it (fai and dict files)
# make dict file (sequence dictionary of the contig names)
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar CreateSequenceDictionary R= EUSTref.fa O= EUSTref.fa.dict
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar CreateSequenceDictionary R= EUSTref.pseudochrom.fasta O= EUSTref.pseudochrom.dict &

# make fai index file to allow random access to fasta files
samtools faidx EUSTref.fa

# add read group information
# use samtools view -H sample.bam | grep '@RG'
# samtools command above will print required fields for the AddOrReplaceReadGroups below
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=uk1_sort.bam OUTPUT=uk1_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GGACTACT RGSM=uk1_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=uk2_sort.bam OUTPUT=uk2_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=CGCTACAT RGSM=uk2_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=uk3_sort.bam OUTPUT=uk3_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=TTGGTGCA RGSM=uk3_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=uk4_sort.bam OUTPUT=uk4_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=TCGCTATC RGSM=uk4_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=uk5_sort.bam OUTPUT=uk5_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=AGATACGG RGSM=uk5_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=uk6_sort.bam OUTPUT=uk6_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=CAAGGTAC RGSM=uk6_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=uk7_sort.bam OUTPUT=uk7_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GTCCTGTT RGSM=uk7_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=uk8_sort.bam OUTPUT=uk8_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GAGAGTAC RGSM=uk8_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=au1_sort.bam OUTPUT=au1_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=TCTAGGAG RGSM=au1_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=au2_sort.bam OUTPUT=au2_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=ACATGGAG RGSM=au2_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=au3_sort.bam OUTPUT=au3_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GAGCTCTA RGSM=au3_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=au4_sort.bam OUTPUT=au4_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=AGATCGTC RGSM=au4_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=au5_sort.bam OUTPUT=au5_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GGCATTCT RGSM=au5_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=au6_sort.bam OUTPUT=au6_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GAGCAATC RGSM=au6_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=au7_sort.bam OUTPUT=au7_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GGTAACGT RGSM=au7_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=au8_sort.bam OUTPUT=au8_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GTCCTTGA RGSM=au8_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=us1_sort.bam OUTPUT=us1_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=ACCGGTTA RGSM=us1_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=us2_sort.bam OUTPUT=us2_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=CTAGCTCA RGSM=us2_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=us3_sort.bam OUTPUT=us3_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=AATTCCGG RGSM=us3_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=us4_sort.bam OUTPUT=us4_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GGTACGAA RGSM=us4_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=us5_sort.bam OUTPUT=us5_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=CACGTCTA RGSM=us5_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=us6_sort.bam OUTPUT=us6_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=GATACCTG RGSM=us6_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=us7_sort.bam OUTPUT=us7_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=AGCGAGAT RGSM=us7_sort
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar AddOrReplaceReadGroups INPUT=us8_sort.bam OUTPUT=us8_sortRG.bam RGID=1 RGLB=lib1 RGPL=illumina RGPU=TGCCTCAA RGSM=us8_sort

# mark duplicates
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=uk1_sortRG.bam OUTPUT=uk1_sortRGmark.bam METRICS_FILE=uk1_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=uk2_sortRG.bam OUTPUT=uk2_sortRGmark.bam METRICS_FILE=uk2_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=uk3_sortRG.bam OUTPUT=uk3_sortRGmark.bam METRICS_FILE=uk3_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=uk4_sortRG.bam OUTPUT=uk4_sortRGmark.bam METRICS_FILE=uk4_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=uk5_sortRG.bam OUTPUT=uk5_sortRGmark.bam METRICS_FILE=uk5_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=uk6_sortRG.bam OUTPUT=uk6_sortRGmark.bam METRICS_FILE=uk6_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=uk7_sortRG.bam OUTPUT=uk7_sortRGmark.bam METRICS_FILE=uk7_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=uk8_sortRG.bam OUTPUT=uk8_sortRGmark.bam METRICS_FILE=uk8_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=us1_sortRG.bam OUTPUT=us1_sortRGmark.bam METRICS_FILE=us1_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=us2_sortRG.bam OUTPUT=us2_sortRGmark.bam METRICS_FILE=us2_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=us3_sortRG.bam OUTPUT=us3_sortRGmark.bam METRICS_FILE=us3_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=us4_sortRG.bam OUTPUT=us4_sortRGmark.bam METRICS_FILE=us4_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=us5_sortRG.bam OUTPUT=us5_sortRGmark.bam METRICS_FILE=us5_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=us6_sortRG.bam OUTPUT=us6_sortRGmark.bam METRICS_FILE=us6_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=us7_sortRG.bam OUTPUT=us7_sortRGmark.bam METRICS_FILE=us7_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=us8_sortRG.bam OUTPUT=us8_sortRGmark.bam METRICS_FILE=us8_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=au1_sortRG.bam OUTPUT=au1_sortRGmark.bam METRICS_FILE=au1_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=au2_sortRG.bam OUTPUT=au2_sortRGmark.bam METRICS_FILE=au2_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=au3_sortRG.bam OUTPUT=au3_sortRGmark.bam METRICS_FILE=au3_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=au4_sortRG.bam OUTPUT=au4_sortRGmark.bam METRICS_FILE=au4_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=au5_sortRG.bam OUTPUT=au5_sortRGmark.bam METRICS_FILE=au5_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=au6_sortRG.bam OUTPUT=au6_sortRGmark.bam METRICS_FILE=au6_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=au7_sortRG.bam OUTPUT=au7_sortRGmark.bam METRICS_FILE=au7_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar MarkDuplicates INPUT=au8_sortRG.bam OUTPUT=au8_sortRGmark.bam METRICS_FILE=au8_sort.metrics.txt MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000

# since running HaplotypeCaller, don't need to realign or fix mates unless there is an error in ValidateSamFile

java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=uk1_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=uk2_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=uk3_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=uk4_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=uk5_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=uk6_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=uk7_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=uk8_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=us1_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=us2_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=us3_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=us4_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=us5_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=us6_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=us7_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=us8_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=au1_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=au2_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=au3_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=au4_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=au5_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=au6_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=au7_sortRGmark.bam MODE=SUMMARY
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar ValidateSamFile I=au8_sortRGmark.bam MODE=SUMMARY

# index .bam files for HaplotypeCaller
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=uk1_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=uk2_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=uk3_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=uk4_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=uk5_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=uk6_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=uk7_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=uk8_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=us1_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=us2_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=us3_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=us4_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=us5_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=us6_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=us7_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=us8_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=au1_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=au2_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=au3_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=au4_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=au5_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=au6_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=au7_sortRGmark.bam &
java -Xmx48g -jar /programs/picard-tools-2.8.2/picard.jar BuildBamIndex I=au8_sortRGmark.bam &


# Variant Calling with HaplotypeCaller
# run in GVCF mode to speed things up
# default presets with discovery mode (no alleles passed), emit confidence phred of 10, call confidence phred 30
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I uk1_sortRGmark.bam -o uk1.g.vcf

java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I uk2_sortRGmark.bam -o uk2.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I uk3_sortRGmark.bam -o uk3.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I uk4_sortRGmark.bam -o uk4.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I uk5_sortRGmark.bam -o uk5.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I uk6_sortRGmark.bam -o uk6.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I uk7_sortRGmark.bam -o uk7.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I uk8_sortRGmark.bam -o uk8.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I us1_sortRGmark.bam -o us1.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I us2_sortRGmark.bam -o us2.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I us3_sortRGmark.bam -o us3.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I us4_sortRGmark.bam -o us4.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I us5_sortRGmark.bam -o us5.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I us6_sortRGmark.bam -o us6.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I us7_sortRGmark.bam -o us7.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I us8_sortRGmark.bam -o us8.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I au1_sortRGmark.bam -o au1.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I au2_sortRGmark.bam -o au2.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I au3_sortRGmark.bam -o au3.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I au4_sortRGmark.bam -o au4.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I au5_sortRGmark.bam -o au5.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I au6_sortRGmark.bam -o au6.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I au7_sortRGmark.bam -o au7.g.vcf
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I au8_sortRGmark.bam -o au8.g.vcf



java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF -I uk4_sortRGmarkfixmate.bam -o uk4.g.vcf &> uk4log &

# ran again emitting all confident sites as per Simon Martin's recommendations for pi and dxy

java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I uk1_sortRGmark.bam -o uk1.g.vcf &> uk1log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I uk2_sortRGmark.bam -o uk2.g.vcf &> uk2log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I uk3_sortRGmark.bam -o uk3.g.vcf &> uk3log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I uk4_sortRGmark.bam -o uk4.g.vcf &> uk4log &

java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I au1_sortRGmark.bam -o au1.g.vcf &> au1log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I au2_sortRGmark.bam -o au2.g.vcf &> au2log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I au3_sortRGmark.bam -o au3.g.vcf &> au3log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I au4_sortRGmark.bam -o au4.g.vcf &> au4log &

java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I uk6_sortRGmark.bam -o uk6.g.vcf &> uk6log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I uk7_sortRGmark.bam -o uk7.g.vcf &> uk7log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I uk8_sortRGmark.bam -o uk8.g.vcf &> uk8log &

java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I us7_sortRGmark.bam -o us7.g.vcf &> us7log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I us8_sortRGmark.bam -o us8.g.vcf &> us8log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I us6_sortRGmark.bam -o us6.g.vcf &> us6log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I au7_sortRGmark.bam -o au7.g.vcf &> au7log &
java -Xmx8g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T HaplotypeCaller -R EUSTref.pseudochrom.fasta -nct 6 -mmq 10 --emitRefConfidence GVCF --output_mode EMIT_ALL_CONFIDENT_SITES -I au8_sortRGmark.bam -o au8.g.vcf &> au8log &

# then combine individual GVCF files into joint VCF
java -Xmx200g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T GenotypeGVCFs -R EUSTref.pseudochrom.fasta --includeNonVariantSites -nt 40 \
--variant gvcf/uk1.g.vcf \
--variant gvcf/uk2.g.vcf \
--variant gvcf/uk3.g.vcf \
--variant gvcf/uk4.g.vcf \
--variant gvcf/uk5.g.vcf \
--variant gvcf/uk6.g.vcf \
--variant gvcf/uk7.g.vcf \
--variant gvcf/uk8.g.vcf \
--variant gvcf/us1.g.vcf \
--variant gvcf/us2.g.vcf \
--variant gvcf/us3.g.vcf \
--variant gvcf/us4.g.vcf \
--variant gvcf/us5.g.vcf \
--variant gvcf/us6.g.vcf \
--variant gvcf/us7.g.vcf \
--variant gvcf/us8.g.vcf \
--variant gvcf/au1.g.vcf \
--variant gvcf/au2.g.vcf \
--variant gvcf/au3.g.vcf \
--variant gvcf/au4.g.vcf \
--variant gvcf/au5.g.vcf \
--variant gvcf/au6.g.vcf \
--variant gvcf/au7.g.vcf \
--variant gvcf/au8.g.vcf \
-o EUSTreseq.pseudochrom.allconf.vcf &> jointvcf.all.log &

### given the sampling strategy, may need to backtrack to this spot to check how
# Australian sampling influences


#################################### FLAGGING ####################################

# scaffold
java -Xmx48g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T VariantFiltration -R EUSTref.fasta \
--variant EUSTreseq.vcf -o EUSTreseq.vcf \
--filterExpression "QD<2.0||FS>60.0||MQ<40.0||SOR>3.0" --filterName "first_snp_filter"

# pseudochrom
java -Xmx48g -jar /programs/bin/GATK/GenomeAnalysisTK.jar -T VariantFiltration -R EUSTref.pseudochrom.fasta \
--variant EUSTreseq.pseudochrom.allconf.vcf -o EUSTreseq.pseudochrom.f.vcf \
--filterExpression "QD<2.0" --filterName "QD" --filterExpression "FS>60.0" --filterName "FS" --filterExpression "MQ<40.0" \
--filterName "MQ" --filterExpression "SOR>3.0" --filterName "SOR" &> filter.pseud.allconf.log &

# try filtering one at a time and label in GATK to pull out which filter is hitting data hardest

### filters you should always use:
# QD is quality/depth of non-reference reads (best practices: filter out below 2 because fail VQSR)
# FS is probability that there is strand bias (filter above 55-60 because fail VQSR)
# SOR is strand odds ratio, also calculates strand bias (filter above 3)
# MQ is the root-mean-square mapping quality, includes standard deviation and thus variation in data (if mapping quality is good, then MQ around 60)

### filters that may or may not apply in your data:
# MQRankSum compares the mapping quality of reads carrying an alternative allele to the reference reads, want to see value around 0, this "hard filter" is particularly tough to call
# ReadPosRankSum indicates how close the variant site is to the ends of reads (if close to end, more likely that it's a sequencing error)
