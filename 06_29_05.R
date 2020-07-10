rm(list=ls())
install.packages("sp")
library(sp)

xa <- round(runif(10),2)
ya <- round(runif(10),2)
xy <- cbind(xa,ya)

xy.sp <- SpatialPoints(xy)
xy.sp
plot(xy.sp, axes=T, pch=2)

x1 <-c(1,2,3,3)
y1 <-c(4,3,3,4)
l11 <-cbind(x1,y1)
l12<- cbind(l11[,1]+.05,l11[,2]+.05)
sl11<-Line(l11)
sl12<-Line(l12)
s1 <- Lines(list(sl11,sl12),ID='a')
s2 <-Lines(list(sl12),ID='b')
sl<-SpatialLines(list(s1,s2))
summary(sl)
plot(sl,axes=T,col=c("red","blue"),lty=c(1,2),lwd=2)




sr1<-Polygon(cbind(c(1,3,3,1,1),c(1,1,2,2,1)))
sr2<-Polygon(cbind(c(1,3,2,1),c(2,2,3,2)))
sr3<-Polygon(cbind(c(3,3,2,4,6,6,3),c(1,2,3,4,3,1,1)))
sr4<-Polygon(cbind(c(4,4,5,5,4),c(2,3,3,2,2)),hole=TRUE)

Srs1 <-Polygons(list(sr1),"s1")
Srs2 <-Polygons(list(sr2),"s2")
Srs3 <-Polygons(list(sr3,sr4),"s3/4")

SP <- SpatialPolygons(list(Srs1,Srs2,Srs3),1:3)
plot(SP,col=1:3,pbg="white",axes=T)
title("Spatial Polygon Plot")
