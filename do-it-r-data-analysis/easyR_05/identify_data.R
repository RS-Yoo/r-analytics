#데이터 파악하기 
exam <- read.csv("csv_exam.csv") #데이터 프레임 생성 

head(exam) #앞에서부터 6행까지 출력 
head(exam, 10) #앞에서부터 10행까지 출력 

tail(exam) #뒤에서부터 6행까지 출력 
tail(exam, 10) #뒤에서부터 10행까지 출력 

View(exam) #원자료를 뷰어창으로 확인 

dim(exam) #행, 열 출력 (dimensions)

str(exam) #데이터 속성 확인 
#exam은 데이터 프레임이고 20개의 관측치(observation), 5개의 변수 

summary(exam) #요약 통계량 출력 
#Min: 최솟값, 1st Qu: 1사분위수(하위 25% 지점에 위치하는 값), Median: 중앙값, Mean: 평균, 3rd Qu: 3사분위수(하위 75% 지점에 위치하는 값), Max: 최댓값 
#ex: 학생들의 수학 점수가 54점(Median)을 중심으로 45.75점에서 75.75점 사이에 몰려 있다.