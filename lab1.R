my.display <- function(x, display = FALSE, type = "", prob = TRUE) {
	#type = 'hist' || 'density'
	if (display & type == "") {
		return(cat("Please specify type as either hist or density"))
	} else if (display & type == 'hist') {
		return(hist(x, freq = prob))
	} else if (display & type == 'density') {
		return(density(x))
	} else {
		#return('N args specified')
		median(x)
	}
	#cat('summary of input:\n', summary(x))
}
set.seed(1234)
my.data<-rnorm(200)
my.display(my.data)
my.display(my.data,display=TRUE,type="hist")
my.display(my.data,display=TRUE,type="hist",probValue=TRUE)
my.display(my.data,display=TRUE,type="density")
my.display(my.data,display=TRUE)