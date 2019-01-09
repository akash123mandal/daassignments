#imported AUTOMOBILES as auto
auto <- AUTOMOBILES
view(auto)
head(auto)
str(auto)

table(auto$symboling)
table(auto$make)
table(auto$`fuel-type`)
table(auto$aspiration)
table(auto$`num-of-doors`)
table(auto$`body-style`)
table(auto$`drive-wheels`)
table(auto$`engine-location`)
table(auto$`engine-type`)
table(auto$`num-of-cylinders`)
table(auto$`fuel-system`)


auto$`peak-rpm` <- as.numeric(auto$`peak-rpm`)
fivenum(auto$`peak-rpm`, na.rm = TRUE)
hist(auto$`peak-rpm`)
mean(auto$`peak-rpm`, na.rm = TRUE)


auto$horsepower <- as.numeric(auto$horsepower)
fivenum(auto$horsepower, na.rm = TRUE)
hist(auto$horsepower)
hp <- na.omit(auto$horsepower)
hp <- as.numeric(hp)

#installed package fitdistrplus to help in fitting data to distribution
library(fitdistrplus)

#create numeric vectors of peak-rpm and city-mpg, remove NA values
rpm <- as.numeric(na.omit(as.numeric(auto$`peak-rpm`)))
mpg <- as.numeric(na.omit(as.numeric(auto$`city-mpg`)))

#view empirical density, and cdf to get an idea of possible distributions
plotdist(rpm, histo = TRUE, demp = TRUE)
plotdist(mpg, histo = TRUE, demp = TRUE)

#view summary stats and cullen-frey graph
descdist(rpm, boot = 500)
descdist(mpg, boot = 500)

#fitting to distributions
rpm_n <- fitdist(rpm, "norm")
rpm_g <- fitdist(rpm, "gamma")
rpm_ln <- fitdist(rpm, "lnorm")
rpm_w <- fitdist(rpm, "weibull")
rpm_plot.legend <- c("Normal", "Gamma", "Lognormal", "Weibull")
denscomp(list(rpm_n, rpm_g, rpm_ln, rpm_w), legendtext = rpm_plot.legend)

mpg_g <- fitdist(mpg, "gamma")
mpg_ln <- fitdist(mpg, "lnorm")
mpg_w <- fitdist(mpg, "weibull")
mpg_plot.legend <- c("Gamma", "Lognormal", "Weibull")
denscomp(list(mpg_g, mpg_ln, mpg_w), legendtext = mpg_plot.legend)

