cat("Enter the file name: ")
fname <- readLines(file("stdin"), 1) # rscript.ext로 실행할 때는 이렇게 입력을 받아야 함

fhand <- readLines(fname)

count <- 0

for (line in fhand) {
  if (startsWith(line, "Subject:")) {
    count <- count + 1
  }
}

print(paste('There were', count, 'subject lines in', fname))