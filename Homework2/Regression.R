
plot(DF$Rating, (DF$BoxOffice), main = "Rotten Tomatoes Rating vs Domestic Box Office Revenues", xlab = "Rotten Tomates Rating (0 - 100%)", ylab = "US Box Office Revenues (millions of dollars)")
model1 <- lm(BoxOffice ~ Rating, data = DF)
summary(model1)
plot(DF$Rating, (DF$BoxOffice), main = "Rotten Tomatoes Rating vs Domestic Box Office Revenues", xlab = "Rotten Tomates Rating (0 - 100%)", ylab = "US Box Office Revenues (millions of dollars)")
abline(lm(BoxOffice~Rating, data = DF), col="red")
identify(DF$Rating, DF$BoxOffice)
DFNew <- DF[setdiff(c(1:40), remove),]
abline(lm(BoxOffice~Rating, data = DFNew), col="green")
summary(lm(BoxOffice~Rating, data = DFNew))
legend("topleft",c("New Model","Old model"),lty=c(1,1),lwd=c(2.5,2.5),col=c("green","red"))



model2 <- lm(BoxOffice ~ Rating, data = DFNew) # new model without outliers and shit
plot(model2) 
model2.stdres = rstandard(model2)
qqnorm(model2.stdres, ylab="Standardized Residuals", xlab="Normal Scores", main="Normal Plot of Residuals") 
qqline(model2.stdres)

plot(DFNew$Rating, (DFNew$BoxOffice), main = "Rotten Tomatoes Rating vs Domestic Box Office Revenues", xlab = "Rotten Tomates Rating (0 - 100%)", ylab = "US Box Office Revenues (millions of dollars)")
abline(lm(BoxOffice~Rating, data = DFNew), col="green")
lines(DFNew$Rating, predict(model2, DFNew, interval="confidence")[,2], lty=2)
lines(DFNew$Rating, predict(model2, DFNew, interval="confidence")[,3], lty=2)

plot(DFNew$Rating, (DFNew$BoxOffice), main = "Rotten Tomatoes Rating vs Domestic Box Office Revenues", xlab = "Rotten Tomates Rating (0 - 100%)", ylab = "US Box Office Revenues (millions of dollars)")
abline(lm(BoxOffice~Rating, data = DFNew), col="green")
lines(DFNew$Rating, predict(model2, DFNew, interval="prediction")[,2], lty=2)
lines(DFNew$Rating, predict(model2, DFNew, interval="prediction")[,3], lty=2)