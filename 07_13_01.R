install.packages("rJava")
library(rJava)
rnorm(100,0,10) #정규분포
plot(density(rnorm(100,0,10)))

#다섯수치요약 ->boxplot
fivenum(1:11)
summary(1:11) #<-평균치도 구해줌

library(MASS)
data(survey)
table(survey$W.Hnd) #분할표 작성<각 레벨별 빈도수 측정

sample(1:10,5) #1에서 10까지의 수애서 5개를 비복원 추출하기
sample(1:10,5, replace=TRUE, prob=1:10) #복원추출, prob=순차적으로 가중치

#층화 임의 추출//srswor: 비복원 단순 임의 추출, srswr: 복원 단순 임의 추출
install.packages("sampling")
library(sampling)
data(iris)
summary(iris)
(x<-strata(c("Species"), size=c(5,5,5), method="srswor", data=iris))
getdata(iris, x)

#분할표
d<- data.frame(x=c("1","2","2","1"),
               y=c("A","B","A","B"),
               num=c(3,5,8,7))
(xtabs(num ~ x+y,data=d)) #num=L1(대체값)

#카이 제곱 검정 - 독립성 검정
data("survey")
head(survey[c("Sex", "Exer")])

table(survey[c("Sex","Exer")])
xtabs(~Sex+Exer, data=survey)

chisq.test(xtabs(~Sex+Exer,data=survey))

#상관분석 : 두 집단 간의 관련성
#1. 피어슨
data(iris)
cor(iris$Sepal.Width,iris$Sepal.Length)
cor(iris[,1:4])

install.packages("corrgram")
library(corrgram)
corrgram(iris, upper.panel=panel.conf)

#2.스피어만
x<- c(3,4,5,3,2,1,7,5)
rank(sort(x))
(m<-matrix(c(1:10,(1:10)^2), ncol=2))
cor(m, method="spearman")
cor(m, method="pearson") 

cor.test(c(1,2,3,4,5),c(1,0,3,4,5), method="pearson") #0.02이므로 상관관계가 유의
cor.test(c(1,2,3,4,5),c(1,0,3,4,5), method="spearman") 

#스피어만은 비선형 관계의 연관성 파악 가능, 이산형 데이터,순서형 데이터에 적용 가능 
#ex) 국어성적석차와 영어성적석차와의 상관관계
#피어슨은 연속형 데이터에 적합 ex)국어 점수와 영어 점수간의 상관관계

data(sleep)
head(sleep)
sleep2<- sleep[,-3]
head(sleep2)
data(mtcars)
ggplot(data=mtcars, mapping)
install.packages("doBy")
library(doBy)
summaryBy(extra ~ group, sleep2)

d<- data.frame(a=c("봄","여름","가을","겨울"),
               b=c(8,9,11,6),
               g=c(0.235,0.265,0.324,0.176))
d
install.packages("ggplot2")
library(ggplot2)
d$a<- as.factor(c("봄","여름","가을","겨울"))
d<- lm(g ~a, data=d)
d
ex_type<-c(rep("봄",8),rep("여름",9),rep("가을",11),rep("겨울",6))
ex_type <-table(ex_type)
data.frame(ex_type)
ex_type
ex_type$score <-prop.table(ex_type)
prop_freq
ex_type<-prop.table(ex_type)
ggplot(data=ex_type, mapping=aes(x=a, y=g))+
  geom_bar(position="dodge", width=1.8)+
  geom_text(stat="count",
            aes(label=g),
            position=position_dodge(width=1.8),vjust=0.5)
