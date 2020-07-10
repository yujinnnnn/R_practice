(d<- data.frame(a=1:3, b=4:6, c=7:9))
d[, names(d)%in% c("b","c")] #주어진 값이 벡터에 존재하는지를 판별하는 연산자
d[, !names(d) %in% c("a")] #!를 사용하여 특정 컬럼들 제외하여 반환

class(c(1,2))
str(c(1,2))
