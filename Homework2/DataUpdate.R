DF <- read.csv("Movies.csv", header = FALSE)
colnames(DF) <- c("Name", "BoxOffice", "Rating", "Year")
DF$BoxOffice <- DF$BoxOffice / 1000000
remove <- c(17, 20, 32,33)
DFNew <- DF[setdiff(c(1:40), remove),]

