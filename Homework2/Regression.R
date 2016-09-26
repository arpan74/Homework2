
plot(DF$Rating, (DF$BoxOffice / 1000000), main = "Rotten Tomatoes Rating vs Domestic Box Office Revenues", xlab = "Rotten Tomates Rating (0 - 100%)", ylab = "US Box Office Revenues (millions of dollars)")
model <- lm(BoxOffice ~ Rating, data = DF)
summary(model)