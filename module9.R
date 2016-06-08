presidents
summary(presidents)
tapply(presidents, cycle(presidents), mean, na.rm=T)
cycle(presidents)
#attach()
#detach()

#searchpaths()
cut(airquality$Wind, 10)
tapply(airquality$Solar.R, cut(airquality$Wind, breaks=2*(1:11)-1), mean, na.rm=T)

my.data<-data.frame(Treatment=c(rep("A",4),rep("B",4)), Stone=rep(rep(c("Small","Large"),c(2,2)),2),Success=rep(c(1,0),4),Count=c(81,6,192,71,234,36,55,25))
my.data
my.table<-xtabs(Count~Treatment+Success+Stone,data=my.data) 
my.table<-xtabs(Count~Treatment+Success+Stone,data=my.data)
prop.table(margin.table(my.table, 1:2),1)
prop.table(my.table[,,2],2)
prop.table(my.table[,,2],1)
prop.table(my.table[,,1],2)
prop.table(my.table[,,1],1) 
prop.table(my.table[,,1],1)
 prop.table(my.table[1,,],2)
 prop.table(my.table[2,,],2)
 margin.table(my.table, c(1,3))