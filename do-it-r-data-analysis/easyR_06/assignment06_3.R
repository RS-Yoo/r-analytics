# "audi"에서 생산한 자동차 중 어떤 자동차 모델의 hwy가 높은지 알아보기
# "audi"에서 생산한 자동차 중 hwy가 1-5위에 해당하는 자동차 데이터 출력
audi <- mpg %>% 
  filter(manufacturer == "audi") %>%
  arrange(desc(hwy))
audi %>% head(5)
