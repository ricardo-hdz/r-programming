dat <- merge(dat1, dat2, by.x="name",by.y="names")
data.frame.x<-data.frame(names=c("Gretha","Robert","John","Heather"),age=c(30,18,25,70),nickname=c("Qucksilver","The Man","Nifty","Starlight"))
data.frame.y<-data.frame("Person_name"=c("William","Nancy","Charlotte","Henry"),age=c(15,75,32,51),"pet_dog"=c("King","Whity","Captain Vom","Doggie"))
data.frame.x
data.frame.y
data.frame.try <- merge(data.frame.x, data.frame.y)
data.frame.try
data.frame.z<- merge(data.frame.x, data.frame.y, by.x=c("names","age"),by.y=c("Person_name","age"), all=TRUE)
data.frame.z

#subset
subset(data, Temp > 80,  select = c(Ozone, Temp))
subset(data, Temp > 80,  select = -Temp)
subset(data, select = Ozone:Wind)

str(iris)
subset(iris, Species == "setosa" & Sepal.Length < median(Sepal.Length), select=-Species)

#grep() returns index
#grep() returns logical
#sub(original, substitution, string)
lw<-c("culicoides", "europe", "mediterranean", "northern", "schmallenberg")
my.text<-"Over the last decade, bluetongue virus have spread northwards from the mediterranean area. Initially this was ascribed to climate changes, but it has since been realized that a major contributing factor has been new transmitting vectors, culicoides obsoletus and culicoides pulicaris, which have the ability to aquire and transmit the disease. Recently, schmallenberg virus has emerged in northern europe, transmitted by biting midges as well."
my.new.text<-my.text
for (i in 1:length(lw)) {
	my.new.text<-gsub(lw[i], toupper(lw[i]), my.new.text)
}
my.new.text

set.seed(885)
my.posixct<-as.POSIXct(sample((60*60*24*365*50):(60*60*24*365*55),20), origin = as.Date("1960-01-01"))
my.posixct
date.time<-my.posixct + (2*60*60 + 30*60 + 10)
date.time
head(date.time)
head(my.posixct)

#Lab
set.seed(449)
my.dates<-as.Date(sample(18000:20000,20), origin = "1960-01-01")
my.days<-c(julian(my.dates,origin=as.Date("1960-01-01")))
my.days[3]

set.seed(119)
my.days<-sample(18000:20000,20)
Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")
install.packages("chron")

my.days.structure<-month.day.year(my.days,origin=c(1,1,1960))
my.date.info<-data.frame(Weekday=weekdays(my.dates),my.days.structure)
tail(my.date.info)