#엑셀 파일을 불러오는 기능을 제공하는 패키지 설치하고 로드하기 
install.packages("readxl")
library(readxl)
#R에서는 파일명을 지정할 때 항상 앞뒤에 따옴표를 넣는다.
df_exam <- read_excel("excel_exam.xlsx") #엑셀 파일을 불러와 df_exam에 할당
df_exam #출력 
#프로젝트 폴더가 아닌 폴더에 있는 엑셀 파일을 불러오려면 파일 경로를 지정한다. 슬래시 사용. df_exam<-read_excel("d:/easy_r/excel_exam.xlsx")
mean(df_exam$english)
mean(df_exam$science)

#엑셀 첫행이 변수명이 아닐 때 col_names = F파라미터 설정
#변수명이 아닌 데이터로 인식해 불러오고, 변수명은 X__숫자 로 자동 지정
#열 이름을 가져올 것인가? 라는 질문에 그렇지 않다 라고 대답 
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar

#엑셀 파일의 세 번째 시트에 있는 데이터 불러오기
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)

#csv파일 불러오기
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam
#첫 행에 변수명 없는 파일 불러올 때는 header = F 파라미터 지정 

#문자가 들어 있는 csv파일 불러올 때 stringAsFactors 파라미터를 F로 설정해야 변수를 factor타입이 아닌 문자 타입으로 불러온다.
# df_csv_exam <- read.csv("csv_exam.csv", stringAsFactors = F)