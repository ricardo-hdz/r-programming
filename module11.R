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
str(wine.df)
model<-lm(price ~ year + temp + h.rain + w.rain + h.rain*w.rain, wine.df)
model1<-lm(price ~  h.rain + h.rain*w.rain, wine.df)
summary(model1)
drop1(model, year + temp + w.rain)
coef(model)[4]+800*coef(model)[6]

newdata <- subset(wine.df, temp >= mean(wine.df$temp) & h.rain >= mean(wine.df$h.rain) & w.rain >= mean(wine.df$w.rain))
predict(model, temp=mean(wine.df$temp), h.rain=mean(mean(wine.df$h.rain)),w.rain=mean(mean(wine.df$w.rain)))

modellog<-lm(log(price) ~ year + temp + h.rain + w.rain + h.rain*w.rain, wine.df)
drop1(modellog,test="F")
modellog<-update(modellog, ~.-h.rain:w.rain)
summary(modellog)

newset <- data.frame(year=1985, temp=mean(wine.df$temp), h.rain=mean(wine.df$h.rain), w.rain=mean(wine.df$w.rain))
exp(predict(modellog, newdata = newset))
