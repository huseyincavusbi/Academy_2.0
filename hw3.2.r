# Academy 2.0, Homework 3.2, March 23 2024, code description

set.seed(123) # To obtain the same results in different trials
mouse_weights <- rnorm(24, mean=25, sd=3) # 24 samples, mean 25, standard deviation 3

simulated_diffs <- replicate(10000, {
  # Randomly dividing mice into two groups
  shuffled_weights <- sample(mouse_weights)
  group_1 <- shuffled_weights[1:12]
  group_2 <- shuffled_weights[13:24]
  abs(mean(group_1) - mean(group_2))
}) # The weights of the mice are randomly sorted and divided into two groups, the mean differences of the two groups are calculated and the absolute value is taken, the process is repeated 10000 times

observed_diff <- 2.5 # Observed difference from the study
frequency <- mean(simulated_diffs >= observed_diff) # Simulation and observation are compared, the average of true and false values obtained are calculated
cat("The frequency with which the observed difference or a larger difference is obtained in simulations:", frequency)