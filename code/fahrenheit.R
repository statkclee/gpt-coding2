# fahrenheit.R 
cat("화씨 온도를 입력하세요: ")
inp <- readLines(file("stdin"), 1) # rscript.ext로 실행할 때는 이렇게 입력을 받아야 함
# inp <- readline(prompt = "화씨 온도 입력해줘: ") # 스크립트 실행

tryCatch({
  cel <- (as.numeric(inp) - 32.0) * 5.0 / 9.0
  print(cel)
}, warning = function(w) {
  print("경고: 숫자를 입력해주세요!")
}, error = function(e) {
  print("에러: 숫자를 입력해주세요!")
})