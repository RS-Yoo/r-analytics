# class별 cty 평균 구하기
mpg %>%
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# cty 평균이 높은 순으로 정렬해서 출력
mpg %>%
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

# hwy 평균이 가장 높은 회사 세 곳 출력
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# 각 회사별 "compact" 차종 수를 내림차순으로 정렬해서 출력
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))
