rm(list=ls())
install.packages("plyr")
install.packages("MASS")
install.packages("reshape2")
install.packages("ggplot2")

library(plyr)
library(ggplot2)
library(MASS)
library(reshape2)

data(Cars93)
head(Cars93)

mycar <- Cars93[,-c(15:17)] #열 추출
mycar <- mycar[c(mycar$Manufacturer=="Honda"&mycar$Price>15),]
mycar

mycar2<-subset(Cars93,select=-c(15:17)) #열 추출
mycar2
mycar2<-subset(mycar2,Price>=15 &Manufacturer == "Honda") #행 추출
all.equal(mycar,mycar2)

mycar_h <- mycar[c(mycar$Manufacturer=="Hyundai"),]
mycar_h
mycar_p <- Cars93[rev(order(Cars93$Price)),] #가격으로 정렬
mycar_p
range(Cars93$Price)
maxprice<-Cars93[Cars93$Price>=61.9,]
maxprice <-arrange(Cars93,desc(Price))
head(maxprice,3)


abc<- Cars93[rev(order(Cars93$MPG.city)),]
abc<-subset(abc,Cylinders =="4")
abc
head(abc,1)


