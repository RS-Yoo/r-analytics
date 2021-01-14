#지역별 연령대 비율
#지역 변수 검토 및 전처리
class(welfare$code_region)
table(welfare$code_region)

list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
welfare <- left_join(welfare, list_region, id = "code_region")

#지역별 연령대 비율 분석
region_ageg <- welfare %>% 
  group_by(region, ageg) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group =  sum(n)) %>% 
  mutate(pct = round(n/tot_group*100, 2))
head(region_ageg)

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip()

#노년층 비율 높은 순으로
list_order_old <- region_ageg %>% 
  filter(ageg == "old") %>% 
  arrange(pct)
#지역명 순서 변수
order <- list_order_old$region

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)

#연령대 순으로 막대 색 나열
region_ageg$ageg <- factor(region_ageg$ageg, level = c("old", "middle", "young"))
class(region_ageg$ageg)

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)
