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
names(y)[y>1]