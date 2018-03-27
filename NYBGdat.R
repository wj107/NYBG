###get data from NYBG


###d/l data from https://www.gbif.org/dataset/d415c253-4d61-4459-9d25-4015b9084fb0
###unzip, file 'occurence.txt' has the data

#-------function call:  start at data entry M, read until entry N
	NYBG<-function(
		#---how many lines to read??
			lines=1e2,
		#---what line to begin reading from?  default at 0			
			start=0){

#----read first line for header (read quietly!!!)
	scan("occurrence.txt",what="character",sep="\t",n=64,quiet=T)->dat.names

#----if start=0, change start (since dat.names is really start==0)
	if(start==0) start<-1

#----read data (skip 'start' lines, nlines = 'lines'
	scan("occurrence.txt",what="character",sep="\t",skip=start,nlines=lines)->dat

#----identify 'block text' within scan
	grep("\t",dat)->block.index
#----how many blocks??
	length(block.index)->Nblock

#---only if you have blocks.... unpack them!!
	if(!Nblock==0){

	#----amass all blocks in a list
		dat[block.index]->blocks
	#----replace all line breaks with tabs
		lapply(blocks,function(x) gsub("\n","\t",x))->blocks
	#----split blocks at tabs
		lapply(blocks,function(x) unlist(strsplit(x,"\t")) )->blocks
	#----how many entries in each block?
		sapply(blocks,length)-1->block.length
	
	#---figure out where to add each block into the main data
		#---total number of blocked entries, across all blocks
			block.index.add<-cumsum(block.length)
		#---size of blocks tells us how much to 'shift' the main data... start at 0 (first block doesn't shift anything)
			block.index.add<-c(0,block.index.add[-Nblock])
		#---block index = where to add the data after shifting
			block.index<-block.index+block.index.add	
	
#--------'insert' subroutine----------------
#--------for inserting blocks to 'main' data
#-------------------------------------------

insert<-function(vec,insert.point,insert.vec){
	vec1<-vec[1:(insert.point-1)]
	vec2<-vec[(insert.point+1):length(vec)]
	out<-c(vec1,insert.vec,vec2)
	out}

#----insert each of the blocks at the given block index.  loop through all blocks.
	for (i in 1:Nblock)  insert(dat,block.index[i],blocks[[i]])->dat

#---end blocks!
}


#length(dat)%%64->last
#dat<-c(dat,rep("",64-last))


#----------------------
#---clean data!

	#---organize data in matrix form
		dat<-matrix(dat,ncol=64,byrow=T)
	#---save as data.frame
		dat<-as.data.frame(dat,stringsAsFactors=F)

#---------convert variables to appropriate type!
	#--what columns are numeric?  factors?
		fac<-c(33)
		num<-c(42,43)
	#---convert columns via loop
		for (i in fac) dat[,i]<-factor(dat[,i])
		for (i in num) dat[,i]<-as.numeric(dat[,i])

	#----now bring in the names
		names(dat)<-dat.names

	#----OUTPUT!!!	
		dat
}
