# Tarea 15: Ejercicios ANOVA.
# 1. Doce personas son distribuidas en 4 grupos de personas 3 cada uno. A cada grupo, se le asigna aleatoriamente
# un tiempo distinto de entrenamiento antes de realizar una tarea. Los resultados en la mencionada tarea, con el
# correspondiente tiempo de entrenamiento, son los siguientes:
  
# Ver si podemos rechazar la hipótesis nula: H0 : µ1 = µ2 = µ3 = µ4.

# ANOVA de un factor
resultados.tareas = c(1,3,5,4,6,2,3,5,7,8,10,6)
tiempos = as.factor(rep(c(0.5,1,1.5,2), each=3))
tabla.tareas = data.frame(resultados.tareas, tiempos)

# Antes de realizar la prueba ANOVA verifiquemos que se cumplen las condiciones
# Test de normalidad de los datos, dado que tenemos muy pocas datos por submuestra
# no podemos utilizar ni lilliefors.test ni ad.test por lo que usaré shapiro.test
library(nortest)
sapply(levels(tabla.tareas$tiempos),
       function(x){
         shapiro.test(tabla.tareas[tabla.tareas$tiempos==x, "resultados.tareas"])
       })
# Dado que el p-value es muy grande aceptamos que los datos siguen una distribución normal

# Test de homocedasticidad de la submuestras
library(car)
bartlett.test(tabla.tareas$resultados.tareas, tabla.tareas$tiempos)
# Dado que el p-value es muy grande aceptamos que los datos por cada submuestra 
# son homocedasticos

#Por lo que procedemos a realizar el ANOVA
summary(aov(resultados.tareas~tiempos, data=tabla.tareas))

# 2. Se registraron las frecuencias de los días que llovió a diferentes horas, 
# durante los meses de enero, marzo, mayo y julio. Los datos obtenidos, durante un periodo 
# de 10 años, fueron los siguientes:
  
total.dias.lluvia = c(22,21,17,20,16,21,25,19,23,31,15,35,
                      24,18,26,25,23,23,11,16,17,24,24,20)
mes = as.factor(rep(c("enero","febrero","marzo","julio"), each = 6))
hora = as.factor(rep(c(9,10,11,12,13,14), times=4))
tabla.frecuancias.clima = data.frame(total.dias.lluvia,mes,hora)

# Estudiar la variabilidad entre meses y entre horas
library(nortest)
sapply(levels(tabla.frecuancias.clima$mes),
       function(x){
         lillie.test(tabla.frecuancias.clima[tabla.frecuancias.clima$mes==x, "total.dias.lluvia"])
       })

sapply(levels(tabla.frecuancias.clima$hora),
       function(x){
         shapiro.test(tabla.frecuancias.clima[tabla.frecuancias.clima$hora==x, "total.dias.lluvia"])
       })

bartlett.test(tabla.frecuancias.clima$total.dias.lluvia, tabla.frecuancias.clima$mes)
bartlett.test(tabla.frecuancias.clima$total.dias.lluvia, tabla.frecuancias.clima$hora)
