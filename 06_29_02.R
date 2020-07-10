rm(list=ls())
install.packages("plyr")
install.packages("reshape")
install.packages("reshape2")
install.packages("ggplot2")
library(plyr)
library(ggplot2)
library(reshape)
library(reshape2)


data(tips)
head(tips)
ddply(tips, "day",summarise, sum=sum(tip))
ddply(tips, "day",summarise, mean=mean(tip))
ddply(tips, "sex",summarise, mean=mean(tip))
abc <- ddply(tips, c("sex","smoker"),summarise, mean=mean(tip))
abc

ddply(iris, .(Species), function(sub){data.frame(Sepal.Width.mean=mean(sub$Sepal.Width))})

data(diamonds,package = "ggplot2")
head(diamonds)

#subset()
ddply(diamonds, "color",subset,carat==min(carat))
ddply(diamonds, "color",subset,carat>quantile(carat,0.99))
ddply(diamonds, "color",subset,price==max(price))

a<- ddply(diamonds,"color",transform,price=scale(price));head(a) #field 변환
b <-ddply(diamonds,"color",mutate,price2=scale(price));head(b) #field 추가
#scale은 데이터를 정규화하는 함수이다.
c<- ddply(diamonds,"color",summarise,mean_price=mean(price));head(c) #데이터요약

data(iris)
iris2<- melt(iris,id="Species")
head(iris2)

cast(iris2,Species~variable,mean) #변수별 평균 보기
cast(iris2,Species~variable,length) #변수별 개수 보기

data("airquality")
str(airquality)
names(airquality) <-tolower(names(airquality))
names(airquality)

airquality2 <- melt(airquality,id=c("month","day"))
head(airquality2)
aq_mean <-cast(airquality2,month~variable,mean, na.rm=T)
aq_mean
aq_sd <-cast(airquality2,month~variable,sd, na.rm=T)
aq_sd

