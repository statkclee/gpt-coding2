
while(TRUE) {
  cat("> ")
  line <- readLines(file("stdin"), 1)
  
  if(substr(line,1,1) == "#") {
    next
  }
  if(line == 'done') {
    break
  }
  print(line)
}
print("완료!")