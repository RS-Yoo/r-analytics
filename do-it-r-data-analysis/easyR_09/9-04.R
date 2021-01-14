#연령대에 따른 월급 차이
#연령대 파생변수 만들기
welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))
table(welfare$ageg)
qplot(welfare$ageg)

#연령대에 따른 월급 차이 분석
#연령대별 월급 평균표
ageg_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))
ageg_income
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + 
  geom_col() + 
  scale_x_discrete(limits = c("young", "middle", "old"))
