# select()는 일부 변수만 추출해 활용하고자 할 때 사용
exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)

# 제외할 변수명 앞에 빼기 기호- 입력
exam %>% select(-math)
exam %>% select(-math, -english)

# dplyr 패키지 함수들은 %>% 를 이용해 조합 가능 
# filter()(행 추출)와 select()(변수 추출) 조합하기
# 1반 학생의 영어 점수 추출 
exam %>% filter(class == 1) %>% select(english)

#줄바꿈하기
exam %>% 
  filter(class ==1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head #id, math 앞부분 6행까지 추출 

exam %>% 
  select(id, math) %>% 
  head(10)
