
# Clear your global environment if you want.
rm(list = ls())


# Load in the psych package using library().
# You'll use the describe() function from the psych package later in the assignment.
library(psych)


#### Step 1 ####

# Use the rnorm() function to draw a sample of 100 cases with a population mean = 80 and sd = 15.
# Store this sample in an object (I recommend calling it s1).

s1 <- rnorm(100,80,15)

# Calculate and report the mean of your sample.

mean(s1)

#### Step 2 ####

# Repeat Step 1 to generate 4 more samples.
# I recommend naming these samples s2, s3, s4, s5

s2 <- rnorm(100,80,15)
s3 <- rnorm(100,80,15)
s4 <- rnorm(100,80,15)
s5 <- rnorm(100,80,15)

# Calculate and report the mean for each sample.

mean(s2)
mean(s3)
mean(s4)
mean(s5)

#### Step 3 #####

# Store your 5 sample means in an object using c() and mean().
# Might look like: samplemeans <- c(mean(s1),mean(s2),mean(s3),mean(s4),mean(s5))

samplemeans <- c(mean(s1),mean(s2),mean(s3),mean(s4),mean(s5))


# Calculate and report the expected value of these means (the mean of means).

mean(samplemeans)

# Calculate and report the standard error (standard deviation of means).

sd(samplemeans)/sqrt(5)

# In your assignment file, describe in words how close the expected value is to the
# population mean (the equivalent population parameter).



#### Step 4 ####

# Use a for-loop to generate 500 samples.
# The code is provided below - don't worry about trying to make sense of it.
# Just know that it is going to generate 500 samples, calculate each of their means,
# and store those means in an object called dist.

for(i in 1:500){
  x<-rnorm(100,80,15)
  mx<-mean(x)
  if(i==1){
    dist<-mx  
  }else{
    dist<-rbind(dist,mx)
  }
}

# Make a histogram and add a vertical red line equal to the population mean.
# Report this graph in your assignment file (i.e., include a screenshot or image of the graph).

hist(dist)
abline(v=80,col='red')



#### Step 5 ####

# Calculate and report the expected value of the sampling distribution (dist).

mean(dist)

# Calculate and report the standard error of the sampling distribution (dist).

sd(dist)

15/sqrt(100)

# In your assignment file, report the formula for the standard error and
# check to see if it matches the standard error you got.



#### Step 6 ####

# Compare the first sample mean you generated in Step 1 (i.e., the mean of s1)
# to this sampling distribution by identifying the z-value for this first sample (s1)
# In other words, calculate the z-score for s1 and report this value.

# raw score: mean for s1
mean(s1)

(mean(s1)-80)/15

# For your assignment, use a z-table on the internet to report the probability of
# getting a sample mean higher than the sample mean you observed.



#### Step 7 ####

# The function runif() creates a uniform distribution.
# Draw a uniform sample and store it in an object using the code: runif(n=100,min=0,max=100)
# I recommend calling the object ud1.
ud1 <- runif(n=100,min=0,max=100)

# Generate and report a histogram of this sample.
hist(ud1)

# Calculate and report the mean of this sample.
mean(ud1)


#### Step 8 ####

# Create a sampling distribution of 500 uniformly distributed sample means.
# Notice how this code is the same as the code in Step 4, except we use
# the runif() function instead of rnorm().
# The sample means will be stored in an object called dist2.

for(i in 1:500){
  x<-runif(100,0,100)
  mx<-mean(x)
  if(i==1){
    dist2<-mx
  }else{
    dist2<-rbind(dist2,mx)
  }
}

# Generate and report a histogram of this distribution (dist2).
hist(dist2)

# Calculate and report the expected value, standard error, skewness, and kurtosis for dist2.
# Hint: use describe()
describe(dist2)

# In your assignment file, comment on the relationship between the expected value and the
# population mean, and the normality of the sampling distribution.



#### Step 9 ####

# Repeat step 8, but with sample size set to 15 instead of 100.
# Notice how the for-loop is the same as Step 8, except we replaced
# the line x<-runif(100,0,100) with x<-runif(15,0,100) and dist2 with dist3.

for(i in 1:500){
  x<-runif(15,0,100)
  mx<-mean(x)
  if(i==1){
    dist3<-mx
  }else{
    dist3<-rbind(dist3,mx)
  }
}

# Generate and report a histogram of this distribution (dist3).

hist(dist3)

# Calculate and report the expected value, standard error, skewness, and kurtosis for dist3.
describe(dist3)

# In your assignment file, comment on the relationship between the expected value and the
# population mean, and the normality of the sampling distribution.



#### Step 10 ####

# A mode function is not built in, so we have to build one.
# Don't worry about understanding this code, just know that you'll use the function getmode() to get the mode.

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Copy and paste the for-loop code from Step 4, and
# replace the mean() function with getmode(), and change dist to dist4.
# Note that we're back to using rnorm() to create a normal distribution.

for(i in 1:500){
  x<-rnorm(100,80,15)
  mx<-getmode(x)
  if(i==1){
    dist4<-mx  
  }else{
    dist4<-rbind(dist4,mx)
  }
}

# Generate and report the expected value of the mode in comparison the population mode.
mean(dist4)
# Since we are using a normal population, the mean = the mode. (i.e., calculate the mean
# of dist4 and compare it to the population mean).


# In your assignment file, report your conclusion on if the mode is unbiased.



#### Step 11 ####

# Repeat Step 10 using a larger sample size of your choosing. Modify the code
# below to insert your sample size as the first argument in the rnorm() function.
# Report the sample size you chose.

# The means of this sampling distribution will be stored in an object called dist5.

for(i in 1:500){
  x<-rnorm(800,80,15)
  mx<-getmode(x)
  if(i==1){
    dist5<-mx  
  }else{
    dist5<-rbind(dist5,mx)
  }
}

# Calculate and report the standard error for dist4.
sd(dist4)

# Calculate and report the standard error for dist5.
sd(dist5)

getmode(dist5)
mean(dist5)
# In your assignment file, comment on what happens to the standard error when
# you increase the sample size. Is the mode appearing consistent?




#### Step 12 ####

# No code to run.

# In your assignment file, compare the stats for the distribution of means generated
# in Step 4 (dist) to the stats for for the distribution of the modes generated  in
# Step 10 (dist4).
# Report which statistic is more prone to sampling error (mean or mode).

# Explain in words what sampling error is in terms of your first sample (Step 1; s1) to its
# sampling distribution (empirically represented in Step 4; dist).


