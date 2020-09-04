# global-RESEQ

This repo contains scripts associated with the manuscript "Replicated invasions reveal hotspots of natural selection in the Common Starling." Each script is described below in order of use.

Code that's been finalized:
read-processing.sh is the entire bioinformatic processing pipeline from raw sequencing data to final GATK output.
filter-scan.sh includes all command-line scripts to process vcf files, including selection scans and tests of population structure.
angsd.sh goes from raw sequencing data all the way to selection/structure test in the genotype likelihood framework.
demography.sh includes both smc++ and fastsimcoal2 analyses.

Code that I'm testing:
docker-pixy.sh describes my process for trying out pixy on Cornell's BioHPC cluster.
unused-code.sh is a separate file for tests that I considered but did not end up using.
