install.packages("ggthemes")
library(ggthemes) #theme_few()적용을 위해
windows(height=4, width = 8)
ggplot(Salaries, aes(x=yrs.since.phd, y= salary, fill=sex))+ #데이터 및 변수 할당
  geom_smooth(method=lm, formula = y~poly(x,2)) + #회귀선 추가
  geom_point(shape=21)+ #점그래프
  facet_grid(.~sex)+ #새로운 면 분할
  theme_economist()+
  scale_colour_few() #테마에 있는 배색 적용

data(mtcars)
ggplot(mtcars, aes(x=disp, y=mpg, fill=gear))+
  geom_point(shape=21)+
  facet_grid(.~gear)+
  theme_economist_white()+
  scale_colour_economist()+
  xlim(50,600)


#example
mtcars$cyl=factor(mtcars$cyl)
ggplot(mtcars, aes(x=disp, y=mpg, colour=cyl))+
  geom_text(aes(label=rownames(mtcars),x=disp+5), hjust=0)+
  geom_point()+xlim(50,600)

library(MASS)
library(ggplot2)

data(geyser)
summary(geyser)
str(geyser)
ggplot(geyser, aes(x=waiting, y=duration))+
  geom_point()

#시계열분석****************************************

library(gcookbook)
library(ggplot2)
data(diamonds)
str(diamonds)

ggplot(data=diamonds, aes(x=carat,y=price))+
  geom_point(aes(colour=clarity))
#주로 x에 시계열 데이터를 대입
