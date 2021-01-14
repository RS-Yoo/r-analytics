#성별에 따른 월급 차이
#성별 변수 검토
class(welfare$sex)
table(welfare$sex)

#성별 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)
qplot(welfare$sex)

#월급 변수 검토 및 전처리
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income) + xlim(0, 1000)

#이상치 확인
summary(welfare$income)
#이상치 결측 처리
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
#결측치 확인
table(is.na(welfare$income))

#성별 월급 평균표 만들기
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))
sex_income
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()
