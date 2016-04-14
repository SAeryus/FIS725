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