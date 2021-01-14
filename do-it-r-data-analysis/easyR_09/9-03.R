#나이에 따른 월급 차이
#나이 변수 검토 및 전처리
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)
#결측치 확인
table(is.na(welfare$birth))

#파생변수 만들기
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)

#나이에 따른 월급 평균표 만들기
age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))
head(age_income)
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()
