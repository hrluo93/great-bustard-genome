#!/usr/bin/bash
#PBS -N 3dman
#PBS -q batch
#PBS -l nodes=cu01:ppn=1


cd /home/tilapia/xuluohao/dabao/asm/3ddnaman/

/home/tilapia/srcs/3d-dna-master/run-asm-pipeline-post-review.sh -r dbp2.order.id.fasta.review.assembly ../juicer/references/dbp2.fasta  ../juicer/aligned/merged_nodups.txt 

