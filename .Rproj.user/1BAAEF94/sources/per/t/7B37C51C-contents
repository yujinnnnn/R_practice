rm(list = ls())

library(reshape)
library(ggplot2)

conn<- read.table("conn.txt", header = T)
str(conn) #송유관 재질 3종
windows(height=5.5, width=7)
plot(castiron~year, type="l", data=conn, 
     ylab="m.miles", lwd=2, col="brown1", ylim=c(0,1000000))
text(2010, 100000, "cast iron", col="brown1")
par(new=T)
plot(steel~year, type="l", data=conn, lwd=2, ylab="m.miles",
     col="green3", ylim=c(0,1000000))
text(2010,500000, "steel", col="green3")
par(new=T)
plot(plastic~year, type="l", data=conn, lwd=2, ylab="m.miles",
     col="blue", ylim=c(0,1000000))
text(2010,720000,"plastic", col="blue")
title("Pipeline Materials by Year")

data<- reshape(conn, varying = c("castiron","steel","plastic"), 
        v.names="mmiles", timevar = "material",
        times=c("castiron", "steel","plastic"),
        direction = "long")
data<- subset(data, select=-c(id))
graph<- ggplot(data, aes(x=year, y=mmiles,fill=material))+
  geom_area(position = 'stack')+
  labs(x="Year", y="Total Miles of Pipeline in Millions")+
  scale_fill_discrete(name="Material",
                      breaks = c("castiron","steel","plastic"),
                      labels=c("castiron","steel","plastic"))
plot(graph)
