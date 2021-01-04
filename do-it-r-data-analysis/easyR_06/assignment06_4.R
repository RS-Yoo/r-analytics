# 두 종류로 분리된 연비 변수(hwy, cty)로 하나의 통합 연비 변수 만들어 분석하기

# 01. mpg() 데이터 복사본 만들고 cty와 hwy를 더한 '합산 연비 변수' 추가하기
mpg_new <- mpg
mpg_new <- mpg_new %>% 
  mutate(mpg_total = cty + hwy)

# 02. 2로 나눠서 평균 연비 변수 추가
mpg_new <- mpg_new %>% 
  mutate(mpg_mean = mpg_total/2)

# 03. 평균 연비 변수가 가장 높은 자동차 3종의 데이터 출력
mpg_new %>% 
  arrange(desc(mpg_mean)) %>% 
  head(3)

# 04. 1-3번 문제를 해결하는 하나로 연결된 dplyr구문 만들어 실행
mpg %>% 
  mutate(mpg_total = cty + hwy,
               mpg_mean = mpg_total/2) %>% 
  arrange(desc(mpg_mean)) %>% 
  head(3)
  