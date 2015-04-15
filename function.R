oddcount <- function(x) {
  k <- 0
  for(n in x) {
    if(n %% 2 == 1)
      k <- k+1
  }
  return(k)
}



f <- function(x)
  return(x+y)

y <- 3

g <- function(x,y=TRUE,z=FALSE){
  return(c(y,z))
}