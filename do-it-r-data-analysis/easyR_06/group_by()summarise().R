library(dplyr)
# 각 집단을 요약한 값 구하기
exam %>% summarise(mean_math = mean(math)) # math 평균 산출 

# 집단별로 요약하기
# 반별 수학 점수 평균 산출
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))
# A tibble: 5 x 2는 데이터가 5행 2열의 tibble(데이터 프레임의 업그레이드 버전)형태라는 것을 의미

# 여러 요약 통계량 한 번에 산출하기
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n()) #학생 수
# n()은 데이터가 몇 행으로 되어 있는지 빈도 구하는 기능

#하위집단으로 나누기
mpg %>% 
  group_by(manufacturer, drv) %>%  #회사별, 구동 방식별 분리
  summarise(mean_cty = mean(cty)) %>%  #cty 평균 산출
  head(10)


#회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1-5위 출력하기
#회사별로 분리 : group_by(manufacturer)
#"suv"추출 : filter(class == "suv")
#도시와 고속도로 통합 연비 평균 변수: mutate(total = (cty+hwy)/2)
#평균 산출 : summarise(mean_total = mean(total))
#내림차순 정령 : arrange(desc(mean_total)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(total = (cty+hwy)/2) %>% 
  summarise(mean_total = mean(total)) %>% 
  arrange(desc(mean_total)) %>% 
  head(5)
