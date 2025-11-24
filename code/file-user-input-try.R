cat("Enter the file name: ")
fname <- readLines(file("stdin"), 1) 

fileOpened <- FALSE

result <- try({
  fhand <- readLines(fname)
  fileOpened <- TRUE
}, silent = TRUE)

if (!fileOpened) {
  cat("File cannot be opened:", fname, "\n")
  q("no")
}

count <- 0

for (line in fhand) {
  if (startsWith(line, "Subject:")) {
    count <- count + 1
  }
}

cat("There were", count, "subject lines in", fname, "\n")
