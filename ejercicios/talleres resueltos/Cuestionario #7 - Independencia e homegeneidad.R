table(mtcars$am, mtcars$gear)

table(mtcars$am, mtcars$vs)
chisq.test(table(mtcars$am, mtcars$vs))