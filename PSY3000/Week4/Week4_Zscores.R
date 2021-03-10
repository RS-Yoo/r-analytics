
# Optional: the line of code below will clear your global environment if you want to start fresh.
# Uncomment if you want to use it.

#rm(list = ls())


#### Load packages ####

#install.packages("psych")    #If you haven't installed psych before, uncomment this line.
library(psych)


#### Draw random sample ####

normdat1 <- rnorm(500,0,1)


#### Calculate mean and sd ####

describe(normdat1)

# The describe function is from the psych package.
# If you didn't want to use describe, you could calculate the mean and sd individually using the code below
mean(normdat1)
sd(normdat1)


#### Draw second random sample and calculate mean and sd ####

set.seed(123)

normdat2 <- rnorm(500, 0, 1)

describe(normdat2)


#### Convert metric and make histogram ####

# Convert metric using the formula for a z-score
# The formula for a z-score is The Score minus the Population Mean, all divided by the Standard Deviation
# General formula for converting one dataset to another metric is:
# 1. Convert the mean to 0. We use the top part of the z-score formula to do this: The Score - Current Population Mean
# 2. Scale to the new standard deviation by multiplying the value from Step 1 by the New SD / Current SD
# 3. Convert to new mean by adding the value of the new mean to the value you got in Step 2

# You could replace the mean and sd functions in the equation below with the mean and sd you got from
# describe in the previous step if you wanted.

newdat2 <- ((normdat2 - mean(normdat2)) * (25/sd(normdat2))) + 100

# Another way to write the above formula is:
newdat2 <- (((normdat2 - mean(normdat2))*25) / sd(normdat2)) + 100

# Make histogram

hist(newdat2)


#### Describe shape of the distribution (kurtosis and skew) ####

describe(newdat2)


#### QQplot ####

qqnorm(newdat2)


#### Generate another dataset  and report stats ####

set.seed(456)

normdat3 <- rnorm(500, 100, 25)

describe(normdat3)


#### Standardize normdat2 and normdat3 and compare ####

standat2 <- (newdat2 - mean(newdat2))/sd(newdat2)
standat3 <- (normdat3 - mean(normdat3))/sd(normdat3)

describe(standat2)
describe(standat3)









