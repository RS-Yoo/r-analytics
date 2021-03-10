
#### T-Test Lab ####

# Clear your global environment if you want.
rm(list = ls())

# Load packages: Load the tidyverse package using the library() function
library(tidyverse)
library(ggplot2)


# Read in data file
# Setting your working directory is optional but recommended.
# You can set your working directory with the setwd() function,
# or you can go to Session -> Set Working directory -> Choose working directory

# Remember to update the code below with your exact file path and file name
# if you choose to use it.

setwd("~/Documents/R/PSY3000/Week8")
alldata <- read.csv("Mehr Song and Spelke 2016 Experiment 1.csv")
View(alldata)


#### Filter to retain only Exp 1 data ####

# Use the filter function to create a new dataframe with just Exp1 data.
# I recommend naming it exp1data

exp1data <- alldata %>% filter(exp1 == 1)
View(exp1data)


  
#### T-tests ####

# T-test 1: Baseline
# Conduct a one-sample t-test for the data at baseline
# Look up/google the t.test() function to see the arguments you need to provide.
# Hint: You will need to provide two arguments (mentioned in the text of the lab assignment)

base.t <- t.test(exp1data$Baseline_Proportion_Gaze_to_Singer, mu = 0.5)

base.t  # Typing just the object name shows us the results

# T-test 2: Test
# Now make a one-sample t-test for the data at test

test.t <- t.test(exp1data$Test_Proportion_Gaze_to_Singer, mu = 0.5)

test.t



#### Create figure visualizing results ####

# We did this same process in an earlier lab!

# First, create a new data frame with just the data we want to plot.

# Specify the arguments for the select() function.
# Hint: You will provide 3 arguments
# Google "r select()" to see what those are if you don't remember

plotdata <- select(exp1data, Baseline_Proportion_Gaze_to_Singer, Test_Proportion_Gaze_to_Singer)

# Use gather to convert to long format
plotdata <- gather(plotdata, key = "Condition", value = "Proportion_Gaze", Baseline_Proportion_Gaze_to_Singer, Test_Proportion_Gaze_to_Singer)

# Alternative to gather is pivot_longer (might be easier and more intuitive)
# Uncomment the lines below if you want to use this method. Both methods give you the same
# end result.

#plotdata <- pivot_longer(plotdata, cols = c( ___ , ___ ),
#                               names_to = "___", values_to = "___")


# Time to plot!

# You could choose a plot type that's not a boxplot if you
# wanted (e.g., barplot, dotplot), but we already created a boxplot
# visualizing the results from the Week 2 Describing Data Lab, and that's
# what they use in the paper, so I recommend sticking with the boxplot.

# You can make a boxplot using the base R function boxplot()
# or you can use the tidyverse ggplot method.

# Fill in the blanks for the figure code you choose to use.

# Base R
#boxplot( ___ ~ ___ , ___ ,
#        xlab = NULL,
#        ylab = "___",
#        names = c("___", "___"))  # x-axis tickmark labels to identify the boxplots

# optional: add line at proportion == 0.50, which indicates chance performance
# note where the median values for Baseline and Test fall
#abline(h = 0.5, col = "red")


# ggplot
ggplot( plotdata , aes(x = Condition , y = Proportion_Gaze )) +
  geom_boxplot() +
  ylab("Gaze Proportion") +
  scale_x_discrete(labels = c("Base", "Test")) +   # x-axis tickmark labels to identify the boxplots
  theme(axis.title.x = element_blank()) +
  theme_bw()

# optional: add line at proportion == 0.50, which indicates chance performance
# note where the median values for Baseline and Test fall
#ggplot( ___ , aes(x = ___ , y = ___ )) +
#  geom_boxplot() +
#  geom_hline(yintercept = 0.5, color = "red") +  # This is the code that adds the line
#  ylab("___") +
#  scale_x_discrete(labels = c("___", "___")) +   # x-axis tickmark labels to identify the boxplots
#  theme(axis.title.x = element_blank()) +
#  theme_bw()


# To get confidence intervals, look at your t-test outputs
base.t
test.t


