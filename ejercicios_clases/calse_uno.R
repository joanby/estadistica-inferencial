#Para hacer un muestreo con 100 bolas, sacando 15 con reposicion
sample(1:100,15, replace = TRUE)


#Para listar la tabla de datos  iris head son las cinco primeras
head(iris)

#Solo con iris salen todas
(iris)

#Para que la muestra se al misma se debe iniciar con 
#cuatro es cualquier cosa que me acuerde es como el nombre de la muestra
set.seed(4)

#Se define el nombre de la variable== flores.elegidas.con=
flores.elegidas.10.con= sample(1:150,10,replace= TRUE)

#Luego se calculan la subtabla de las flores de la muestra con 
muestra.iris.10.con = iris[flores.elegidas.10.con,]

#Luego para imprimir el ejercicio hago el siguiente
print(muestra.iris.10.con)
