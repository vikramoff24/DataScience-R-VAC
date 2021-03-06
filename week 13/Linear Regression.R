#Simple linear analysis.
dataset=read.csv("Admission_Predict.csv")
gre=dataset[,2]
coa=dataset[,9]

data=data.frame(gre,coa)

library(caTools)
set.seed(123) #constant random gendration

split= sample.split(data$coa, SplitRatio = 0.8) #80% of data is made true 


#dividing into training and testing data with split value.
training_set = subset(data,split==TRUE)
testing_set=subset(data,split==FALSE)

View(training_set)
View(testing_set)

#making linear model 
#trainig phase
regressor = lm(formula = coa~gre, data = training_set) #lm -linear model

#testing phase
y_pred= predict(regressor, newdata=testing_set)

a=testing_set$coa
b=y_pred

plot(a,type='o',col='blue',
     xlab = 'Count', ylab = 'COA')
lines(b,type='o',col='red')

plot(testing_set$gre, a, type='p',col='blue',
     xlab = 'GRE', ylab = 'COA')
#linear line 
lines(testing_set$gre, b,type='o',col='red')