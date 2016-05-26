getwd()
mydata<-read.table('data/data.exercise5.1.dat', skip=1,header=T)
mydata

mydata<-read.table('data/data.exercise5.2.dat', sep=";", skip=2,header=T)
mydata<-read.csv2('data/Exercise 5.3.csv',skip=2,sep=",")
#Opens connection to a data file
f1<-file("read.txt", open="r")
#Reading pointer increases as we read
scan(f1,what="",nlines=1)
scan(f1,what=double(),nlines=1)
readLines(f1)
close(f1)

f1<-file("data/Exercise 5.4a.txt",open="r")
mynames<-scan(f1,what="",nlines=1,skip=1)
mydata<-read.table(f1)
close(f1)
mynames<-paste(mynames[c(1,3,5)], mynames[c(2,4,6)])
names(mydata)<-mynames
mydata

mydata<-list()
mynames<-character(2)
f1<-file("data/Exercise 5.4b.txt", open="r")
mynames[1]<-scan(f1,what="",nlines=1,skip=1)
mydata[[1]]<-scan(f1,nlines=1)
mynames[2]<-scan(f1,what="",nlines=1)
mydata[[2]]<-matrix(scan(f1),nrow=4,byrow=T)
close(f1)
names(mydata)<-mynames
mydata

f1<-file("data/Assignment 5.dat",open="r")
my.data<-read.table(f1,skip=4,comment.char="%",nrows=7)
my.data2<-read.table(f1,skip=3,sep=";",dec=",",nrows=2)
my.data3<-read.table(f1,skip=5,na.strings="-9999",sep=",",nrows=2)
my.all.data<-rbind(my.data,my.data2,my.data3)
my.all.data