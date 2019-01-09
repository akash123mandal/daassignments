#imported MOVIE.xlsx as MOVIE

#convert to numeric data
MOVIE$imdb_score <- as.numeric(MOVIE$imdb_score)

#remove data with no year info
MOVIE <- MOVIE[!(is.na(MOVIE$title_year)), ]

#divide dataset into parts
pre2016 <- MOVIE[MOVIE$title_year <= 2015, ]
in2016 <- MOVIE[MOVIE$title_year == 2016, ]

#calculate population mean and sd
mu0 <- mean(pre2016$imdb_score)
sigma <- sd(pre2016$imdb_score)

#population sd known, z test

#critical value, alpha = 0.05
alpha = 0.05
zcrit = qnorm(1 - alpha)

#sample mean
xbar <- mean(in2016$imdb_score)

#calculate zstat
n <- length(in2016$imdb_score)
z = (xbar???mu0)/(sigma/sqrt(n))
