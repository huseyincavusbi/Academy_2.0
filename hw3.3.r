# Academy 2.0, Homework 3.3, March 23 2024
# R 4.3.3
# dplyr 1.1.4

# 1
# doi: 10.1186/s12911-020-1023-5
# https://plos.figshare.com/articles/dataset/Survival_analysis_of_heart_failure_patients_A_case_study/5227684/1

library(dplyr)
# importing data and selecting necessary columns
data <- read.csv("/home/macbuntu/Downloads/Academy/S1Data.csv")
selected_data <- select(data, Event, Gender, Smoking, Age, Ejection.Fraction)

# histogram for data
hist(selected_data$Gender, main="Gender (0 = F, M = 1)", xlab="Genders", ylab="Individuals", col ="orange", border="red", breaks=4)

hist(selected_data$Smoking, main="Histogram of Smoking", xlab="Smoking, (0 for smokers, 1 for non-smokers)", ylab="sample size", col="coral", border="black", breaks=4)

hist(selected_data$Age, main="Histogram of Age", xlab="Age", col="magenta", border="yellow", breaks=5)
mean_ag <- mean(data$Age)
sd_ag <- sd(data$Age)
curve(dnorm(x, mean=mean_ag, sd=sd_ag), add=TRUE, col="blue") # does not appear to fit the normal distribution

hist(selected_data$Ejection.Fraction, main="Histogram of Ejection Fraction", xlab="% Ejection Fraction", col="cyan", border="purple", breaks=10)
mean_ejf <- mean(data$Ejection.Fraction)
sd_ejf <- sd(data$Ejection.Fraction)
curve(dnorm(x, mean=mean_ejf, sd=sd_ejf), add=TRUE, col="red") # does not appear to fit the normal distribution with an increase close to 40% EF

#2
set.seed(4) 
rndm <- rnorm(100, mean=60, sd=15) # creating a random normal distribution of 85 values with a mean of 76 and a standard deviation of 25 and adding them to rndm vector
hist(rndm, main="Histogram of Random Normal Distribution", xlab="Value", ylab="Frequency", col="green", border="black", breaks=10) # creating a histogram of rndm with green color and black border
curve(dnorm(x, mean=60, sd=15), add=TRUE, col="red") # adding a curve to the histogram to see the theoretical form of the normal distribution and compare it with the histogram

cdf_data <- ecdf(rndm) # creating a cumulative distribution function (CDF) of pre-created rndm

plot(cdf_data, main="Cumulative Distribution Function (CDF)", xlab="Value", ylab="Cumulative Probability", col="green", lwd=5, xlim=c(200, 800)) # line width; x-axis limits
# creating a cdf graph of rndm with green color, line width of 5 and x-axis limited between 20-80
curve(dnorm(x, mean=60, sd=15), add=TRUE, col="red") # add=TRUE for adding the curve to existing plot; dnorm to see the theoretical form of the normal distribution and compare it with the ecdf 
# failed to fit the normal distribution

#3
trials <- 100

head_p <- 0.5 # Probability of heads, equal to tails

flips <- rbinom(100, trials, head_p) # generates random numbers based on the binomial distribution, heads=success represented by 1

num_heads <- sum(flips)

# Calculate probability of all heads (all elements in flips are 1)
p_all_heads <- mean(flips)  # Assuming all heads is all 1s in the flips vector

print(paste("Number of trials:", trials))
print(paste("Number of heads:", num_heads))
print(paste("Probability of all heads:", p_all_heads))

#4
normal_sales <- c(125, 432, 723, 98, 34, 112) # number of sold car models without discount
discount_sales <- c(148, 457, 809, 73, 57, 175) # number of sold car models with discount

results <- t.test(normal_sales, discount_sales) # performing a two-sample t-test on the two vectors
print(results) 
# t = -0.19988, df = 9.921, p-value = 0.8456
# small t value, no significant difference between the sales of two different groups
# p-value is higher than the typical significance level of 0.05

#5
plant_height <- c(8, 13, 16, 17, 21)
sunlight <- c(4, 5, 8, 9, 11)

model <- lm(plant_height ~ sunlight) 
summary(model)
# 1 unit increase in sunlight causes 1.6265 unit increase in plant height. It may be a statistically significant value with a low p-value (0.00728).
# Residuals: (residual: the point that didn't hit the line in the graph)
# 1         2       3       4       5 
#-1.4699  1.9036  0.0241 -0.6024  0.1446 

# 1st and 4th plants have negative residuals, actual values are lower than predicted values
# 2nd, 3rd, and 5th plants have positive residuals, actual values are higher than predicted values

# Multiple R-squared: 0.9344; the model attributes 93.44% of plant height variation to sunlight
# Adjusted R-squared: 0.9125; 91.25%; variables with negligible effects are not included in the model
# Residual standard error: 1.434, high standard error indicates that the model may not be a good fit
# F-statistic: 42.71, p-value: 0.00728; high f_statistic value with a low p value indicate the reliability of the regression