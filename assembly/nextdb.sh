#!/usr/bin/bash
#PBS -N nextdb
#PBS -q batch
#PBS -l nodes=1:ppn=48

cd /home/tilapia/xuluohao/dabao/asm/
/home/tilapia/srcs/NextDenovo/nextDenovo /home/tilapia/xuluohao/dabao/asm/rundb40k.cfg

