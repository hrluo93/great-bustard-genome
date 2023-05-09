#!/usr/bin/bash
#PBS -N lastzf
#PBS -q batch
#PBS -l nodes=1:ppn=4

export PATH=/home/tilapia/srcs/last:$PATH

cd /home/tilapia/xuluohao/dabao/last/

#/home/tilapia/srcs/last/src/lastdb baobaoDB /home/tilapia/xuluohao/dabao/final.chr.fa
#/home/tilapia/srcs/last/src/lastal -P4 -m100 -E0.05 baobaoDB /home/tilapia/xuluohao/dabao/asm/psmc/relativesp/kori.fna | last-split -m1 > db.kori.R1.maf

#/home/tilapia/srcs/last/src/lastal -P4 -m100 -E0.05 baobaoDB /home/tilapia/xuluohao/dabao/last/v22.fa | last-split -m1 > db.ck.R1.maf

#/home/tilapia/srcs/last/src/lastal -P4 -m100 -E0.05 baobaoDB /home/tilapia/xuluohao/dabao/last/ccr.fna | last-split -m1 > db.ccr.R1.maf

#/home/tilapia/srcs/last/src/lastal -P4 -m100 -E0.05 baobaoDB /home/tilapia/xuluohao/dabao/last/cuc.fna | last-split -m1 > db.cuc.R1.maf

#/home/tilapia/srcs/last/src/lastal -P4 -m100 -E0.05 baobaoDB /home/tilapia/xuluohao/dabao/last/zf.fna | /home/tilapia/srcs/last/src/last-split -m1 > db.zf.R1.maf
/home/tilapia/srcs/last/scripts/maf-swap db.zf.R1.maf | /home/tilapia/srcs/last/src/last-split | /home/tilapia/srcs/last/scripts/maf-swap | /home/tilapia/srcs/last/src/last-split | /home/tilapia/srcs/last/scripts/maf-sort > db.zf.R2.maf
