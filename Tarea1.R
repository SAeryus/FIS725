print('holii')
#Parte A
setwd("C:/Users/Rafael/Archivos/Universidad/Ciencias/Fisica/TecnicasBazo/Tarea1/")
getwd()
data<-read.table("NuAstro_4yr_IceCube_Data.txt")
#Parte B
print("Hay errores en la fuente")
print(data[30:36,])
print("Se eliminan los datos incompletos")
data<-data[complete.cases(data),]  ##Eliminar los datos incompletos
data[30:36,]
#Parte C
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
#Parte D
dum<-data$V5[2:length(data$V5)]
z<-as.numeric(as.character(dum))*24*3600
date<-function(x){as.POSIXct('1858-11-17',tz='UTC')+x}
#Parte E
V10<-append("GMT",as.character(date(z)))
V11<-append("posix",date(z))
data2<-cbind(data,V10,V11)
print(data2)
#Parte F
mm<-function(x){
  if(x==1)return("Enero")
  else if(x==2)return("Febrero")
  else if(x==3)return("Marzo")
  else if(x==4)return("Abril")
  else if(x==5)return("Mayo")
  else if(x==6)return("Junio")
  else if(x==7)return("Julio")
  else if(x==8)return("Agosto")
  else if(x==9)return("Setiembre")
  else if(x==10)return("Octubre")
  else if(x==11)return("Noviembre")
  else if(x==12)return("Diciembre")
}
evt_month<-function(dat,mes){
  dum<-dat$V5[2:length(dat$V5)]
  z<-as.numeric(as.character(dum))*24*3600
  d2<-as.POSIXlt(date(z))$mon
  d3<-as.POSIXlt(date(z))$year+1900
  d3<-d3[d2==mes-1]
  print("Eventos para el mes")
  print(mm(mes))
  print(table(d3))
  tr<-as.numeric(table(as.POSIXlt(date(z))$mon))
  tr<-(as.numeric(names(table(as.POSIXlt(date(z))$mon)))+1)[tr==max(tr)]
  print("")
  print("El mes con mayor numero de eventos es:")
  print(mm(tr))
  return(table(d3))
}
#dum<-readline("Cual mes desea analizar")
evs<-evt_month(data2,3)
#Parte G
print("Grafico de la distribucion de eventos")
plot(xy.coords(as.numeric(as.character(data2[2:53,7])),as.numeric(as.character(data2[2:53,6]))),xlab = "R.A.",ylab = "Declination")