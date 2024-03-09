#ejercicio de muestreo sistematico

#la semilla de aleatoriedad ejercicio con la tabla iris, para que me de siempre 
#mismo valor
set.seed(15)
#hallamos la etiqueta de la primera flor  que sera 1 de 150
# se coloca en doble parentesis para que la guarde y la deje imprimir 

(primera.flor= sample(1:150,1))

# realizamos el incremento como queremos queremos que aumente 
#floor= es suelo base de aumento, como se aumentara

incremento=floor(150/10)
#El incremento lo saca dividiendo la poblacion en el numero de la muestra 
#elegimos las flores de la muestra 
#seq= secuencia 
flores.elegidas.10.siste=seq(from=primera.flor,by=incremento,length.out = 10)
#como las etiquetas elegidas no estan entre 1 y 150 se deben transformar crear un
#intervalo para qu no se pasen 
flores.elegidas.10.siste=flores.elegidas.10.siste%%150
#calculamos la subtabla de las flores de la muestra 
muestra.iris.10.siste=iris[flores.elegidas.10.siste,]
#Imprimimos
print(muestra.iris.10.siste)
