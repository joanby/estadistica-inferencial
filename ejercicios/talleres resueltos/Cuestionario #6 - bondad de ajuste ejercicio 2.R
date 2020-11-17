mtcars$gear
table(mtcars$gear)

frecuencia_observada = c(15,12,5)
# estimación.lambda = (15*3+12*4+5*5)/(15+12+5)
estimación.lambda = 3.7
probabilidades.esperadas = c(ppois(3,estimación.lambda),dpois(4,estimación.lambda),
                             ppois(4,lambda=estimación.lambda,lower.tail=FALSE))


chisq.test(frecuencia_observada,p=probabilidades.esperadas)