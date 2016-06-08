str(airquality)
lmobj<-lm(log(Ozone) ~ Solar.R + Wind +Temp,  data=subset(airquality, Ozone = 1))
summary(lmobj)

qqnorm(lmobj$res)
sd.1<-sd(lmobj$res)
lines()
summary(lmobj)
names(lmobj$coefficients)
names(lmobj)

newdata<-subset(airquality, Ozone = 1)
lmobj1<-lm(log(Ozone) ~ Solar.R + Wind +Temp,  drop1(newdata, Solar.R))
drop1(lmobj, Wind + Temp)
?drop1

install.packages("UsingR")
library("UsingR")
Sys.setlocale("LC_ALL","English")
load("UsingR")
summary(father.son)
lm(sheight ~ fheight, father.son)

install.packages("R330", dependencies=T)
install.packages("rgl")
library("rgl")
??install.packages
library("R330")
data(wine.df)