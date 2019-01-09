#Converted pdf to xlsx and loaded as WEATHER
q1 = c('January', 'February', 'March')
q2 = c('April', 'May', 'June')
q3 = c('July', 'August', 'September')
WEATHER$Quarter <- ifelse(is.element(WEATHER$Month, q1), 'Q1', ifelse(is.element(WEATHER$Month, q2), 'Q2', ifelse(is.element(WEATHER$Month, q3), 'Q3', 'Q4')))
cube <- tapply(WEATHER$`Mean Rainfall in mm`, WEATHER[ ,c("Station Name", "Month")], FUN = function(x){return(sum(x))})
print(cube)

dice <- function(cube, col = c(), row = c()){
  if(length(row) & length(col))
    print(cube[row, col])
  else if(length(row))
    print(cube[row, ])
  else if(length(col))
    print(cube[, col])
  else
    print(cube)
}

slice <- function(cube, col='', row=''){
  if(col != '')
    dice(cube, col = col)
  else
    dice(cube, row = row)
}

slice(cube, row = 'Abu')
slice(cube, col = 'July')
dice(cube, col = c('June', 'July', 'August'), row = c('Gangtok', 'Pondicherry (A)'))


#since it is not feasible to manually classify cities on basis of region because data is not provided in table, rollup and drill down
#operation is demonstrated for column only. Given data it can be similarly tackled for rows.

rolledup = 0
rollup <- function(cube){
  if(rolledup == 1)
  {
    print("Rolled up Already")
    return(cube)
  }
  rolledup <<- 1
  return(tapply(WEATHER$`Mean Rainfall in mm`, WEATHER[ ,c("Station Name", "Quarter")], FUN = function(x){return(sum(x))}))
}

drilldown <- function(cube){ 
  if(rolledup == 0)
  {
    print("Drilled down already")
    return(cube)
  }
  rolledup <<- 0
  return(tapply(WEATHER$`Mean Rainfall in mm`, WEATHER[ ,c("Station Name", "Month")], FUN = function(x){return(sum(x))}))
}




cube <- drilldown(cube)
cube <- rollup(cube)
print(cube)
slice(cube, col = 'Q2')
dice(cube, col = c('Q1', 'Q3'), row = c('Abu', 'Raipur', 'Ludhiana', 'Karnal'))
cube <- rollup(cube)
cube <- drilldown(cube)
print(cube)
