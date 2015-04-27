# check the mode of variable

x <- 3
y <- c(3)
z <- c(3,4)

typeof(x)
typeof(y)
typeof(z)

# R's vector indexes start from 1

z[1]

# adding and deleteing vector elements, vector similar to array

x <- c(88,5,12,13)

x <- c(x[1:3],168,x[4]) #re-point x to this newly built vector

#length of the vector

length(x)


first1 <- function(x){
  for(i in 1:length(x))
    if(x[i] == 1)
      break
  return(i)
}

# 1:length(x) returns a vector!

1:length(c(1,2,3))
1:length(c())#better way is to use seq

# matrices as vectors

m <- cbind(c(1,2),c(3,4))
n <- rbind(c(1,2),c(3,4))

v <- m + 10:13
v <- n + 10:13

typeof(10:13)
class(10:13)
typeof(m)
class(m)
typeof(c(1,2))
class(c(1,2))

# declarations

y <- vector(length=2)

y[1] <- 5
y[2] <- 12


# recycling

w <- c(1,2,3) + c(4,5,6,7)#shorter one are recycled

x <- cbind(c(1,2,3),c(4,5,6))

f <- x + c(1,2)

# vector operations

2+3

"+"(2,3)

x <- c(1,2,4)
y <- c(5,0,-1)

z <- x + y

u <- c(5,0,-1)

t <- x * u

d <- x / u
b <- u / x

x <- y %% x

# vector indexing

y <- c(1.2,3.9,0.4,0.12)

y[2:4]

y[c(2,3,4)]

y[c(1,1,3)]

  # exclude elements

y[-1]

y[-1:-3]
  
  # using length()

z <- c(4,7,2,3,1)

z[1:length(z)-1]#quite shocked by the syntax

z[-length(z)]

# : operator

5:8

5:1

1:length(z)-1#shocked again!

i <- 4

1:i-1
1:(i-1)
(1:i)-1

# to check syntax precedence, see

?Syntax

# sequences

# generalization of : is seq()

seq(from=12,to=30,by=3)
z <- seq(from=12,to=29,by=3)

seq(from=1,to=2,by=0.1)

seq(from=1,to=2,length=3)

seq(from=1,to=2,length=7)

  #solving empty-vector problem
    # for(i in seq(x))

first1 <- function(x){
  for(i in seq(x))
    if(x[i] == 1)
      break
  if(i == length(x))
    return(NULL)
  return(i)
  
}

x <- c(2,3,7)

seq(x)

x <- NULL

seq(x)

x <- c()

seq(x)

# repeating

x <- rep(8, 6)

y <- rep(c(5,12,13),4)

length(y)
y[4]


z <- rep(1:3,2)

rep(c(5,12,13),each=3)

# all() and any()

x <- 1:10

x > 6  # makes an vector

any(x)
any(x > 6)

all(x)
all(x > 6)

###### FiNDING RUNS ########

findruns <- function(x,k){
  n <- length(x)
  runs <- NULL
  for(i in 1:(n-k+1)){
    if(all(x[i:(i+k-1)]==1))
      runs <- c(runs,i)
  }
  return(runs)
}

  #preallocate memory

findruns1 <- function(x,k){
  n <- length(x)
  runs <- vector(length=n)
  count <- 0
  for(i in 1:(n-k+1)){
    if(all(x[i:(i+k-1)]==1)){
      count <- count + 1
      runs[count] <- i
    }
  }
  if(count > 0){
    runs <- runs[1:count]
  }
  else runs <- NULL
  
  return(runs)
}

###### discrete-valued time series #######
  
  # naive

preda <- function(x,k){
  
  n <- length(x)
  k2 <- k/2
  
  pred <- vector(length=n-k)
  
  for(i in 1:(n-k)){
    if(sum(x[i:(i+(k-1))]) >= k2) # this is the typical R(vector index)
      pred[i] <- 1
    else pred[i] <- 0
  }
  
  return(mean(abs(pred-x[(k+1):n]))) # common R trick, mean of 0,1,...
}

x <- sample(0:1,800,replace=T)

preda(x,5)

  # by updating the sum

predb <- function(x,k){
  
  n <- length(x)
  k2 <- k/2
  pred <- vector(length=n-k)
  sm <- sum(x[1:k])
  if(sm >= k2)
    pred[1] <- 1
  else pred[1] <- 0
  
  if(n-k >= 2){
    for(i in 2:(n-k)){
      sm <- sm + x[i+k-1] - x[i-1]
      if(sm >= k2)
        pred[i] <- 1
      else pred[i] <- 0
    }
  }
  return(mean(abs(pred-x[(k+1):n])))
}

predc <- function(x,k){
  
  n <- length(x)
  k2 <- k/2
  pred <- vector(length=n-k)
  csx <- c(0,cumsum(x))
  
  for(i in 1:(n-k)){
    if(csx[i+k] - csx[i] >= k2)
      pred[i] <- 1
    else pred[i] <- 0
  }
  
  return(mean(abs(pred-x[(k+1):n])))
  
}



############### Vectorized Operations ###############

# Vectorization can make a dramatic performance increase of
# hundredsfold or more

u <- c(5,2,8)
v <- c(1,3,9)

u > v

# if a function uses vectorized operations, it too is vectorized

w <- function(x)
  return(x+1)

# transcendental functions are vectorized

sqrt(1:9)

y <- c(1.2,3.9,0.4)

z <- round(y)

# special case: one number is an one element vector
round(1.2)

f(c(1,2,3),c(3,2,1))
f(c(1,2,3),4)


# to confine to scalar

f <- function(x,c){
  if(length(c) != 1)
    stop("vector c not allowed")
  return((x+c)^2)
}


# Vector in, matrix out

z12 <- function(z)
  return(c(z,z^2))

# to matrix

x <- 1

z12(x)

matrix(z12(x),ncol=2)

matrix(z12(x),ncol=4)

#simplify apply

sapply(1:8,z12)# a bit like clojure's map

# What's up?






























