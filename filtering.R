z <- c(1,2,3)
j <- c(T,F,T)
z[j]

z <- c(5,2,-3,8)

w <- z[z*z > 8]

# assignment
x <- c(1,1,1)
x[] <- 0
x

x <- c(1,3,8,2,20)

x[x>3] <- 0

# the mechanism of assigning is not that clear to me.

# better trait of function subset

x <- c(6,9,NA,3,2)

w <- x[x > 5]

x <- c(6,9,NULL,3,2)

w <- x[x > 5]

x <- c(6,9,NA,3,2)

w <- subset(x,x > 5)

y <- c(T,F)

w <- subset(x,y)

# selection which()

z <- c(5,2,-3,8)

which(z*z > 8)

first1a <- function(x)
  return(which(x==1)[1])

first1a(c(0,0,1,1,0))





















