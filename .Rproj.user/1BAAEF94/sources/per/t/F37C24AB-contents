rm(list=ls())

install.packages("maps")
install.packages("mapproj")
library(maps)
library(mapproj)
library(ggplot2)

data(USArrests)
crimes<- data.frame(state=tolower(rownames(USArrests)),USArrests)
states_map<- map_data("state")

head(states_map)

ggplot(crimes)+
  geom_map(aes(map_id=state, fill=Murder), map=states_map)+
  expand_limits(x=states_map$long, y=states_map$lat)+
  coord_map()

library(reshape2)
crimesm <-melt(crimes, id.vars="state")
ggplot(crimesm)+
  geom_map(aes(map_id=state, fill=value), map=states_map,
           colour='grey50', size=0.1)+
  expand_limits(x=states_map$long, y=states_map$lat) + #x,y 최소 최대가
  scale_fill_gradientn(colours=c("white", "green","blue","red"))+
  facet_wrap(~variable)+
  coord_map()
