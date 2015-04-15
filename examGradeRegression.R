# read in data

examsQuiz <- read.table("D:/data/minExamsQuiz.txt",header=FALSE)

# get class and head

class(examsQuiz)
head(examsQuiz)

# get class and head (inner data)

class(stackloss)
head(stackloss)

# linear regression

lmb <- lm(stackloss[,4] ~ stackloss[,1])

lmc <- lm(stackloss$stack.loss ~ stackloss$Air.Flow)

#attributes

attributes(lmc)

#get each name

lmc$coe
lmb$coe

lmc$resi

# print is a generic function

print(lmc)

# summary the results of regression

summary(lmc)

# multi linear regression

sl <- stackloss

lmml <- lm(sl$stack.loss ~
             sl$Air.Flow +
             sl$Water.Temp +
             sl$Acid.Conc.)

summary(lmml)
