#!/usr/bin/bash
#PBS -N mulz6
#PBS -q batch
#PBS -l nodes=1:ppn=4



cd /home/tilapia/xuluohao/dabao/last/

#perl maf.rename.pl db.kori.R2.maf db kori db.kori.Rn.maf 
#perl maf.rename.pl db.ccr.R2.maf db ccr db.ccr.Rn.maf
#perl maf.rename.pl db.cuc.R2.maf db cuc db.cuc.Rn.maf
#perl maf.rename.pl db.cv21.R2.maf db cv21 db.cv21.Rn.maf
#perl maf.rename.pl db.zf.R2.maf db zf db.zf.Rn.maf
perl maf.rename.pl db.ck.R2.maf db ck db.ck.Rn.maf 

#/home/tilapia/srcs/multiz/multiz /home/tilapia/xuluohao/dabao/last/db.kori.Rn.maf  /home/tilapia/xuluohao/dabao/last/db.ccr.Rn.maf 1 out1 out2  > db.kori.ccr.R2.maf

#/home/tilapia/srcs/multiz/multiz /home/tilapia/xuluohao/dabao/last/db.kori.ccr.R2.maf /home/tilapia/xuluohao/dabao/last/db.cuc.Rn.maf 1 out1 out2  > db.kori.ccr.cuc.R3.maf

#/home/tilapia/srcs/multiz/multiz /home/tilapia/xuluohao/dabao/last/db.kori.ccr.cuc.R3.maf /home/tilapia/xuluohao/dabao/last/db.cv21.Rn.maf 1 out1 out2  > db.kori.ccr.cuc.cv21.R4.maf

#/home/tilapia/srcs/multiz/multiz /home/tilapia/xuluohao/dabao/last/db.kori.ccr.cuc.cv21.R4.maf /home/tilapia/xuluohao/dabao/last/db.zf.Rn.maf 1 out1 out2  > db.kori.ccr.cuc.cv21.zf.R5.maf

/home/tilapia/srcs/multiz/multiz /home/tilapia/xuluohao/dabao/last/db.kori.ccr.cuc.cv21.zf.R5.maf /home/tilapia/xuluohao/dabao/last/db.ck.Rn.maf 1 out1 out2  > db.kori.ccr.cuc.cv21.zf.ck.maf

