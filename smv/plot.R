library(lubridate)
library(dplyr)
library(rCharts)
library(reshape2)
setwd("C:/Users/Arturo Chian/Documents/smv/SAF/ScotiaFondos/Premium$")
a<-read.csv("data.csv") #sapply(a,class)
a$Fecha<-as.character(a$Fecha);a$Fecha<-dmy(a$Fecha) #a$Fecha

a2<-melt(a,id=c("Fecha"))
a2<-as.tbl(a2)
a2$value<-as.numeric(as.numeric(gsub(",","", a2$value)))
#table(a2$variable)
# head(a2)
# View(a2)
a2$Fecha<-as.Date(a2$Fecha)
#a2<-filter(a2, variable %in% c("Tipo.Cambio"))
a2<-filter(a2, variable %in% c("Valor.Cuota","Nº.Partícipes","Nº.de.Cuotas"))


n1 <- nPlot(
  value~Fecha,
  data = a2,
  group = "variable",  # even though only one series need to specify group
  type = "lineWithFocusChart"
)

n1$xAxis( tickFormat="#!function(d) {return d3.time.format('%Y-%m-%d')(new Date( d * 86400000 ));}!#" )
n1
n1$save("d.html", cdn = TRUE)
SANCRTO
