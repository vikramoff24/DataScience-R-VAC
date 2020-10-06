#Dataset should be imported in the Evironment section.
View(My_friends)
str(My_friends)
dim(My_friends)
names(My_friends)
#$ is used for adding particular column.
#factor is another name for catogerical data in R
My_friends$Height<-as.factor(My_friends$Height) #as is used for converting one form into another form of data. 
View(My_friends)
str(My_friends)
levels(My_friends$Height) #displays category available in particular column
#I want to check who is eligible for military #age<26 
My_friends$Eligibility=My_friends$Age<26 #adding particular column 
View(My_friends) 
#creating Subset of particular condition.
Eligible=subset(My_friends,My_friends$Age<26)
View(Eligible)
