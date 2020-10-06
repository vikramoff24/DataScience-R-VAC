#install library MASS
#turn on a library
library(MASS)
#toget details of inbuilt datasets
data()
#working with dataset
View(mtcars) #to view dataset
dim(Melanoma) #to get no of rows and cols
str(Melanoma) #displays the structure of dataset
head(Melanoma) #displays the details of the first row 
tail(Melanoma) #displays the details of the last row 
colnames(Melanoma) #show all the features (cols)
rownames(Melanoma) #shows all the rows.
#the datasets used here are the predefined one.