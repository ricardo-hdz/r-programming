set.seed(9007)
my.data<-data.frame(x=rnorm(10),y=rnorm(10)+5,z=rchisq(10,1))
additional.data<-data.frame(x=rnorm(3),y=rnorm(3)+5,z=rchisq(3,1))
write.table(my.data, file="data/Exercise 6.txt", row.names=F,col.names=F)
#cat()
#writeLines
#sink opens a connection to a file and writes to it instead to the R console
set.seed(45)
my.data<-data.frame(x=rnorm(10),y=rnorm(10),z=rnorm(10))
write.csv(my.data,file="data/6.2.csv",row.names=TRUE,col.names=TRUE,sep=";")

#dump()
#dput()
#dget()
#f2<-file("path", open="w")
#close(f2)
#append option can append data to an existing file

my.data<-data.frame(a=LETTERS[1:5],b=1:5)
write.table(my.data,file="data/6.2a.txt",sep=";",row.names=F)

my.text<-"TITLE extra line\n2 3 5 7\n11 13 17\nOne more line"
writeLines(my.text,con="data/6.2b.txt")

#save() saves object in R format
#load() restores object in R
#rm(list=ls()) removes all object in workspace

set.seed(45)
my.data<-data.frame(x=rnorm(10),y=rnorm(10),z=rnorm(10))
save(my.data,file="data/6.2.Rdata")
rm(list=ls())
ls()
load(file="data/6.2.Rdata")

set.seed(9007)
my.data<-data.frame(x=rnorm(10),y=rnorm(10)+5,z=rchisq(10,1))
write.table(round(my.data,digits = 2),"Assignment 6a.txt",row.names=FALSE)
write.table(format(my.data,digits = 20),"Assignment 6b.txt",row.names=FALSE)
my.data2<-my.data*10e5
write.table(my.data2,file="data/Assignment6c.txt",row.names=F)
dataRead<-read.table(file="data/Assignment6c.txt",header=T)
my.date3<-dataRead/10e5
my.data[1,1]-my.date3[1,1]
format(my.data[1,1]-my.date3[1,1],digits=20)