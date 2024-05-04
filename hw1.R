# Academy 2.0, Homework 1, March 13 2024
# R 4.3.3

# read and report
mouses <- read.csv("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv")
View(mouses)
print(mouses)

# What is the entry in the 12th row and second column?
entry <- mouses[12,2]
print(entry)

# report the weight of the mouse in the 11th row
entry2 <- mouses$Bodyweight[11]
print(entry2)

length(mouses$Bodyweight)#how many mice 

# mean of hf mouses
View(mouses)
high_fat <- seq(13, 24)
mean(high_fat)

# take a random sample
?sample
smp_mouse <- sample(13:24, 1, set.seed(1), replace = FALSE)
print(smp_mouse)

smp_mouse_body_weight <- mouses$Bodyweight[smp_mouse]
print(smp_mouse_body_weight)