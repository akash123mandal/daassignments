#import database as "car"

#Take a look at the database
View(car)

#function to evaluate geometric mean
geometricMean <- function(x){
  n <- length(x)
  return((prod(x))^(1/n))
}

#function to evaluate harmonic mean
harmonicMean <- function(x){
  return(1/mean(1/x))
}

printMeans <- function(x){
  #arithmetic mean
  print("Arithmetic Mean (A. M.) - ")
  print(mean(x))
  
  #geometric mean
  print("Geometric Mean (G. M.) - ")
  print(geometricMean(x))
  
  #harmonic mean
  print("Harmonic Mean(H. M.)")
  print(harmonicMean(x))
}

#Means for Speed
print("Average Speed - ")
printMeans(car$speed)

#Means for Distance
print("Average Distance - ")
printMeans(car$dist)

#Five Number Summary
print("Five Number Summary - ")
print("For Speed - ")
fivenum(car$speed)
print("For Distance - ")
fivenum(car$dist)

#Function to find range
range <- function(x){
  return(max(x) - min(x))
}

#Calculate Range
print("Range for speed - ")
print(range(car$speed))
print("Range for distance - ")
print(range(car$dist))

#Calculate standard deviation and variance
print("Variance of speed - ")
print(var(car$speed))
print("Standard Deviation of speed - ")
print(sd(car$speed))

print("Variance of dist - ")
print(var(car$dist))
print("Standard Deviation of dist - ")
print(sd(car$dist))

#scatterplot to show relationship between the variables
plot(car$speed, car$dist, xlab = "Speed of car", ylab = "Stopping Distance", main = "Car speed vs. Stopping distance")




