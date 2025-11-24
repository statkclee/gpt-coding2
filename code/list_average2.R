# list_average2.R ... 자료구조 사용 
numlist <- list()

while(TRUE) {
  cat("숫자를 입력하세요: ")
  inp <- readLines(file("stdin"), 1)
  if(inp == 'done') {
    break
  }
  value <- as.numeric(inp)
  numlist <- append(numlist, value)
}

average <- sum(unlist(numlist)) / length(numlist)
cat('평균:', average, '\n')
