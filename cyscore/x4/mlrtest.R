#!/usr/bin/env Rscript
args=commandArgs(trailingOnly=T)
trn=args[1]
tst=args[2]
c=read.csv(sprintf("trn-%s.csv",trn))[,2]
d=read.csv(sprintf("../tst-%s-yxi.csv",tst))
d["predicted"]=c[1]+c[2]*d[2]+c[3]*d[3]+c[4]*d[4]+c[5]*d[5]
write.csv(c(d["PDB"],d["pbindaff"],round(d["predicted"],2)),row.names=F,quote=F,file=sprintf("trn-%s-tst-%s-iyp.csv",trn,tst))
