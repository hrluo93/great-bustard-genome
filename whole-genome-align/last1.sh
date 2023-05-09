#!/usr/bin/bash
#PBS -N lastkori
#PBS -q batch
#PBS -l nodes=1:ppn=4

export PATH=/home/tilapia/srcs/last:$PATH

cd /home/tilapia/xuluohao/dabao/last/

#/home/tilapia/srcs/last/src/lastdb baobaoDB /home/tilapia/xuluohao/dabao/final.chr.fa
#/home/tilapia/srcs/last/src/lastal -P4 -m100 -E0.05 baobaoDB /home/tilapia/xuluohao/dabao/asm/psmc/relativesp/kori.fna | /home/tilapia/srcs/last/src/last-split -m1 > db.kori.R1.maf
/home/tilapia/srcs/last/scripts/maf-swap db.kori.R1.maf | /home/tilapia/srcs/last/src/last-split -m1 | /home/tilapia/srcs/last/scripts/maf-swap | /home/tilapia/srcs/last/src/last-split -m1 | /home/tilapia/srcs/last/scripts/maf-sort > db.kori.R3.maf

