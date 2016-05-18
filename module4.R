matrix(nrow=3,ncol=3)
#extract the numbers with abs < 3
index <-abs(x)<3
x[index]

x<-matrix(1:12,4)
x
x[cbind(c(1,3,2),c(3,3,2))]
cbind(c(1,3,2),c(3,3,2))
x
x[c(1,3,2),c(3,3,2)]

#Adding names to a matrix
dimnames(x)[[2]]<-paste("data", 1:3,sep="")
dimnames(x)[[1]]<-paste("obs", 1:4,sep="")
rownames(x)
colnames(x)

#Exercise4.3
row<-matrix(rep(1:100,100),nrow=100)
column<-matrix(rep(1:100,100),nrow=100,byrow=T)
A<-3*column^3/(1+row*column)
row
column
A
sum(A)
sum(A[,1])
A[,1]

#Knowledge Checks
z<-rep(9:10,1)
z

#Constructs a matrix by row
matrix(1:9, ncol=3, byrow=TRUE)