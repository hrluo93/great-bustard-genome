#!/usr/bin/bash
#PBS -N lastck
#PBS -q batch
#PBS -l nodes=1:ppn=4

export PATH=/home/tilapia/srcs/last:$PATH

cd /home/tilapia/xuluohao/dabao/last/

#/home/tilapia/srcs/last/src/lastdb baobaoDB /home/tilapia/xuluohao/dabao/final.chr.fa
#/home/tilapia/srcs/last/src/lastal -P4 -m100 -E0.05 baobaoDB /home/tilapia/xuluohao/dabao/asm/psmc/relativesp/kori.fna | last-split -m1 > db.kori.R1.maf

#/home/tilapia/srcs/last/src/lastal -P4 -m100 -E0.05 baobaoDB /home/tilapia/xuluohao/dabao/last/v22.fa | /home/tilapia/srcs/last/src/last-split -m1 > db.ck.R1.maf
/home/tilapia/srcs/last/scripts/maf-swap db.ck.R1.maf | /home/tilapia/srcs/last/src/last-split | /home/tilapia/srcs/last/scripts/maf-swap | /home/tilapia/srcs/last/src/last-split | /home/tilapia/srcs/last/scripts/maf-sort > db.ck.R2.maf

