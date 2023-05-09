#!/usr/bin/bash
#PBS -N 3dman
#PBS -q batch
#PBS -l nodes=cu01:ppn=16

cd /home/tilapia/xuluohao/dabao/asm/3ddnaman/

awk -f /home/tilapia/srcs/3d-dna-master/utils/generate-assembly-file-from-fasta.awk /home/tilapia/xuluohao/dabao/asm/polish/02_lgspord2/dbp2.fasta > dbp2.fa.assembly
/home/tilapia/srcs/3d-dna-master/visualize/run-assembly-visualizer.sh /home/tilapia/xuluohao/dabao/asm/3ddnaman/dbp2.fa.assembly /home/tilapia/xuluohao/dabao/asm/juicer/aligned/merged_nodups.txt
