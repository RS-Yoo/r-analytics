
#### Setup Environment ####

# Optional: the line of code below will clear your environment if you want to start fresh.
# Uncomment if you want to use it.

#rm(list = ls())


# Load packages

install.packages("tidyverse")   #If you haven't installed tidyverse before, uncomment this line.
library(tidyverse)

# Set working directory
# Replace the file path with your file path in setwd(), or set the working directory by
# going to Session -> Set Working Directory -> Choose Directory

setwd("~/Documents/R/PSY3000/Week2")

# Read in data
# Initially, my id column was reading in weird, so I opened the csv with Excel and re-saved it.
# You can also import data by going to File -> Import Dataset -> From text(readr)
# Replace the file name in the code below with whatever you named your file

df <- read.csv("MehrSongSpelke_2016_Exp1.csv")

View(df)


#### Filter df to retain only Exp1 data ####

# Check what type of data is in the exp1 column: numeric or character? That will determine how we use filter()
e1 <- filter(df, exp1 == 1)
View(e1)

#### Ungrouped freq dist of proportion of time infants spent looking at the singer at the baseline ####

BaseSing.ungrouped <- table(e1$Baseline_Proportion_Gaze_to_Singer)

# Make table long (i.e., transform to dataframe)
BaseSing.ungrouped <- transform(BaseSing.ungrouped)


#### Histogram of the raw Baseline values ####

hist(e1$Baseline_Proportion_Gaze_to_Singer)

# Customize histogram labels
hist(e1$Baseline_Proportion_Gaze_to_Singer,
     main = "Frequency of Baseline Gaze Time Proportions",
     xlab = "Proportion of time spent looking at singer",
     ylim = c(0,10))


# To save a plot, in the plot window, click Export, and then choose whichever option works best
# for you (Save as an image or pdf, or copy the image). Just make sure it ends up in the document
# that you turn in for the assignment.


#### Grouped freq dist to match histogram ####

# create bins (look at histogram x axis)
bins <- seq(from = 0.2, to = 0.9, by = 0.1)

# Apply bins to data
BaseSing.grouped <- cut(e1$Baseline_Proportion_Gaze_to_Singer, bins)

# Create frequency table and transform to dataframe
BaseSing.grouped <- table(BaseSing.grouped)
BaseSing.grouped <- transform(BaseSing.grouped)

# If we wanted to do that in one step...
BaseSing.grouped2 <- transform(table(cut(e1$Baseline_Proportion_Gaze_to_Singer, bins)))


#### Boxplot of Baseline vs Test ####

# Retain only the relevant data to make things easier
SingerBaseTest <- select(e1, id, Baseline_Proportion_Gaze_to_Singer, Test_Proportion_Gaze_to_Singer)

# Use gather to convert to long format
SingerBaseTest <- gather(SingerBaseTest, key = "GazeType", value = "Proportion", Baseline_Proportion_Gaze_to_Singer, Test_Proportion_Gaze_to_Singer)

# Alternative to gather is pivot_longer (might be easier and more intuitive)
SingerBaseTest <- select(e1, id, Baseline_Proportion_Gaze_to_Singer, Test_Proportion_Gaze_to_Singer)
SingerBaseTest <- pivot_longer(SingerBaseTest, cols = c(Baseline_Proportion_Gaze_to_Singer, Test_Proportion_Gaze_to_Singer),
                               names_to = "GazeType", values_to = "Proportion")

# Base R default plot
boxplot(Proportion ~ GazeType, SingerBaseTest)

# Base R customize labels
boxplot(Proportion ~ GazeType, SingerBaseTest,
        xlab = NULL,
        ylab = "Proportion of Looking Toward Singer of Familiar Song",
        names = c("Before Singing (Baseline)", "After Singing (Test)"))

# ggplot boxplot
ggplot(SingerBaseTest, aes(x = GazeType, y = Proportion)) +
  geom_boxplot()

# ggplot boxplot customize labels
ggplot(SingerBaseTest, aes(x = GazeType, y = Proportion)) +
  geom_boxplot() +
  ylab("Proportion of Looking Toward Singer of Familiar Song") +
  scale_x_discrete(labels = c("Before Singing (Baseline)", "After Singing (Test)")) +
  theme(axis.title.x = element_blank())


