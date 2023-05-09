#!/usr/bin/bash
#PBS -N db3por2
#PBS -q batch
#PBS -l nodes=1:ppn=6

cd /home/tilapia/xuluohao/dabao/asm/
/home/tilapia/srcs/NextPolish/nextPolish /home/tilapia/xuluohao/dabao/asm/nextpolish-round2.cfg
