print('holii')
setwd("C:/Users/Rafael/Archivos/Universidad/Ciencias/Fisica/TecnicasBazo/Tarea1/")
getwd()
data<-read.table("NuAstro_4yr_IceCube_Data.txt")
print("Hay errores en la fuente")
print(data[30:36,])
print("Se eliminan los datos incompletos")
data<-data[complete.cases(data),]  ##Eliminar los datos incompletos
data[30:36,]
y<-summary(data$V9)
str(y)
tll<-names(y)[y>1]
show<-data[data$V9==tll[1],]
trck<-data[data$V9==tll[2],]
print("Los eventos tipo track")
trck
print("Los eventos tipo shower")
show
trck2<-as.numeric(as.character(trck$V8))
show2<-as.numeric(as.character(show$V8))
med<-function(x) {sum(x)/length(x)}
print("La media de los tracks es")
mean(trck2)
med(trck2)
print("La media de los showers es")
mean(show2)
med(show2)
dum<-data$V5[2:length(data$V5)]
z<-as.numeric(as.character(dum))*24*3600
date<-function(x){as.POSIXct('1858-11-17',tz='UTC')+x}
print("Las fechas en GMT")
V10<-append("GMT",as.character(date(z)))
V11<-append("posix",date(z))
data2<-cbind(data,V10,V11)
#sd<-as.POSIXlt(date(z))$mon
#sd
#as.POSIXlt(data2[2:53,11])
evt_month<-function(dat,mes){
  dum<-dat$V5[2:length(dat$V5)]
  z<-as.numeric(as.character(dum))*24*3600
  d2<-as.POSIXlt(date(z))$mon
  d3<-as.POSIXlt(date(z))$year
  d3<-d3[d2==mes-1]
  return(table(d3))
}
evs<-evt_month(data2,4)
dum<-as.numeric(as.character(evs))==max(evs)
names(unclass(evs))[dum]