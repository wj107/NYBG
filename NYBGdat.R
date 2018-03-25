###get data from NYBG

###d/l data from https://www.gbif.org/dataset/d415c253-4d61-4459-9d25-4015b9084fb0
###unzip, file 'occurence.txt' has the data

##read data
	scan("occurence.txt",what="character",sep="\t")->dat

###put into matrix
	datt<-matrix(dat,ncol=64,byrow=T)

