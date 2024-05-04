# Academy 2.0, Homework 2, March 13 2024
# R 4.3.3
# ggplot2 3.5.0
# dplyr 1.1.4

#read data
library(ggplot2)
data(msleep)
msleep <- read.csv("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv")
head(msleep)
View(msleep)

typeof(msleep) #fundamental data type (e.g., numeric, character)
class(msleep) #more comprehensive classification of the object

#focus on primates
num <- nrow(msleep)
ncol(msleep)
print(paste("There are", num, "animals.", sep=" "))

library(dplyr)
msleep2 <- filter(msleep, order=="Primates") 
View(msleep2)

primates <- select(msleep2, order)
View(primates)
class(primates)

count_primates <- table(primates$order)
count_primates 
View(count_primates )
class(count_primates )

#extract the sleep data
selected_data <- select(msleep2, sleep_total)
selected_data
class(selected_data)

selected_data <- msleep2 %>% select(sleep_total)

#calculate mean 
unlist(selected_data)
class(unlist(selected_data))
avg_slp <- (unlist(selected_data))
mean(avg_slp)