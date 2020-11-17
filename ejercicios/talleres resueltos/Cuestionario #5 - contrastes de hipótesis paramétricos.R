

Pregunta 4:
  1 - pt(3.7, 19)

library(dplyr)
mydata<-mtcars
muestra.automaticos = filter(mydata, am == 0)
muestra.manuales = filter(mydata, am == 1)

binom.test(dim(muestra.automaticos)[1], dim(mydata)[1], p=.5,
           alternative = "greater", conf.level = .95)
#equivalentemente
binom.test(19, 32, p = 0.5, alternative = "greater", conf.level = .95)

#Pregunta 7:
mydata$mpg
t.test(muestra.automaticos$mpg, muestra.manuales$mpg, mu=0, 
       alternative = "two.sided", var.equal = TRUE)

#Pregunta 8:
table(muestra.automaticos$vs)
table(muestra.manuales$vs)

matriz.fisher = table(mydata$vs, mydata$am)
matriz.fisher = rbind(matriz.fisher[2,], matriz.fisher[1,])

fisher.test(matriz.fisher)

#Pregunta 9:
#mpg manual > mpg automatica

var.test(muestra.manuales$mpg, muestra.automaticos$mpg, 
         alternative = "greater", conf.level = .95)

#Pregunta 10:
cars
cars$hip = 4*cars$speed-17
t.test(cars$hip, cars$dist, mu=0, alternative = "two.sided",
       paired = TRUE, conf.level = .95)

matriz.prop.empar = table(mtcars$am, mtcars$vs)
matriz.prop.empar = rbind(matriz.fisher2[2,], matriz.fisher2[1,])
#matriz.fisher2 = rbind(matriz.fisher2[,2], matriz.fisher2[,1])

mcnemar.test(matriz.prop.empar)
