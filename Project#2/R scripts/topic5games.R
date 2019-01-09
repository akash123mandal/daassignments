#imported GAMES.xlsx as GAMES

#Remove rows with missing values of Rating or Genre
table(is.na(GAMES$Genre))
table(is.na(GAMES$Rating))

completeRows <- function(data, reqCols) {
  completeVec <- complete.cases(data[, reqCols])
  return(data[completeVec, ])
}

newGames <- completeRows(GAMES, c("Rating","Genre"))

table(is.na(newGames$Genre))
table(is.na(newGames$Rating))

tbl <- table(newGames$Genre, newGames$Rating)
print(tbl)
chisq.test(tbl)
