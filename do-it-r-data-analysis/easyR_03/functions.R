x<- c(1, 2, 3) #변수 만들기
x

mean(x) #함수 적용하기(평균 구하기)
max(x) #최댓값
min(x) #최솟값

paste(str5, collapse = ",") #쉼표를 구분자로 str5의 단어들을 하나로 합치기 / paste는 여러 문자를 합쳐 하나로 만든다. / collapse(파라미터)는 단어를 구분할 문자를 지정한다.
paste(str5, collapse = " ")
#함수의 옵션을 설정하는 명령어 파라미터(매개변수)
x_mean<- mean(x) #함수의 결과물을 새 변수에 넣기
x_mean

str5_paste<- paste(str5, collapse = " ")
str5_paste
