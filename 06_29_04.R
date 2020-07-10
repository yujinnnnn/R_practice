install.packages("hflights")
install.packages("dplyr")
library(hflights)
library(dplyr)

filter(hflights, Month==1, DayOfWeek==1)
aa <-arrange(hflights, DayOfWeek,Month, Year)
head(aa)
tail(aa,10)
bb<- arrange(hflights,desc(ArrDelay))
head(bb,10)

cc<-select(hflights, Year, Month, DayOfWeek)
head(cc)

dd<- mutate(hflights,gain=ArrDelay-DepDelay,speed=Distance/Airtime*60 )
ee<-summarise(hflights, delay= mean(Depdelay,na.rm=T))

summary(hflights)
install.packages("lubridate") #시간을 핸들링 하기 위한 패키지
library(lubridate)
ff<- hflights %>% #ctrl+shift+m
  select(Year, Month) %>% #조회
  mutate(departure=make_date(Year,Month)) #컬럼 추가
head(ff)

today()
now()
year(today())
month(today())
wday(today()) #1이 일요일, 7이 토요일

gg<- hflights %>%
  select(Year, Month) %>% 
  mutate(departure=make_date(Year,Month))
