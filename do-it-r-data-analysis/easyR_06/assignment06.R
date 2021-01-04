#mpg데이터를 이용한 분석문제

# 01. 자동차 배기량(displ)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 고속도로 연비(hwy)가 평균적으로 더 높은지 알아보기
mpg <- as.data.frame(ggplot2::mpg)
displ4 <- mpg %>% filter(displ <= 4)
displ5 <- mpg %>% filter(displ >= 5)
mean(displ4$hwy)
mean(displ5$hwy)

# 02. "audi"와 "toyota"중 어느 자동차 제조 회사(manufacturer)의 도시 연비(cty)가 평균적으로 더 높은지 알아보기
audi <- mpg %>% filter(manufacturer == "audi")
toyota <- mpg %>% filter(manufacturer == "toyota")
mean(audi$cty)
mean(toyota$cty)

# 03. "chevrolet", "ford", "honda" 데이터 추출 후 hwy전체평균 구하기
manufacturer <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(manufacturer$hwy)
