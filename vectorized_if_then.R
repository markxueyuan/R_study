x <- 1:10
y <- ifelse(x %% 2 == 0, 5, 12)

# This function isn't as cool as I have envisioned:

#z <- ifelse(0:1,0:4,5:10)

x <- c(5,2,9,12)

ifelse(x>6,2*x,3*x)

# Remember forever that evrything is much faster in R if it is vectorized.

#################### A measure of Association ###############

findud <- function(v){
  vud <- v[-1] - v[-length(v)]
  return(ifelse(vud > 0,1,-1))
}

udcorr <-function(x,y){
  ud <- lapply(list(x,y),findud)
  return(mean(ud[[1]] == ud[[2]]))
}

x <- c(5,12,13,3,6,0,1,15,16,8,88)
y <- c(4,2,3,23,6,10,11,12,6,3,2)

udcorr(x,y)

# more compact
u <- c(1,6,7,2,3,5)

diff(u)

sign(diff(u))

udcorr <- function(x,y){
  mean(sign(diff(x)) == sign(diff(y)))
}

################## prove laziness ;;;;;;;;;;;;;;;

x <- 1

f <- function(){
  x[1] = 2
  return(x)
}

pl <- function(y){
  ifelse(T,return(x),return(y))
}

pl(f())

############### closure not that powerful ###########

demcloz <- function(){
  x <- 3
  return(function(y){
    x[1] <- x[1] + y
    return(x)
  })
}

adder <- demcloz()

x <- 3

adder2 <- function(a){
  x[1] <- x[1] + a
  return(x)
}

x <- 3

x[1] <- x[1] + 3
x

# this may because that R's function won't change any value out of it.

########### recoding an ablone data set;;;;;;;;;;;;;;;

g <- c("M","F","F","I","M","M","F")

ifelse(g=="M",1,ifelse(g=="F",2,3))# not as seemingly that easy

args(ifelse)

ab <- cbind(g,1)

ab[,1] <- ifelse(ab[,1] == "M",1,ifelse(ab[,1]=="F",2,3))

m <- which(g=="M")
f <- which(g=="F")
i <- which(g=="I")

grps <- list()

for(gen in c("M","F","I"))
  grps[[gen]] <- which(g==gen)


aba <- read.csv("D:/data/abalone.data",header=T,as.is=T)

grps <- list()
for(gen in c("M","F"))
  grps[[gen]] <- which(aba==gen)


















