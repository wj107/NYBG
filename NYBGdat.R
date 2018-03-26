###get data from NYBG


###d/l data from https://www.gbif.org/dataset/d415c253-4d61-4459-9d25-4015b9084fb0
###unzip, file 'occurence.txt' has the data


NYBG<-function(N){

##read data
	scan("occurrence.txt",what="character",sep="\t",n=N)->dat


###identify 'block text'
	grep("\t",dat)->block.index
	length(block.index)->Nblock

if(!Nblock==0){

###create list of blockdata
dat[block.index]->blocks

	lapply(blocks,function(x) gsub("\n","\t",x))->blocks
	lapply(blocks,function(x) unlist(strsplit(x,"\t")) )->blocks
	
	sapply(blocks,length)-1->block.length
	
	block.index.add<-cumsum(block.length)
	block.index.add<-c(0,block.index.add[-Nblock])

block.index<-block.index+block.index.add	

###'insert' subroutine
insert<-function(vec,insert.point,insert.vec){
	vec1<-vec[1:(insert.point-1)]
	vec2<-vec[(insert.point+1):length(vec)]
	out<-c(vec1,insert.vec,vec2)
	out}

	
####set loop:
	for (i in 1:Nblock)  insert(dat,block.index[i],blocks[[i]])->dat
}

length(dat)%%64->last
dat<-c(dat,rep("",64-last))
dat<-matrix(dat,ncol=64,byrow=T)

dat.names<-dat[1,]
dat<-as.data.frame(dat[-1,])
names(dat)<-dat.names

dat
}
