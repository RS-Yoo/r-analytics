midwest <- as.data.frame(ggplot2::midwest)

# 전체 인구 대비 미성년 인구 백분율 변수 추가
midwest <- midwest %>% 
  mutate(per_child = ((poptotal-popadults)/poptotal*100))

# 미성년 인구 백분율이 가장 높은 상위 5개 county의 미성년 인구 백분율 출력         
midwest %>% 
  arrange(desc(per_child)) %>% 
  select(county, per_child) %>% 
  head(5)

# 미성년 비율 등급 변수 추가하고 각 등급에 몇 개 지역이 있는지 알아보기
midwest <- midwest %>% 
  mutate(grade = ifelse(per_child >= 40, "large",
                        ifelse(per_child >= 30, "middle", "small")))
table(midwest$grade)

# 전체 인구 대비 아시아인 인구 백분율 변수 추가하고 하위 10개 지역의 state, county, 아시아인 인구 백분율 출력

midwest %>% 
  mutate(ratio_asian = (popasian/poptotal)*100) %>% 
  arrange(ratio_asian) %>% 
  select(state, county, ratio_asian) %>% 
  head(10)
