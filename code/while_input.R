while(TRUE) {
  
  cat("> ")
  user_input <- readLines(file("stdin"), 1)
  
  if(user_input == "exit") {
    break
  }

  print(user_input)
}
