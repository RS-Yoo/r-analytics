# 01. mpg 데이터에서 class, cty 변수를 추출해 새로운 데이터 만들고 일부 출력해 두 변수로만 구성되어 있는지 확인
mpg_new <- mpg %>% select(class, cty)
mpg_new %>% head

# 02. 앞서 추출한 데이터를 이용해 class가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty가 더 높은지 알아보기
suv <- mpg_new %>% filter(class == "suv")
compact <- mpg_new %>% filter(class == "compact")
mean(suv$cty)
mean(compact$cty)
