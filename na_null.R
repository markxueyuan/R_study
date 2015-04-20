x <- c(88, NA, 12, 168, 13)

mean(x)

mean(x,na.rm=T) # NA remove

x <- c(88,NULL,12,168,13)

mean(x)

x <- c(5,NA,12)

mode(x[2])

y <- c("abc", "def", NA)

mode(y[3])

# finding even numbers

findeven <- function(xs){
  even <- NULL
  for(i in xs)
    if(i %%2 == 0)
      even <- c(even,i)
  return(even)
}

findeven(1:10)

# two other ways

seq(2,10,2)
2*1:5

#NA won't work the same way
c(NULL,1)
c(NA,1)

u <- NULL
length(u)

v <- NA
length(v)

mode(u)
mode(v)




