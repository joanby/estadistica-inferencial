# Cuestionario 9: Cuestionario práctico de ANOVA

# Pregunta 1: 
# Consideremos la tabla de datos mtcars de R. Nos da 11 características de 32 automóviles. 
# Queremos testear si las medias de las submuestras de la  variable mpg (número de millas 
# recorridas por galón de combustible) segregada según los valores de la variable cyl 
# (número de cilindros del automòbil) son la misma o no. ¿Podemos decir que las submuestras 
# anteriores son balanceadas?

table(mtcars$cyl)
#Entonces: No, ya que el tamaño de cada submuestra no es el mismo.

# Pregunta 2:
# Consideremos la tabla de datos mtcars de R. Nos da 11 características de 32 automóviles. 
# Queremos testear si las medias de las submuestras de la  variable mpg (número de millas 
# recorridas por galón de combustible) segregada según los valores de la variable cyl 
# (número de cilindros del automòbil) son la misma o no.  Para ello, en primer lugar 
# creamos una subtabla a partir de la tabla de datos mtcars que contenga sólo los 7 
# primeros automóbiles con 4, 6 y 8 número de cilindros que son los posibles valores de la 
# variable cyl. Si realizamos el test ANOVA correspondiente usando la subtabla creada, 
# ¿podemos afirmar que las medias de la variable mpg son las mismas según las submuestras 
# creadas por la variable cyl? Tenéis que dar el estadístico de contraste, la condición del 
# p-valor del contraste y la conclusión pertinente.

mpg = c(mtcars[mtcars$cyl==4, "mpg"][1:7],
        mtcars[mtcars$cyl==6, "mpg"][1:7],
        mtcars[mtcars$cyl==8, "mpg"][1:7])
cyl = as.factor(rep(c(4,6,8), each=7))
tabla.anova.mpg = data.frame(mpg, cyl)
summary(aov(mpg~cyl, data = tabla.anova.mpg))

# Pregunta 3
# Si realizamos el test ANOVA correspondiente usando la subtabla creada y hemos rechazado la 
# hipótesis nula, usando el test de Holm, tenéis que decir entre qué subpoblaciones hay 
# diferencias. Tenéis que elegir la opción correcta donde nos da los niveles de cada par de 
# valores de la variable cyl y sus p-valores.

pairwise.t.test(tabla.anova.mpg$mpg, tabla.anova.mpg$cyl, p.adjust.method = "holm")

# Pregunta 4
# Queremos testear si las submuestras creadas son homocedásticas usando el test de Bartlett. 
# Tenéis que dar el p-valor del contraste y la conclusión que se deriva de dicho p-valor.
library(car)
bartlett.test(tabla.anova.mpg$mpg, tabla.anova.mpg$cyl)

# Pregunta 5
# Queremos testear si las submuestras creadas son normales usando el test de 
# Kolmogorov-Smirnov-Lilliefors. Tenéis que dar el p-valor para cada submuestra y la 
# conclusión que se deriva.
library(nortest)

sapply(levels(tabla.anova.mpg$cyl),
       function(x){
         lillie.test(tabla.anova.mpg[tabla.anova.mpg$cyl==x, "mpg"])
       })

