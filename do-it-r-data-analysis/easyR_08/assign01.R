#mpg 데이터의 cty와 hwy간의 관계를 나타내는 산점도 
library(ggplot2)
ggplot(data= mpg, aes(x= cty, y=hwy)) + geom_point()

#midwest 데이터의 poptotal, popasian 산점도(전체 인구 50만명 이하, 아이아인 인구 1만명 이하 지역만 표시)
ggplot(data= midwest, aes(x= poptotal, y=popasian)) + 
  geom_point() +
  xlim(0, 500000) +
  ylim(0, 10000)
