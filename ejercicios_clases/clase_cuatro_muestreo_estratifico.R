###muestreo estatificado 
#en el ejercicio iris viene estratificado por el tipo de flores###
#El ejercicio es sacar una muestra de 12, unidades de 4 muestras por cada tipo de
#flor se sacaran con reposicion y luego se unen las muestras.

#Fijar la semilla
set.seed(25)

#hallar las flores de la muestra de cada una de las especies 
fls.muestra.setosa= sample(1:50,4,replace = TRUE)
fls.muestra.versicolor=sample(51:100,4,replace = TRUE)
fls.muestra.virginica=sample(101:150,4,replace = TRUE)

#Ahora juntamos las tres muestras realizadas a cada especie
#rbind: Esta funcion sirve para unir filas 
(muesrta.iris.estrati=rbind(iris[fls.muestra.setosa,],iris[fls.muestra.versicolor,]
                            ,iris[fls.muestra.virginica,]))
