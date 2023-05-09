#!/usr/bin/bash
#PBS -N dbbwa
#PBS -q batch
#PBS -l nodes=1:ppn=20

cd /home/tilapia/xuluohao/dabao/
#fastp
fastp -i /home/tilapia/xuluohao/dabao/female/20220906-HuaMingshengwu/01.rawFq/00.mergeRawFq/HZ3/HZ3_raw_1.fq.gz -I /home/tilapia/xuluohao/dabao/female/20220906-HuaMingshengwu/01.rawFq/00.mergeRawFq/HZ3/HZ3_raw_2.fq.gz -o /home/tilapia/xuluohao/dabao/female/20220906-HuaMingshengwu/01.rawFq/00.mergeRawFq/HZ3/HZ3_clean1.fq.gz -O /home/tilapia/xuluohao/dabao/female/20220906-HuaMingshengwu/01.rawFq/00.mergeRawFq/HZ3/HZ3_clean2.fq.gz -q 20 
#bwa
bwa index -p chrbwa /home/tilapia/xuluohao/dabao/final.chr.fa

/opt/anaconda3/bin/bwa mem -t 20 chrbwa /home/tilapia/xuluohao/dabao/female/20220906-HuaMingshengwu/01.rawFq/00.mergeRawFq/HZ3/HZ3_clean1.fq.gz /home/tilapia/xuluohao/dabao/female/20220906-HuaMingshengwu/01.rawFq/00.mergeRawFq/HZ3/HZ3_clean2.fq.gz | samtools sort -@ 10 -O bam -o female/dbfe.bam

cd /home/tilapia/xuluohao/dabao/female/
#picard & gatk
/opt/anaconda3/bin/samtools index -@ 10 dbfe.bam
java -jar /home/tilapia/srcs/picard.jar AddOrReplaceReadGroups I=dbfe.bam O=dbfe.group.bam RGLB=library1 RGPL=illumina RGPU=unit1 RGSM=sample1
/opt/anaconda3/bin/samtools index -@ 10 dbfe.group.bam
java -jar /home/tilapia/srcs/picard.jar MarkDuplicates REMOVE_DUPLICATES= false MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 INPUT=dbfe.group.bam OUTPUT=dbfe.groupmk.bam METRICS_FILE=dbfe.marked.g.bam.metrics
/opt/anaconda3/bin/samtools index dbfe.groupmk.bam
cp /home/tilapia/xuluohao/dabao/final.chr.fa /home/tilapia/xuluohao/dabao/female/
/opt/anaconda3/bin/samtools faidx final.chr.fa
java -jar /home/tilapia/srcs/picard.jar CreateSequenceDictionary R=final.chr.fa O=final.chr.dict
samtools index
java -Xmx128g -jar /home/tilapia/srcs/gatk-4.2.0.0/gatk-package-4.2.0.0-local.jar ValidateSamFile -I dbfe.groupmk.bam
java -Xmx128G -jar /home/tilapia/srcs/gatk-4.2.0.0/gatk-package-4.2.0.0-local.jar HaplotypeCaller -R final.chr.fa -I dbfe.groupmk.bam -O dbferaw.g.vcf.gz -ERC GVCF -ploidy 2
java -Xmx128G -jar /home/tilapia/srcs/gatk-4.2.0.0/gatk-package-4.2.0.0-local.jar GenotypeGVCFs -R final.chr.fa -V dbferaw.g.vcf.gz -O dbfegt.vcf.gz
java -Xmx128G -jar /home/tilapia/srcs/gatk-4.2.0.0/gatk-package-4.2.0.0-local.jar VariantFiltration -V dbfeSNPs.vcf -filter "QD < 5.0" --filter-name "QD5" -filter "QUAL < 40.0" --filter-name "QUAL40" -filter "SOR > 3.0" --filter-name "SOR3" -filter "FS > 20.0" --filter-name "FS20" -filter "MQ < 50.0" --filter-name "MQ50" -filter "MQRankSum < -12.5" --filter-name "MQRankSum-12.5" -filter "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8" -window 30 -cluster 3 -O dbfeSNPs_filtered30-3.vcf
/opt/anaconda3/bin/vcftools --vcf dbfeSNPs_filtered30-3.vcf --remove-filtered-all --recode --recode-INFO-all --out finaldbfe30-3
/opt/anaconda3/bin/vcftools --vcf finaldbfe30-3.recode.vcf --extract-FORMAT-info GT --out gtdbfe30-3

#mismatch & coverage 
samtools view -h /home/tilapia/xuluohao/dabao/female/dbfe.groupmk.bam chrZ  | awk '$1~/@/ || $16=="NM:i:0" || $16=="NM:i:1" || $16=="NM:i:2"' | samtools view -O BAM -o chrz.mismatch2.bam
samtools depth -m 100 -Q 60 chrz.mismatch2.bam > dbfe.chrznm2.depth.txt
awk '{print $1"\\t"$2-1"\\t"$2"\\t"$3}' dbfe.chrznm2.depth.txt > dbfe.chrznm2.depth.bed
bedtools map -a db.w50s20k.chrz.bed -b dbfe.chrznm2.depth.bed -c 4 -o median,mean,count  > db.chrznm2.region.50k20k.cov
