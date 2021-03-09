dataset = read.csv("Admission_Predict.csv")
data=dataset[,2:9]
View(data)

library(caTools)
set.seed(123) 

split = sample.split(data$Chance.of.Admit, SplitRatio = 0.8)
View(split)

training_set=subset(data,split==TRUE)
testing_set=subset(data,split==FALSE)
View(training_set)
View(testing_set)