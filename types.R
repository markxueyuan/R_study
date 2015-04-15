######## vectors

x <- c(5,3,2)

length(x)

mode(x)

y <- 3

y

length(y)
mode(y)

z <- c("a","b","c")

length(z)
mode(z)

u <- "abc"
u
length(u)
mode(u)

m <- paste("a","b","c")

n <- strsplit(m," ")

############# matrix

myMatrix <- rbind(c(3,2),c(7,5))

myMatrix2 <- cbind(c(3,2),c(7,5))

v <- myMatrix %*% c(1,1)

myMatrix2[1,2]


x <- list(u=2,v="bc")

x$v

hn <- hist(Nile)


str(x)
str(hn)
summary(hn)
mode(hn)

myData <- data.frame(list(kids=c("Jack","Jill"),ages=c(12,10)))

myData$ages

mode(myData)






