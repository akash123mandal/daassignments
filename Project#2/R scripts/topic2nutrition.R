plot(NUTRITION$sugars, NUTRITION$rating)

rating <- NUTRITION$rating
sugars <- NUTRITION$sugars

#linear model
cor(NUTRITION$rating, NUTRITION$sugars)
linearModel <- lm(formula = rating ~ sugars, data = NUTRITION)
summary(linearModel)

#quadratic fit
sugars2 <- sugars^2
twodegree <- lm(rating ~ sugars + sugars2)
summary(twodegree)

#cubic fit
sugars3 <- sugars^3
threedegree <- lm(rating ~ sugars + sugars2 + sugars3)
summary(threedegree)

xplot = seq(-1, 16, 0.1)
predictedrating2 <- predict(twodegree, list(sugars=xplot, sugars2=xplot^2))
predictedrating3 <- predict(threedegree, list(sugars=xplot, sugars2=xplot^2, sugars3=xplot^3))

plot(sugars, rating)
abline(linearModel, col="yellow")
lines(xplot, predictedrating2, col="blue")
lines(xplot, predictedrating3, col="red")

