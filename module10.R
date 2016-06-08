runif(5, min=1,max=5)
rnorm(5, mean=2,sd=1)
rgamma(5, shape=2,rate=1)
rbinom(5,size=100,prob=0.3)
rmultinom(5,size=100,prob=c(0.3, .2, .5))

generate <- function() {
	rnorm(25,mean=25,sd=1)
}
generate()
#Exercise 9.1

mydata <- replicate(9, generate())
a<-c(3,3)
plot(mydata)
c<-rnorm(25, mean=2,sd=1)*9
plot(rnorm(25, mean=2,sd=1))
curve(density(mydata))
par(mydata, mfrow = c(3, 3),lwd=3)

x<-rnorm(1000)
plot(density(x), xlim=c(-8,16))
y<-rnorm(1000,mean=8)
lines(density(y),col="blue")
lines(density(rnorm(1000,sd=2)), col="red")
lines(density(rnorm(1000,mean=8m,sd=2)), col="green")
lines(density(rnorm(1000,sd=4)), col="purple")
lines(density(rnorm(1000,mean=8,sd=2)), col="cyan")

#Exercise10.2
my.ozone<-airquality$Ozone[!is.na(airquality$Ozone) & airquality$Ozone>1]
mean.1<-mean(my.ozone)

sd.1<-sd(my.ozone)
length(my.ozone)
rm<-rnorm(115,mean=mean.1,sd=sd.1)
qqplot(my.ozone, rm)
lines(0:200,0:200,type="l",lwd=3,col=>"Red")
lines(rm,col="green")
#B

mean.2<-mean(log(my.ozone))
sd.2<-sd(log(my.ozone))
rm2<-rnorm(115,mean=mean.2,sd=sd.2)
qqplot(my.ozone,exp(rm2))

#3
doone<- function() {
	x <-sum(sample(1:6,2,replace=T))
	y<-sum(sample(1:6,x,replace=T))
	y
}
set.seed(457778)
yvalues<-replicate(1000,doone())
hist(yvalues)

##Lab10
my.data <- read.csv('data/Lab10.csv')
data1<-my.data$systolic.bp[my.data$Genotype=="BA"]
data2<-my.data$systolic.bp[my.data$Genotype=="BB"]
testResult <- t.test(data1,data2)
plot(density(data1))
lines(density(data2),col="blue")

n1<-length(data1)

sim  <- function() {
my.new.data<-my.data
my.new.data$Genotype<-"BB"
index.temp<-sample(1:50,n1)  
my.new.data$Genotype[index.temp]<-"BA"
new.data1<-my.new.data$systolic.bp[my.new.data$Genotype=="BA"]
new.data2<-my.new.data$systolic.bp[my.new.data$Genotype=="BB"]
t.test(new.data1,new.data2)$statistic
}

my.t.values <- replicate(10000,sim())
tail(my.t.values)

set.seed(554)