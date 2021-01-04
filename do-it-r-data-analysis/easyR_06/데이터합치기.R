# 가로로 합치기(기존 데이터에 변수(열) 추가)
# ex 중간고사 데이터에 기말고사 데이터 합치기

# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 70, 80, 90, 85))

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))

test1
test2

# 기준으로 삼을 변수명을 by에 지정(변수명 앞뒤에 따옴표 입력!)
total <- left_join(test1, test2, by = "id") # id를 기준으로 합쳐 total에 할당
total

# 다른 데이터를 활용해 변수 추가하기
# 각 반 학생의 시험점수를 담은 데이터에 반별 담임교사 명단 추가
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name

exam_new <- left_join(exam, name, by = "class")
exam_new



# 세로로 합치기(기존 데이터에 행 추가)
# ex 학생 세 명이 먼저 시험을 보고, 나중에 또 다른 학생 세 명이 따로 시험을 봤을 때
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 70, 80, 90, 85))
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))
group_all <- bind_rows(group_a, group_b)
group_all
