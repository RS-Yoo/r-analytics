# arragne()로 데이터를 원하는 순서로 정렬
exam %>% arrange(math) # math 오름차순 정렬

# 내림차순으로 정렬하려면 기준 변수를 desc()에 적용
exam %>% arrange(desc(math))

# 쉼표를 이용해 기준으로 삼을 변수 여러 개 지정
# 먼저 반을 기준으로 오름차순 정렬 후 각 반에서 수학 점수를 기준으로 오름차순 정렬 
exam %>% arrange(class, math)
