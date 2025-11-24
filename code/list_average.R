# list_average.R 
total <- 0
count <- 0

while(TRUE) {
  cat("숫자를 입력하세요: ")
  inp <- readLines(file("stdin"), 1)
  if(inp == 'done') {
    break
  }
  value <- as.numeric(inp)
  total <- total + value
  count <- count + 1
}

average <- total / count
message('평균:', average)

