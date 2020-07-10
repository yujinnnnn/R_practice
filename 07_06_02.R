#ggplot2
rm(list = ls())
install.packages("gcookbook")
install.packages("ggplot2")
require(ggplot2)
require(gcookbook) #cabbage_exp 데이터 사용

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + #데이터/변수 할당
       geom_bar(stat= 'identity', position ='fill', colour='black')+#막대그래프
      scale_fill_brewer(palette='Pastel1') +#색깔바꾸기, 수치화
      coord_flip() #x축과 y축 바꾸기
#aes= x축, y축, 컬러 등 그래프가 안에 어떻게 생겼는지를 제외한 모습을 지정
#stat='identity'는 y축의 높이를 데이터의 값으로 하는 bar그래프의 형태로 지정한다는 것입니다.
#******************************************************************************

install.packages("carData")
library(carData)
data(Salaries)

p <-ggplot(aes(x=yrs.service, y=salary), data=Salaries)
p+geom_blank()
p+geom_point()
p+ geom_point(aes(colour=sex)) + geom_smooth()
p+ geom_point(aes(colour=sex)) + geom_smooth() + facet_grid(~sex)

ggplot(Salaries, aes(x=salary, y=..density..))+
  geom_histogram(colour='grey60', fill='cornsilk')+
  geom_density(colour=NA, fill='blue', alpha=0.2)+
  geom_line(stat='density', colour='red')+
  xlim(45000,250000)
