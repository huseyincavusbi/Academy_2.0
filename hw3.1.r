# Academy 2.0, Homework 3.1, March 23 2024, code description

mice_data <- data.frame(
  diet = c("low_calorie", "low_calorie", "normal", "normal", "normal", "low_calorie", "normal", "low_calorie"),
  weight = c(20, 22, 26, 28, 27, 21, 29, 23)
) # a data set including diet type and weight is being created

# Overview of the data set
print(head(mice_data))

# Separating weights according to diet types
low_calorie_diet <- mice_data[mice_data$diet == "low_calorie", "weight"] # accessing the diet-related column of the dataset and parsing the data related to low calorie diet
normal_diet <- mice_data[mice_data$diet == "normal", "weight"] # parsing data on normal diet

# Independent two sample t-test
t.test_result <- t.test(low_calorie_diet, normal_diet) # independent two-sample t-test is applied and the result assignment is performed

# Printing results
print(t.test_result)
