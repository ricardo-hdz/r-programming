y = c(-5,-4,-3,-2,-1,0,1,2)
myData = matrix(y, nrow=2,ncol=4)
myData

nrow(myData)
ncol(myData)
myData[2,]
myData[,1]
investigate = function(data) {
	isNegative = FALSE
	negativeElements = 0
	sumElements = 0
	numberRows = nrow(data)
	while (numberRows > 0) {
		
	for (i in data[numberRows,]) {
		if (negativeElements == 3) {
			break
		}
		if (i < 0) {
			isNegative = TRUE
			negativeElements = negativeElements + 1
		} else {
			sumElements = sumElements + i
		}
	}
	if (isNegative == FALSE) {
		cat('The mean of row number', i, 'is', mean(data[numberRows,]), '\n')
	} else if (negativeElements < 3) {
		cat('The mean of row number ', i, 'is', mean(data[numberRows,]), '\n')
		cat('<Row', i, 'contains negative values>\n')
	} else {
		cat('Too many negative values for row', numberRows, '\n')
	}
	numberRows = numberRows - 1
	#End while
	}
}
investigate(myData)
investigate(myData, 2)

set.seed(1786)
data.exercise.3.1<-exp(matrix(rnorm(2000),nrow=100))
index1.temp<-sample(1:100,10)
index2.temp<-sample(1:20,10)
for(i in 1:10){
data.exercise.3.1[index1.temp[i],index2.temp[i]]<--1
}

investigate(data.exercise.3.1)
######
y <- matrix(rnorm(1000000),nrow=1000)
z <- 0*y
time1<-as.numeric(Sys.time())
for (i in 1:10) {
	for (j in 1:10) {
		z[i,j]<-y[i,j]^2
	}
}
time2<-as.numeric(Sys.time())
z<-y^2
time3<-as.numeric(Sys.time())
(time2-time1)/(time3-time2)

calculateRuntime<-function(numberRows) {
y <- matrix(rnorm(1000000),nrow=numberRows)
z <- 0*y
time1<-as.numeric(Sys.time())
for (i in 1:numberRows) {
	for (j in 1:numberRows) {
		z[i,j]<-y[i,j]^2
	}
}
time2<-as.numeric(Sys.time())
z<-y^2
time3<-as.numeric(Sys.time())
#cat('Runtime ', (time2-time1)/(time3-time2))
return (time2-time1)/(time3-time2)
}

factors<-c(10,20,50,100,200,500,800,1000)
for (i in factors) {
	cat('Factor ', i, ' Runtime ', calculateRuntime(i), '\n')
}
#####

1. Create a data frame with 10 rows and 100.000 columns, and fill it with random
numbers generated with rnorm(). We want to calculate the mean of all 100.000
columns, and place it in a vector.
k1<-10
k2<-100000
my.data<-as.data.frame(matrix(rnorm(k1*k2),nrow=k1))
#my.data<-data.frame(data1=rnorm(10),data2=rnorm(10))
my.data
my.data[1,1]
lapply(my.data, mean)

2. Calculate the runtime factor from looping over the 100.000 columns and using the
mean function, in contrast to using sapply().

mean1<-numeric(k2)
mean2<-numeric(k2)
time1<-as.numeric(Sys.time())

for (i in 1:k2) {
	mean1[i]<-mean(my.data[,i])
}
time2<-as.numeric(Sys.time())
time3<-as.numeric(Sys.time())
mean2<-sapply(my.data, mean)
time4<-as.numeric(Sys.time())
(time2-time1)/(time3-time2)
####

#QUIZ

k<-1000
r<-100
set.seed(5556)
x<-as.data.frame(matrix(rnorm(r*k),nrow=r))
x
ncol(x)
my.summary<-matrix(nrow=4,ncol=k)
my.summary

###
Now, construct a summary matrix as follows:

my.summary<-matrix(nrow=4,ncol=k)
Write a loop that loops over the columns of x, and for each column stores the minimum, median, mean and maximum in the corresponding column of my.summary.

for (i in 1:k) {
	my.summary[1,i] <- min(x[,i])
	my.summary[2,i] <- median(x[,i])
	my.summary[3,i] <- max(x[,i])
	my.summary[4,i] <- mean(x[,i])
}
my.summary