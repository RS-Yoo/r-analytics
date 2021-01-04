# mutate() 이용해서 기존 데이터에 파생변수 추가
exam %>% 
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  head

#여러 파생변수 한 번에 추가
exam %>% 
  mutate(total = math + english + science,
  mean = (math + english + science)/3) %>% 
  head

# mutate()에 ifelse() 적용
# 조건에 따라 다른 값을 부여한 변수 추가
exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head

# 추가한 변수를 dplyr코드에 바로 활용하기
exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% #총합 변수 기준 정렬 
  head
# dplyr 함수에는 데이터 프레임명을 반복 입력할 필요가 없다.

