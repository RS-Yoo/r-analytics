#종교 변수 검토 및 전처리
class(welfare$religion)
table(welfare$religion)

welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")
table(welfare$religion)
qplot(welfare$religion)

#혼인 상태 변수 검토 및 전처리
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce", NA))

#종교 유무에 따른 이혼률 표
religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion, group_marriage) %>%
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100, 1))

religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(religion, group_marriage) %>% 
  group_by(religion) %>% 
  mutate(pct = round(n/sum(n)*100, 1))

#이혼 추출
divorce <- religion_marriage %>% 
  filter(group_marriage == "divorce") %>% 
  select(religion, pct)

ggplot(data = divorce, aes(x = religion, y = pct)) + geom_col()


#연령대별 이혼율 표
ageg_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(ageg, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100, 1))

#초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>% 
  filter(ageg !=  "young" & group_marriage == "divorce") %>% 
  select(ageg, pct)
ggplot(data = ageg_divorce, aes(x = ageg, y = pct)) + geom_col()

#연령대 및 종교 유무에 따른 이혼률 표
ageg_religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage) & ageg != "young") %>% 
  group_by(ageg, religion, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group)*100, 1)

df_divorce <- ageg_religion_marriage %>% 
  filter(group_marriage == "divorce") %>% 
  select(ageg, religion, pct)
ggplot(data = df_divorce, aes(x = ageg, y = pct, fill = religion)) + 
  geom_col(position = "dodge")
