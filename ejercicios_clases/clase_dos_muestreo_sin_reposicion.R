#ejercicios de muestreo aleatorio sin reposicion 
#sample = muestra
#replace= reposicion
sample(1:100,15,replace = FALSE)

#ejercicio siguiendo el formato de las flores iris
#sembrar la semilla de la aleatoriedad
set.seed(4)
flores.elegidas.10.sin=sample(1:150,10,replace = FALSE)
#calculamos la subtabla de las flores de la muestra
muestra.iris.10.sin=iris[flores.elegidas.10.sin,]
# el simbolo "," es por que quiero que salgan todas las columnas
#imprimimos la tabla de la muestra
print(muestra.iris.10.sin)
