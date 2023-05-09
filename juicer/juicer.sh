#!/usr/bin/bash
#PBS -N juicer
#PBS -q batch
#PBS -l nodes=cu02:ppn=16

cd /home/tilapia/xuluohao/dabao/asm/juicer/
/home/tilapia/srcs/juicer/CPU/juicer.sh -t 16 -d /home/tilapia/xuluohao/dabao/asm/juicer/ -D /home/tilapia/xuluohao/dabao/asm/juicer -y /home/tilapia/xuluohao/dabao/asm/juicer/restriction_sites/dbp2.fasta_DpnII.txt -z /home/tilapia/xuluohao/dabao/asm/juicer/references/dbp2.fasta -p /home/tilapia/xuluohao/dabao/asm/juicer/restriction_sites/db2.contig.sizes -s DpnII 
