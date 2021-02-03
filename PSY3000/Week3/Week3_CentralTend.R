
#### Setup Environment ####

# Optional: the line of code below will clear your environment if you want to start fresh.
# Uncomment if you want to use it.

#rm(list = ls())


# Load packages

#install.packages("tidyverse")   #If you haven't installed tidyverse before, uncomment this line.
library(tidyverse)

install.packages("psych")    #If you haven't installed psych before, uncomment this line.
library(psych)

# Set working directory
# Replace the file path with your file path in setwd(), or set the working directory by
# going to Session -> Set Working Directory -> Choose Directory

setwd("~/Documents/R/PSY3000/Week3")

# Read in data
# You can also import data by going to File -> Import Dataset -> From text(readr)
# Replace the file name in the code below with whatever you named your file

df <- read.csv("Dawtry Sutton and Sibley 2015 Study 1a.csv")

View(df)


#### Compute New Variables ####

# Create score capturing participants' perceptions that the current system is fair and satisfactory

# In the code below, we use the operator %>%, which is from the dplyr package within tidyverse.
# %>% allows us to specify multiple steps that we want to apply to a dataframe.
# In the code below, we are "diving into" df (df %>%)
# With rowwise(), we are telling R that we want it to compute the next steps across rows
# Then we use mutate to create our new column, which is the mean of the fairness and satisfaction scores.

df <- df %>%
  rowwise() %>%
  mutate(fairness_and_satisfaction = mean(c(fairness, satisfaction)))

mean(df$fairness_and_satisfaction)

mean(df$fairness)
mean(df$satisfaction)

# Create score capturing participants' support for redistribution

# Reverse score redist2 and redist4

df <- df %>%
  mutate(redist2_recode = 7-redist2,
         redist4_recode = 7-redist4)

# Create support_for_redistribution, which is the mean of redist1, redist2_recode, redist3, and redist4_recode

df <- df %>%
  rowwise() %>%
  mutate(support_for_redistribution = mean(c(redist1, redist2_recode, redist3, redist4_recode)))


#### Calculate descriptive statistics for the key variables ####

# Create dataframe that only contains the variables we are interested in

keyVars <- df[c("Household_Income", "Social_Circle_Mean_Income", "Population_Mean_Income",
                "Social_Circle_Inequality_Gini_Index", "Population_Inequality_Gini_Index",
                "fairness_and_satisfaction", "support_for_redistribution", "Political_Preference")]

# Use describe(), which is from the psych package, to get descriptives

keyStats <- describe(keyVars, ranges = TRUE, IQR = TRUE)



