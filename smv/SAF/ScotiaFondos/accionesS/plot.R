library(lubridate)
library(dplyr)
library(rCharts)
library(reshape2)
setwd("C:/Users/Arturo Chian/Documents/smv/SAF/ScotiaFondos/accionesS")
a<-read.csv("data.csv") 
a$Fecha<-dmy(a$Fecha) #a$Fecha
a$Fecha<-as.character(a$Fecha);
a$Patrimonio<-as.numeric(as.numeric(gsub(",","", a$Patrimonio)))
a$Nº.Partícipes<-as.numeric(as.numeric(gsub(",","", a$Nº.Partícipes)))
a$Nº.de.Cuotas<-as.numeric(as.numeric(gsub(",","", a$Nº.de.Cuotas)))
sapply(a,class)
a2<-melt(a,id=c("Fecha"))
a2<-as.tbl(a2)
#table(a2$variable)
# head(a2)
# View(a2)
a2$Fecha<-as.Date(a2$Fecha)
#a2<-filter(a2, variable %in% c("Tipo.Cambio"))
a2<-filter(a2, variable %in% c("Valor.Cuota","Nº.Partícipes","Nº.de.Cuotas"))
a2<-filter(a2, variable %in% c("Valor.Cuota"))

n1 <- nPlot(
  value~Fecha,
  data = a2,
  group = "variable",  # even though only one series need to specify group
  type = "lineWithFocusChart"
)

n1$xAxis( tickFormat="#!function(d) {return d3.time.format('%Y-%m-%d')(new Date( d * 86400000 ));}!#" )
n1
n1$save("cuotas.acciones.html", cdn = TRUE)
SANCRTO

library(ggplot2)
ggplot(a, aes(Fecha, Valor.Cuota)) + geom_line()





a$Fecha





library(dygraphs)
head(a)
sapply(a,class)
a$Fecha<-as.Date(a$Fecha)
library(xts)
a3 <- as.xts(a)
?xts

head(a)


devtools::install_github(c("ramnathv/htmlwidgets", "rstudio/dygraphs"))
library(dygraphs)
dygraph(nhtemp, main = "New Haven Temperatures") %>%
  dyAxis("y", label = "Temp (F)", valueRange = c(40, 60)) %>%
  dyOptions(fillGraph = TRUE, drawGrid = FALSE) %>%
  dyRangeSelector()
View(nhtemp)
