#suv 차종을 대상으로 평균 cty가 가장 높은 회사 다섯 곳 막대 그래프로 표현
library(ggplot2)
library(dplyr)
df_new <- mpg %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
ggplot(data=df_new, aes(x=reorder(manufacturer, -mean_cty), y=mean_cty)) + geom_col()

#가장 많은 자동차 종류를 표현한 빈도 그래프
ggplot(data= mpg, aes(x= class)) + geom_bar()
