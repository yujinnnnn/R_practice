rm(list=ls())
budget2012 <-read.csv("budget2012.csv", header = T)

#pie chart
windows(height = 6, width = 5.5)
par(mfrow=c(1,1))
par(mar=c(1,1,1,1))
par(new=T)
pie(budget2012$budget, radius = 0.8, col="white", 
    labels = NA, border=NA)

pie(budget2012$budget,col = rainbow(12), labels = budget2012$name, 
    radius=1, main = "budget 2012", clockwise = T, init.angle = 90)

savePlot("piechart.png", type="png")

#bar plot***************************************************
data(VADeaths)

windows(height = 4, width = 8)
par(mfrow=c(1,2))
colnames(VADeaths) <- c("rM","rF","uM","uF")
barplot(round(VADeaths[1,]), col=2:5, border = "white",ylim=c(0,25),
        main = "VADeath (50-54)") 
#height 각 기둥의 높이
#col 색상
#border 외각선 색깔
#ylim y축 범위

barplot(round(VADeaths[1,]),
        col=c("green", "darkgreen","blue","blue4"),
        border="white", ylim=c(0,25),
        main = "VADeath (50-54)")
abline(h=1:25, col="white", lwd=2)
#abline 눈금선 만드는 함수
#lwd 선 굵기 
savePlot("barplot.png", type="png")

#histogram****************************************************
#:연속형 변수를 구간화하여 볼 수 있음
library(MASS)
data(geyser)

windows(height=4, width = 9); par(mfrow=c(1,2))
#option 1
hist(geyser$waiting, nclass = 20, main = "geyser",
     xlab = "waiting", xlim = c(40,120), ylim = c(0,80))
#nclass 배율이 올리면 올릴수록 구간이 좁아진다. <- 좀 더 세밀하게 볼 수 있음
hist(geyser$duration, nclass = 16, main = "geyser",
     xlab = "duration", xlim = c(0,8), ylim = c(0,80))
#option 2
hist(geyser$waiting, breaks = seq(40,120,by=10), main = "geyser",
     xlab = "waiting",freq = T)
hist(geyser$waiting, breaks = seq(40,120,by=10), main = "geyser",
     xlab = "waiting",probability = T)

windows(height=4, width = 9); par(mfrow=c(1,1))
hist(geyser$waiting, breaks = seq(40,120,by=10), main = "geyser",
     xlab = "waiting",probability = T)
lines(density(geyser$waiting))

#box plot*****************************************************
rm(list = ls())
electorate <- read.csv("국회의원 선거구 유권자 수.csv", header=T)

attach(electorate)
windows(height = 6, width=5)
boxplot(선거인.수, col="yellow", ylim=c(0,250000),
           xlab="전국", ylab="선거인수")

windows(height = 6, width=10)
boxplot(선거인.수~시도, col=heat.colors(16), ylim=c(0,250000),
           main="우리나라 18대 국회의원 선거구의 선거인 수 분포", ylab="선거인수")
savePlot("boxplot.png", type="png")

#scatter plot**************************************************
rm(list=ls())
install.packages("KernSmooth")
library(MASS)
library(KernSmooth)

data(geyser)

windows(height=4, width = 9); par(mfrow=c(1,2))
plot(geyser$waiting, geyser$duration, xlab = "waiting", ylab ="duration",
     main="geyser")
plot(geyser$waiting, geyser$duration, xlim=c(30,120), ylim=c(0,6.5),
     col="forestgreen",pch=20, xlab = "waiting", ylab ="duration", main="geyser")
savePlot("scatterplot.png", type="png")

#------------------------------------------------
density <- bkde2D(geyser, bandwidth = c(5,0.5))
par(new=T); contour(density$x1, density$x2,
                    density$fhat, xlim=c(30,120),ylim=c(0,6.5),
                    col=heat.colors(7)[7:1],
                    nlevels = 7, lwd=2)

#회귀모형************************************************************
data(Cars)
windows(height=4, width = 9); par(mfrow=c(1,1))
#속도에 따른 제동거리
plot(dist~speed, data=cars, main="cars",xlim=c(0,30), ylim=c(-10,120))
linear.reg <- lm(dist~speed, data=cars)
abline(linear.reg, col="red", lty="dotted")

plot(dist~speed, data=cars, main="cars",xlim=c(0,30), ylim=c(-10,120))
lowess.reg<- lowess(cars)
lines(lowess.reg, col="red")

#조건부 플랏***************************************
rm(list = ls())
install.packages("lattice")
library(lattice)

data(quakes)

#xyplot: 산점도 (scatter plot_)
#bwplot: 박스 플랏

depth.grp<- equal.count(quakes$depth, number=4)
xyplot(lat~long|depth.grp, data= quakes)

#사각 타일 ******************************************************

prop<- c(47,23,18,11,1)
type<- "systematic"
m<-length(prop)
p.vec <-rep(1:m, prop)
if (type=="random") p.vec <- sample(p.vec)
P <- matrix(p.vec, 10, 10)
color <- 2:(m+1)

windows(height=5, width=4.5); par(oma=c(0,0,1,1))
image(P, col=color, axes=F, main="proportions")
abline(h=seq(-0.05,1.05,1.1/10),col="white", lwd=4)
abline(v=seq(-0.05,1.05,1.1/10),col="white", lwd=4)
savePlot("square tiles_1.png", type="png")

#모자이크 그림***********************************************
rm(list=ls())
data(UCBAdmissions)
str(UCBAdmissions)

require(graphics) #library와 같은 기능
windows(height=4, width=8); par(mfrow=c(1,2))
mosaicplot(apply(UCBAdmissions, c(2,1), sum),
           color=c("red","grey"),
           main= "UC Berkeley Admissions")
mosaicplot(~Dept+Gender+Admit, data=UCBAdmissions,
           color=c("red","grey"), dir=c("v","v","h"),
           off=1, main= "UC Berkeley Admissions")
savePlot("berkeley_2.png", type="png")

