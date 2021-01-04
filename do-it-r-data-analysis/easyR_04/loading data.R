#데이터 프레임을 csv파일로 저장하기

#데이터 프레임 만들기
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

#csv파일로 저장하기(file 파라미터에 파일명 지정)
write.csv(df_midterm, file = "df_midterm.csv")

#데이터 프레임을 RData파일로 저장하기
save(df_midterm, file = "df_midterm.rda")

#데이터 삭제하기
rm(df_midterm)

#RData파일 불러오기
load("df_midterm.rda")

#read.csv()나 read_excel()은 파일을 불러와 새 변수에 할당해야 활용할 수 있지만 load()로 rda파일을 불러오면 저장할 때 사용한 데이터 프레임이 자동으로 만들어지기 때문에 새 변수에 할당하지 않는다.