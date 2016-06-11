library(ggplot2)
qplot(carat, price, data=diamonds)
gplot(carat, price, data=diamonds, color = cut, log ="xy", facets=~clarity)

p<- ggplot(data = diamonds)
p<-p + aes(x=carat, y=price)
p<- p + geom_point()
p

d <- ggplot(data = diamonds)
d <- d + aes(depth, price)
d <- d + geom_point()
d <- d + geom_density_2d()
d
?geom_point

ggplot(diamonds) + aes(price, fill=cut) + geom_density(alpha=.3)

summary(diamonds$depth)
ggplot(diamonds) + cut(diamonds$depth, breaks=5) + geom_density(alpha=.3)
depth.groups <- cut(diamonds$depth, breaks = 40 + (0:5)*8)
ggplot(diamonds)+aes(price, fill=depth.groups)+geom_density(alpha=.3)

##ggmap
#2 teps process:
#1)download rater data for map, specifying a) location of center b) zoom factor
# mylocation<- "University of Washington"
# mylocation<- c(lon=-106.4407, lat=31.76788)
#zoom factor: 3 =continent, 10=city, 21=building

#2) create map with ggmap() and overlay it with geoms
install.packages("ggmap")
library(ggmap)
mapData <- get_map(location = c(lon=-0.016179, lat=51.538525), color="color", source="google", maptype="roadmap", zoom=16)

ggmap(mapData, extent="panel", ylab="Latitude", xlab="Longitude")

center<-geocode("University of Washington")
ggmap(get_map(location=center, source="google", zoom=19), extent="panel")

mv_collisions
for(i in 1:nrow(mv_collisions)) {
	latlon = geocode (mv_collisions$state[i])
	mv_collisions$lon[i] = as.numeric(latlon[1])
	mv_collisions$lat[i] = as.numeric(latlon[2])
}
usa_center = geocode("United States")
USA <- ggmap(getmap(location=usa_center, zoom=4))
circle_scale<-0.04
USA + geom_point(aes(x=lon,y=lat), data=mv_collisions, col="red", alpha=0.4, size=mv_collisions$collisions*circle_scale)
#Exercise3
str(state.x77)
mydata <- as.data.frame(state.x77)
mydata$Murder
state_names <- row.names(mydata)
mydata[1,"Lon"]
for (i in 1:nrow(mydata)) {
	cat(i)
	latlon = geocode(state_names[i])
	if (length(latlon) >= 2) {
		#print(latlon[1])
		#print(latlon[2])
#		cat(i)
		mydata[i, "Lon"] <- as.numeric(latlon[1])
		mydata[i, "Lat"] <- as.numeric(latlon[2])	
	}
}
usa_center = geocode("United States")
USA <- ggmap(get_map(location=usa_center, zoom=4))
circle_scale<-0.04
USA + geom_point(aes(x=Lon,y=Lat), data=mydata, col="red", alpha=0.4, size=mydata$Murder*1)

#Lab

my.data<-data.frame(federal.states=c("Baden-Württemberg","Bayern","Berlin","Brandenburg","Bremen","Hamburg","Hessen", "Mecklenburg-Vorpommern","Niedersachsen","Nordrhein-Westfalen","Rheinland-Pfalz","Saarland","Sachsen","Sachsen-Anhalt","Schleswig-Holstein","Thüringen"), Population=c(10716644,12691568,3469849,2457872,661888,1762791,6093888,1599138,7826739,17638098,4011582,989035,4055274,2235548,2830864,2156759))
str(my.data)
my.data$federal.states<-as.character(my.data$federal.states)
latlon <- geocode(my.data$federal.states)
my.data$federal.states[1]<-"Baden-Wurttemberg"
my.data$federal.states[16]<-"Thuringen Germany"
my.data <- cbind(my.data,latlon)
Germany <- ggmap(get_map(location="Germany",zoom=6), extent="panel")
circle_scale<-0.000002
Germany + geom_point(aes(x=lon,y=lat), data=my.data, col="red",alpha=0.4,size=my.data$Population*circle_scale)