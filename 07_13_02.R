rm(list = ls())
ex_type<-c(rep(5,2568),rep(15,2230),rep(25,6355),rep(35,4181),rep(45,3651),rep(55,3317),rep(65,2871))
ex_type <-table(ex_type)
ex_type<-data.frame(ex_type)
ex_type


str(ex_type)
library(ggplot2)

ggplot(data=ex_type, aes(x=ex_type, y=Freq))
