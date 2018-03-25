########insert one vector into another

insert<-function(vec,insert.point,insert.vec){
	vec1<-vec[1:(insert.point-1)]
	vec2<-vec[(insert.point+1):length(vec)]
	out<-c(vec1,insert.vec,vec2)
	out}
