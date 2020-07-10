rm(list=ls())
data(iris);head(iris)

colSums(iris[1:4])  #열합계 방법1
apply(iris[1:4],2,sum) #열합계 방법2 #1은 행, 2는 열

colMeans(iris[1:4]) #열 평균 방법
apply(iris[1:4],2,mean)

rowSums(iris[-5]) #행 합계 방법
apply(iris[-5],1,sum)

rowMeans(iris[-5])
apply(iris[-5],1,mean) 
#################################

result <- lapply(1:3, function(x){x*2})
result
result[[1]] #리스트의 첫 줄 보여줌

ab <- sapply(iris[,1:4],mean)
str(ab)
abc <- as.data.frame(ab) #데이터 프레임으로 바꾸기
str(abc)

attach(iris)
tapply(Sepal.Length,Species,sum) #종별 꽃받침길이 합
tapply(Sepal.Length,Species,mean)
tapply(Sepal.Length,Species,sd) #표준편차
temp<-tapply(Sepal.Length,Species,sum)
barplot(temp)
par(mfrow=c(1,2)); plot(temp);barplot(temp)

mapply(rnorm, c(1,2,3),c(0,10,100),c(1,1,1))