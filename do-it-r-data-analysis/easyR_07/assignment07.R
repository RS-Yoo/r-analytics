# mpg 데이터 불러와 몇 개 값을 결측치로 만들기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

# 01. drv변수와 hwy변수에 결측치가 몇 개 있는지 알아보기
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# filter()를 이용해 hwy 변수의 결측치를 제외하고 어떤 구동 방식의 hwy 평균이 높은지 알아보기(하나의 dplyr 구문으로 만들기)
library(dplyr)
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
