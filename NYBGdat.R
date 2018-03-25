###get data from NYBG


###d/l data from https://www.gbif.org/dataset/d415c253-4d61-4459-9d25-4015b9084fb0
###unzip, file 'occurence.txt' has the data

##read data
	scan("occurrence.txt",what="character",sep="\t",n=1e6)->dat

###identify 'block text'
	grep("\t",dat)->block.id

###source 'insert' subroutine
	source("insert.R")

	block.id[1]->t1
	strsplit(dat[t1],"\t")->newdat
	insert(dat,t1,newdat)->dat
